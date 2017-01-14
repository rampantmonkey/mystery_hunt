all_members([H], L2) :- member(H, L2).
all_members([H|T],L2) :- member(H, L2), all_members(T, L2).

or([H]) :- H,!.
or([H|_]) :- H,!.
or([_|T]) :- or(T).

:- use_module(library(lists)).
count([], _, 0).
count([X|T],X,Y) :- count(T,X,Z), Y is 1+Z.
count([X1|T],X,Z) :- X1\=X,count(T,X,Z).

check() :-
  solve([a, Amity_length, 2], [b, Butternuts_length, 5], [c, Covert_length, 8], [g, Galen_length, 1], [l, LakeGeorge_length, 4], [m, Moira_length, 10], [o, Orange_length, 9], [r, Ramapo_length, 7], [s, Schuyler_length, 12], [s2, Solon_length, 11], [s4, Somers_length, 6], [w, Wellsville_length, 3]).

solve(Amity, Butternuts, Covert, Galen, LakeGeorge, Moira, Orange, Ramapo, Schuyler, Solon, Somers, Wellsville) :-
  % All cities
  Amity = [a, Amity_length, Amity_position], Amity_length = 5,
  Butternuts = [b, Butternuts_length, Butternuts_position], Butternuts_length = 10,
  Covert = [c, Covert_length, Covert_position], Covert_length = 6,
  Galen = [g, Galen_length, Galen_position], Galen_length = 5,
  LakeGeorge = [l, LakeGeorge_length, LakeGeorge_position], LakeGeorge_length = 10,
  Moira = [m, Moira_length, Moira_position], Moira_length = 5,
  Orange = [o, Orange_length, Orange_position], Orange_length = 6,
  Ramapo = [r, Ramapo_length, Ramapo_position], Ramapo_length = 6,
  Schuyler = [s, Schuyler_length, Schuyler_position], Schuyler_length = 8,
  Solon = [s2, Solon_length, Solon_position], Solon_length = 5,
  Somers = [s4, Somers_length, Somers_position], Somers_length = 6,
  Wellsville = [w, Wellsville_length, Wellsville_position], Wellsville_length = 10,

  % ensure all values exist once
  all_members([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], [Amity_position, Butternuts_position, Covert_position, Galen_position, LakeGeorge_position, Moira_position, Orange_position, Ramapo_position, Schuyler_position, Solon_position, Somers_position, Wellsville_position]),

  % grouping
  All = [Amity, Butternuts, Covert, Galen, LakeGeorge, Moira, Orange, Ramapo, Schuyler, Solon, Somers, Wellsville],

  % hint 11
  % covert comes directly before orange
  % (agent) -> covert agent / orange agent
  Orange_position - Covert_position =:= 1,

  % hint 8
  % |Amity_pos - Moira_pos| = 8
  member(Amity_position - Moira_position, [8, -8]),

  % hint 7
  Wellsville_position < LakeGeorge_position,
  LakeGeorge_position < Butternuts_position,

  % hint 4
  % still thinking...
  % Solon, Galen, Moira
  % either first and second to last
  %   or second and last
  Hint4Subset = [Solon_position, Galen_position, Moira_position],
  member(Hint4_1_position, Hint4Subset),
  member(Hint4_2_position, Hint4Subset),
  Hint4_1_position - Hint4_2_position =:= 10,

  % hint 6
  Somers_position - Ramapo_position =:= 1,

  % hint 5
  member(Butternuts_position - Orange_position, [4, -4]),

  % hint 2
  Amity_position - Galen_position =:= 1,

  % hint 9
  Schuyler_position - Solon_position =:= 1,

  % hint 1
  member(Solon_position - Moira_position, [1, -1]),

  % hint 10

  % things with letters in New York
  Amity_position < 5,
  LakeGeorge_position < 5,
  Wellsville_position < 5,

  % hint 3
  % travel between towns with different numbers of letters in their names in exactly four out of the eleven legs of the tour.
  member([_, Hint3_1_len, 1], All),
  member([_, Hint3_2_len, 2], All),
  member([_, Hint3_3_len, 3], All),
  member([_, Hint3_4_len, 4], All),
  member([_, Hint3_5_len, 5], All),
  member([_, Hint3_6_len, 6], All),
  member([_, Hint3_7_len, 7], All),
  member([_, Hint3_8_len, 8], All),
  member([_, Hint3_9_len, 9], All),
  member([_, Hint3_10_len, 10], All),
  member([_, Hint3_11_len, 11], All),
  member([_, Hint3_12_len, 12], All),

  count([(Hint3_1_len - Hint3_2_len),
         (Hint3_2_len - Hint3_3_len),
         (Hint3_3_len - Hint3_4_len),
         (Hint3_4_len - Hint3_5_len),
         (Hint3_5_len - Hint3_6_len),
         (Hint3_6_len - Hint3_7_len),
         (Hint3_7_len - Hint3_8_len),
         (Hint3_8_len - Hint3_9_len),
         (Hint3_9_len - Hint3_10_len),
         (Hint3_10_len - Hint3_11_len),
         (Hint3_11_len - Hint3_12_len)],
          0, 7).
