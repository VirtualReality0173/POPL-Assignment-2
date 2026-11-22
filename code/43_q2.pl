
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
