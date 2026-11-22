
:- consult('../code/43_q1.pl').

test_candidate_count :-
    findall(S, candidate_solution(S), All),
    length(All, N),
    sort(All, Unique),
    length(Unique, U),
    N =:= 13824,
    U =:= 13824,
    writeln('Candidate generation test passed: 13824 unique candidates').
