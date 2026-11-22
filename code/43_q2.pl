
% eval_expr(+Expr, -Value)
% Evaluates an arithmetic expression tree.
%
% Expression representation:
%   num(N)
%   op(Operator, Left, Right)

eval_expr(num(N), N) :-
    integer(N).

eval_expr(op(Op, Left, Right), Value) :-
    eval_expr(Left, LeftValue),
    eval_expr(Right, RightValue),
    eval_operation(Op, LeftValue, RightValue, Value).

% Addition
eval_operation('+', A, B, Value) :-
    Value is A + B.

% Subtraction
eval_operation('-', A, B, Value) :-
    Value is A - B.

% Multiplication
eval_operation('*', A, B, Value) :-
    Value is A * B.

% Exact integer division only
eval_operation('/', A, B, Value) :-
    B =\= 0,
    0 is A mod B,
    Value is A // B.



:- use_module(library(lists)).

% ==================================================
% P2.a - Generate one valid arithmetic equation
% ==================================================

% generate_equation(+List, -Equation)
% Returns one valid equation as an SWI-Prolog string.
% Fails if no valid equation exists.

generate_equation(List, Equation) :-
    once(equation_tree(List, LeftTree, RightTree)),
    tree_string(LeftTree, LeftStr),
    tree_string(RightTree, RightStr),
    format(string(Equation), "~w=~w", [LeftStr, RightStr]).


% ==================================================
% Generate matching expression trees for both sides
% ==================================================

% equation_tree(+List, -LeftTree, -RightTree)

equation_tree(List, LeftTree, RightTree) :-
    append(Left, Right, List),
    Left = [_|_],
    Right = [_|_],
    expr_tree(Left, LeftTree, Value),
    expr_tree(Right, RightTree, Value).


% ==================================================
% Expression tree generation and evaluation
% ==================================================

% Expression representation:
% num(N)
% op(Operator, LeftTree, RightTree)

% Base case: a single number.

expr_tree([N], num(N), N).

% Recursive case: divide the numbers into two nonempty parts.

expr_tree(Numbers, op(Op, LeftTree, RightTree), Value) :-
    append(Left, Right, Numbers),
    Left = [_|_],
    Right = [_|_],
    expr_tree(Left, LeftTree, LeftValue),
    expr_tree(Right, RightTree, RightValue),
    apply_op(Op, LeftValue, RightValue, Value).


% ==================================================
% Arithmetic operations
% ==================================================

apply_op('+', X, Y, V) :-
    V is X + Y.

apply_op('-', X, Y, V) :-
    V is X - Y.

apply_op('*', X, Y, V) :-
    V is X * Y.

apply_op('/', X, Y, V) :-
    Y =\= 0,
    X mod Y =:= 0,
    V is X // Y.


% ==================================================
% Canonical expression formatting
% ==================================================

% Numbers are never parenthesized.

tree_string(num(N), String) :-
    format(string(String), "~d", [N]).

% Format binary expression trees.

tree_string(op(Op, Left, Right), String) :-
    prec(op(Op, Left, Right), ParentPrec),
    left_string(Left, ParentPrec, LeftStr),
    right_string(Right, ParentPrec, RightStr),
    format(string(String), "~w~w~w",
           [LeftStr, Op, RightStr]).


% Left operand: parentheses only when child precedence is lower.

left_string(Tree, ParentPrec, String) :-
    tree_string(Tree, Str),
    prec(Tree, ChildPrec),
    (   ChildPrec < ParentPrec
    ->  format(string(String), "(~w)", [Str])
    ;   String = Str
    ).


% Right operand: parentheses when child precedence is equal or lower.

right_string(Tree, ParentPrec, String) :-
    tree_string(Tree, Str),
    prec(Tree, ChildPrec),
    (   ChildPrec =< ParentPrec
    ->  format(string(String), "(~w)", [Str])
    ;   String = Str
    ).


% ==================================================
% Operator precedence
% ==================================================

% Numbers have the highest precedence.

prec(num(_), 3).

prec(op(Op, _, _), P) :-
    op_prec(Op, P).

op_prec('+', 1).
op_prec('-', 1).
op_prec('*', 2).
op_prec('/', 2).




