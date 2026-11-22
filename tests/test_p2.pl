
:- consult('../code/43_q2.pl').

% ==================================================
% P2.a - generate_equation/2 tests
% ==================================================

test_generate_main :-
    generate_equation([4,2,5,3], E),
    member(E, [
        "4*2-5=3",
        "4*2=5+3",
        "4-2=5-3",
        "4/2=5-3",
        "4=2*(5-3)",
        "4=2+(5-3)",
        "4=2+5-3"
    ]),
    string(E),
    writeln('P2.a main example passed').

test_generate_simple :-
    generate_equation([2,4,8], "2*4=8"),
    writeln('P2.a simple equation passed').

test_generate_no_solution :-
    \+ generate_equation([2,3,4], _),
    writeln('P2.a no-solution test passed').

test_generate_empty :-
    \+ generate_equation([], _),
    writeln('P2.a empty-list test passed').

test_generate_single :-
    \+ generate_equation([5], _),
    writeln('P2.a single-element test passed').


% ==================================================
% P2.b - all_equations/2 tests
% ==================================================

test_all_main :-
    all_equations([4,2,5,3], Es),
    Es = [
        "4*2-5=3",
        "4*2=5+3",
        "4-2=5-3",
        "4/2=5-3",
        "4=2*(5-3)",
        "4=2+(5-3)",
        "4=2+5-3"
    ],
    writeln('P2.b main example passed').

test_all_no_solution :-
    all_equations([2,3,4], []),
    writeln('P2.b no-solution test passed').

test_all_simple :-
    all_equations([2,4,8], ["2*4=8"]),
    writeln('P2.b simple equation passed').

test_all_empty :-
    all_equations([], []),
    writeln('P2.b empty-list test passed').


% ==================================================
% count_equations/2 tests
% ==================================================

test_count_main :-
    count_equations([4,2,5,3], 7),
    writeln('Count test passed: 7 equations').

test_count_no_solution :-
    count_equations([2,3,4], 0),
    writeln('Count test passed: 0 equations').

test_count_simple :-
    count_equations([2,4,8], 1),
    writeln('Count test passed: 1 equation').

test_count_empty :-
    count_equations([], 0),
    writeln('Empty-list count test passed').


% ==================================================
% Run all P2 tests
% ==================================================

run_tests :-
    test_generate_main,
    test_generate_simple,
    test_generate_no_solution,
    test_generate_empty,
    test_generate_single,
    test_all_main,
    test_all_no_solution,
    test_all_simple,
    test_all_empty,
    test_count_main,
    test_count_no_solution,
    test_count_simple,
    test_count_empty,
    writeln('All P2 tests passed!').
