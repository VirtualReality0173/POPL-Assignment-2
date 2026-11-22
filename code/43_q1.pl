:- use_module(library(lists)).   % permutation/2

% candidate_solution(-Solution)
% Solution is a structurally valid assignment for Alex, Ben, Carla and Dana,
% in that fixed order. Each department, language and project is used exactly
% once. No puzzle clues are applied here.
candidate_solution([p('Alex', D1, L1, P1),
                    p('Ben',  D2, L2, P2),
                    p('Carla',D3, L3, P3),
                    p('Dana', D4, L4, P4)]) :-
    permutation([research, development, design, testing],  [D1, D2, D3, D4]),
    permutation([python, java, 'c++', javascript],         [L1, L2, L3, L4]),
    permutation(['AI', web, embedded, data],               [P1, P2, P3, P4]).


% clue(1, +Solution)
% Clue 1: the person working on the 'AI' project is neither in the
% research department nor Dana.
clue(1, Solution) :-
    member(p(Name, Dept, _Lang, 'AI'), Solution),
    Name \== 'Dana',
    Dept \== research.

% clue(+N, +Solution)  (clause for 1 already exists; 2-8 added below)

% Clue 2: Alex is neither in development nor using C++.
clue(2, Solution) :-
    member(p('Alex', Dept, Lang, _), Solution),
    Dept \== development,
    Lang \== 'c++'.

% Clue 3: the person in testing uses Python.
clue(3, Solution) :-
    member(p(_, testing, python, _), Solution).

% Clue 4: Ben works on web and is not in testing.
clue(4, Solution) :-
    member(p('Ben', Dept, _, web), Solution),
    Dept \== testing.

% Clue 5: the Java user works in design.
clue(5, Solution) :-
    member(p(_, design, java, _), Solution).

% Clue 6: Carla is neither assigned embedded nor in development.
clue(6, Solution) :-
    member(p('Carla', Dept, _, Proj), Solution),
    Proj \== embedded,
    Dept \== development.

% Clue 7: Dana does not use Java and works in research or testing.
clue(7, Solution) :-
    member(p('Dana', Dept, Lang, _), Solution),
    Lang \== java,
    ( Dept == research ; Dept == testing ).

% Clue 8: the data project is in research and does not use JavaScript.
clue(8, Solution) :-
    member(p(_, research, Lang, data), Solution),
    Lang \== javascript.

% satisfies_clues(+Active, +Solution)
% Succeeds iff every clue number in Active holds for Solution.
% Clues not listed in Active are not checked. An empty list always succeeds.
satisfies_clues([], _Solution).
satisfies_clues([N|Rest], Solution) :-
    clue(N, Solution),
    satisfies_clues(Rest, Solution).



% main/0
% Selects the first candidate satisfying clues 1-8 and prints one line per friend.
main :-
    once(( candidate_solution(Solution),
           satisfies_clues([1,2,3,4,5,6,7,8], Solution) )),
    Solution = [ p('Alex',  D1, L1, P1),
                 p('Ben',   D2, L2, P2),
                 p('Carla', D3, L3, P3),
                 p('Dana',  D4, L4, P4) ],
    format("Alex = [~w, ~w, ~w]~n",  [D1, L1, P1]),
    format("Ben = [~w, ~w, ~w]~n",   [D2, L2, P2]),
    format("Carla = [~w, ~w, ~w]~n", [D3, L3, P3]),
    format("Dana = [~w, ~w, ~w]~n",  [D4, L4, P4]).