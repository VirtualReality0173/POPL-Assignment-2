
:- consult('../code/43_q1.pl').

test_candidate_count :-
    findall(S, candidate_solution(S), All),
    length(All, N),
    sort(All, Unique),
    length(Unique, U),
    N =:= 13824,
    U =:= 13824,
    writeln('Candidate generation test passed: 13824 unique candidates').

clue(1, [
    p('Alex', design, python, 'AI'),
    p('Ben', research, java, web),
    p('Carla', development, 'c++', embedded),
    p('Dana', testing, javascript, data)
]).

clue(1, [
    p('Alex', research, python, 'AI'),
    p('Ben', development, java, web),
    p('Carla', design, 'c++', embedded),
    p('Dana', testing, javascript, data)
]).