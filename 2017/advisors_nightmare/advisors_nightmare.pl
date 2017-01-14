:- use_module(library(clpfd)).

all_members([H], L2) :- member(H, L2).
all_members([H|T],L2) :- member(H, L2), all_members(T, L2).

all_diff(List) :-
  \+ (select(X, List, R), memberchk(X, R)).

solve(Schedule) :-
  Schedule = [C01_1, C01_2, C01_3, C02_1, C02_2, C02_3, C03_1, C03_2, C03_3, C04_1, C04_2, C04_3, C05_1, C05_2, C05_3, C06_1, C06_2, C06_3, C07_1, C07_2, C07_3, C08_1, C08_2, C08_3, C09_1, C09_2, C09_3, C10_1, C10_2, C10_3, C11_1, C11_2, C11_3, C12_1, C12_2, C12_3],
  % Matt's constraints
  % member([e332, 1, 1], Schedule),
  C01_1 = [e332, 1, 1],
  E332_trimester = 1,

  member([e308, 4, 1], Schedule),
  E308_trimester = 1,

  member([e390, 2, 2], Schedule),
  E390_trimester = 2,
  % member([e373, 5, 2], Schedule),
  E373_trimester = 2,
  C02_3 = [e373, 5, 2],

  member([e516, 4, 3], Schedule),
  E516_trimester = 3,

  % member([e397, 1, 4], Schedule),
  E397_trimester = 4,
  C04_1 = [e397, 1, 4],

  % member([e512, 1, 6], Schedule),
  E512_trimester = 6,
  C06_1 = [e512, 1, 6],

  member([e272, 3, 7], Schedule),
  E272_trimester = 7,

  member([e344, 4, 8], Schedule),
  E344_trimester = 8,

  % member([e530, 5, 9], Schedule),
  E530_trimester = 9,
  C09_3 = [e530, 5, 9],

  % member([e199, 5, 10], Schedule),
  E199_trimester = 10,
  C10_3 = [e199, 5, 10],

  % member([e361, 1, 11], Schedule),
  E361_trimester = 11,
  C11_1 = [e361, 1, 11],

  % member([e504, 1, 12], Schedule),
  E504_trimester = 12,
  C12_1 = [e504, 1, 12],
  member([e343, 3, 12], Schedule),
  E343_trimester = 12,

  Offerings = [
    % fall 2017
    [e102,   1, 1], [e156,   1, 1], [e332, 1, 1], [e397, 1, 1], [e474, 1, 1],
    [e176,   2, 1], [e265,   2, 1], [e289, 2, 1], [e361, 2, 1], [e373, 2, 1],
    [e145_1, 3, 1], [e145_2, 3, 1], [e199, 3, 1], [e390, 3, 1], [e402, 3, 1], [e438, 3, 1],
    [e115,   4, 1], [e234,   4, 1], [e308, 4, 1], [e426, 4, 1], [e428, 4, 1],
    [e128,   5, 1], [e180,   5, 1], [e272, 5, 1], [e421, 5, 1], [e468, 5, 1],

    % winter 2017
    [e308,1, 2], [e361,  1, 2], [e402,  1, 2], [e440,1, 2], [e468,1, 2],
    [e128,2, 2], [e176,  2, 2], [e253,  2, 2], [e390,2, 2], [e474,2, 2],
    [e156,3, 2], [e265,  3, 2], [e344,  3, 2], [e421,3, 2], [e428,3, 2],
    [e205,4, 2], [e234,  4, 2], [e289,  4, 2], [e332,4, 2], [e438,4, 2],
    [e115,5, 2], [e145_1,5, 2], [e145_2,5, 2], [e180,5, 2], [e373,5, 2], [e426,5, 2],

    % Spring2018
    [e176, 1, 3], [e421, 1, 3], [e428, 1, 3], [e468, 1, 3], [e475, 1, 3],
    [e156, 2, 3], [e205, 2, 3], [e373, 2, 3], [e390, 2, 3], [e402, 2, 3],
    [e289, 3, 3], [e308, 3, 3], [e361, 3, 3], [e512, 3, 3], [e530, 3, 3],
    [e115, 4, 3], [e234, 4, 3], [e343, 4, 3], [e426, 4, 3], [e516, 4, 3],
    [e180, 5, 3], [e265, 5, 3], [e332, 5, 3], [e438, 5, 3], [e504, 5, 3],

    % fall 2018
    [e115,   1, 4], [e390,   1, 4], [e397, 1, 4], [e426, 1, 4], [e468, 1, 4],
    [e128,   2, 4], [e156,   2, 4], [e373, 2, 4], [e428, 2, 4], [e438, 2, 4],
    [e180,   3, 4], [e199,   3, 4], [e265, 3, 4], [e361, 3, 4], [e421, 3, 4],
    [e145_1, 4, 4], [e145_2, 4, 4], [e234, 4, 4], [e272, 4, 4], [e289, 4, 4], [e308, 4, 4],
    [e102,   5, 4], [e176,   5, 4], [e332, 5, 4], [e402, 5, 4], [e474, 5, 4],

    % winter 2018
    [e176, 1, 5], [e361,   1, 5], [e421,   1, 5], [e426, 1, 5], [e440, 1, 5],
    [e180, 2, 5], [e205,   2, 5], [e234,   2, 5], [e332, 2, 5], [e344, 2, 5],
    [e128, 3, 5], [e156,   3, 5], [e373,   3, 5], [e390, 3, 5], [e438, 3, 5],
    [e115, 4, 5], [e145_1, 4, 5], [e145_2, 4, 5], [e289, 4, 5], [e402, 4, 5], [e474, 4, 5],
    [e253, 5, 5], [e265,   5, 5], [e308,   5, 5], [e428, 5, 5], [e468, 5, 5],

    % spring 2019
    [e176, 1, 6], [e361, 1, 6], [e468, 1, 6], [e512, 1, 6], [e516, 1, 6],
    [e234, 2, 6], [e265, 2, 6], [e343, 2, 6], [e438, 2, 6], [e475, 2, 6],
    [e156, 3, 6], [e205, 3, 6], [e332, 3, 6], [e421, 3, 6], [e504, 3, 6],
    [e180, 4, 6], [e308, 4, 6], [e402, 4, 6], [e426, 4, 6], [e530, 4, 6],
    [e115, 5, 6], [e289, 5, 6], [e373, 5, 6], [e390, 5, 6], [e428, 5, 6],

    % fall 2019
    [e145_1, 1, 7], [e145_2, 1, 7], [e199, 1, 7], [e332, 1, 7], [e390, 1, 7], [e397, 1, 7],
    [e115,   2, 7], [e265,   2, 7], [e373, 2, 7], [e426, 2, 7], [e438, 2, 7],
    [e102,   3, 7], [e128,   3, 7], [e272, 3, 7], [e421, 3, 7], [e468, 3, 7],
    [e176,   4, 7], [e180,   4, 7], [e289, 4, 7], [e308, 4, 7], [e474, 4, 7],
    [e156,   5, 7], [e234,   5, 7], [e361, 5, 7], [e402, 5, 7], [e428, 5, 7],

    %Winter2019
    [e145_1, 1, 8], [e145_2, 1, 8], [e156, 1, 8], [e176, 1, 8], [e361, 1, 8], [e426, 1, 8],
    [e205,   2, 8], [e253,   2, 8], [e265, 2, 8], [e440, 2, 8], [e468, 2, 8],
    [e115,   3, 8], [e289,   3, 8], [e373, 3, 8], [e428, 3, 8], [e438, 3, 8],
    [e128,   4, 8], [e332,   4, 8], [e344, 4, 8], [e421, 4, 8], [e474, 4, 8],
    [e180,   5, 8], [e234,   5, 8], [e308, 5, 8], [e390, 5, 8], [e402, 5, 8],

    %Spring2020
    [e289, 1, 9], [e308, 1, 9], [e332, 1, 9], [e343, 1, 9], [e428, 1, 9],
    [e176, 2, 9], [e361, 2, 9], [e421, 2, 9], [e426, 2, 9], [e468, 2, 9],
    [e115, 3, 9], [e205, 3, 9], [e402, 3, 9], [e438, 3, 9], [e504, 3, 9],
    [e156, 4, 9], [e180, 4, 9], [e475, 4, 9], [e512, 4, 9], [e516, 4, 9],
    [e234, 5, 9], [e265, 5, 9], [e373, 5, 9], [e390, 5, 9], [e530, 5, 9],

    %Fall2020
    [e115,   1, 10], [e289,   1, 10], [e426, 1, 10], [e438, 1, 10], [e474, 1, 10],
    [e145_1, 2, 10], [e145_2, 2, 10], [e157, 2, 10], [e176, 2, 10], [e421, 2, 10], [e468, 2, 10],
    [e102,   3, 10], [e128,   3, 10], [e265, 3, 10], [e332, 3, 10], [e390, 3, 10],
    [e234,   4, 10], [e308,   4, 10], [e361, 4, 10], [e397, 4, 10], [e428, 4, 10],
    [e180,   5, 10], [e199,   5, 10], [e272, 5, 10], [e373, 5, 10], [e402, 5, 10],

    %Winter2020
    [e176,   1, 11], [e332,   1, 11], [e344, 1, 11], [e361, 1, 11], [e474, 1, 11],
    [e205,   2, 11], [e253,   2, 11], [e289, 2, 11], [e373, 2, 11], [e421, 2, 11],
    [e115,   3, 11], [e156,   3, 11], [e180, 3, 11], [e428, 3, 11], [e468, 3, 11],
    [e145_1, 4, 11], [e145_2, 4, 11], [e234, 4, 11], [e426, 4, 11], [e438, 4, 11], [e440, 4, 11],
    [e128,   5, 11], [e265,   5, 11], [e308, 5, 11], [e390, 5, 11], [e402, 5, 11],

    %Spring2021
    [e308, 1, 12], [e361, 1, 21], [e390, 1, 12], [e475, 1, 12], [e504, 1, 12],
    [e180, 2, 12], [e205, 2, 21], [e234, 2, 12], [e265, 2, 12], [e530, 2, 12],
    [e176, 3, 12], [e289, 3, 21], [e343, 3, 12], [e421, 3, 12], [e438, 3, 12],
    [e332, 4, 12], [e426, 4, 21], [e428, 4, 12], [e468, 4, 12], [e516, 4, 12],
    [e115, 5, 12], [e156, 5, 21], [e373, 5, 12], [e402, 5, 12], [e512, 5, 12]
  ],

  all_members(Schedule, Offerings),

  all_members(
  [e102, e115, e128, e145_1, e145_2, e156, e176, e180, e199, e205, e234, e253, e265, e272, e289, e308, e332, e343, e344, e361, e373, e390, e397, e402, e421, e426, e428, e438, e440, e468, e474, e475, e504, e512, e516, e530],
  [C01_1_num, C01_2_num, C01_3_num, C02_1_num, C02_2_num, C02_3_num, C03_1_num, C03_2_num, C03_3_num, C04_1_num, C04_2_num, C04_3_num, C05_1_num, C05_2_num, C05_3_num, C06_1_num, C06_2_num, C06_3_num, C07_1_num, C07_2_num, C07_3_num, C08_1_num, C08_2_num, C08_3_num, C09_1_num, C09_2_num, C09_3_num, C10_1_num, C10_2_num, C10_3_num, C11_1_num, C11_2_num, C11_3_num, C12_1_num, C12_2_num, C12_3_num]
  ),

  C01_1 = [C01_1_num, C01_1_slot,  1],
  C01_2 = [C01_2_num, C01_2_slot,  1],
  C01_3 = [C01_3_num, C01_3_slot,  1],
  C02_1 = [C02_1_num, C02_1_slot,  2],
  C02_2 = [C02_2_num, C02_2_slot,  2],
  C02_3 = [C02_3_num, C02_3_slot,  2],
  C03_1 = [C03_1_num, C03_1_slot,  3],
  C03_2 = [C03_2_num, C03_2_slot,  3],
  C03_3 = [C03_3_num, C03_3_slot,  3],
  C04_1 = [C04_1_num, C04_1_slot,  4],
  C04_2 = [C04_2_num, C04_2_slot,  4],
  C04_3 = [C04_3_num, C04_3_slot,  4],
  C05_1 = [C05_1_num, C05_1_slot,  5],
  C05_2 = [C05_2_num, C05_2_slot,  5],
  C05_3 = [C05_3_num, C05_3_slot,  5],
  C06_1 = [C06_1_num, C06_1_slot,  6],
  C06_2 = [C06_2_num, C06_2_slot,  6],
  C06_3 = [C06_3_num, C06_3_slot,  6],
  C07_1 = [C07_1_num, C07_1_slot,  7],
  C07_2 = [C07_2_num, C07_2_slot,  7],
  C07_3 = [C07_3_num, C07_3_slot,  7],
  C08_1 = [C08_1_num, C08_1_slot,  8],
  C08_2 = [C08_2_num, C08_2_slot,  8],
  C08_3 = [C08_3_num, C08_3_slot,  8],
  C09_1 = [C09_1_num, C09_1_slot,  9],
  C09_2 = [C09_2_num, C09_2_slot,  9],
  C09_3 = [C09_3_num, C09_3_slot,  9],
  C10_1 = [C10_1_num, C10_1_slot, 10],
  C10_2 = [C10_2_num, C10_2_slot, 10],
  C10_3 = [C10_3_num, C10_3_slot, 10],
  C11_1 = [C11_1_num, C11_1_slot, 11],
  C11_2 = [C11_2_num, C11_2_slot, 11],
  C11_3 = [C11_3_num, C11_3_slot, 11],
  C12_1 = [C12_1_num, C12_1_slot, 12],
  C12_2 = [C12_2_num, C12_2_slot, 12],
  C12_3 = [C12_3_num, C12_3_slot, 12],


  % START
  C01_1_slot in 1..3,
  C01_2_slot in 2..4,
  C01_3_slot in 3..5,
  C01_1_slot #<
  C01_2_slot,
  C01_2_slot #<
  C01_3_slot,

  C02_1_slot in 1..3,
  C02_2_slot in 2..4,
  C02_3_slot in 3..5,
  C02_1_slot #<
  C02_2_slot,
  C02_2_slot #<
  C02_3_slot,

  C03_1_slot in 1..3,
  C03_2_slot in 2..4,
  C03_3_slot in 3..5,
  C03_1_slot #<
  C03_2_slot,
  C03_2_slot #<
  C03_3_slot,

  C04_1_slot in 1..3,
  C04_2_slot in 2..4,
  C04_3_slot in 3..5,
  C04_1_slot #<
  C04_2_slot,
  C04_2_slot #<
  C04_3_slot,

  C05_1_slot in 1..3,
  C05_2_slot in 2..4,
  C05_3_slot in 3..5,
  C05_1_slot #<
  C05_2_slot,
  C05_2_slot #<
  C05_3_slot,

  C06_1_slot in 1..3,
  C06_2_slot in 2..4,
  C06_3_slot in 3..5,
  C06_1_slot #<
  C06_2_slot,
  C06_2_slot #<
  C06_3_slot,

  C07_1_slot in 1..3,
  C07_2_slot in 2..4,
  C07_3_slot in 3..5,
  C07_1_slot #<
  C07_2_slot,
  C07_2_slot #<
  C07_3_slot,

  C08_1_slot in 1..3,
  C08_2_slot in 2..4,
  C08_3_slot in 3..5,
  C08_1_slot #<
  C08_2_slot,
  C08_2_slot #<
  C08_3_slot,

  C09_1_slot in 1..3,
  C09_2_slot in 2..4,
  C09_3_slot in 3..5,
  C09_1_slot #<
  C09_2_slot,
  C09_2_slot #<
  C09_3_slot,

  C10_1_slot in 1..3,
  C10_2_slot in 2..4,
  C10_3_slot in 3..5,
  C10_1_slot #<
  C10_2_slot,
  C10_2_slot #<
  C10_3_slot,

  C11_1_slot in 1..3,
  C11_2_slot in 2..4,
  C11_3_slot in 3..5,
  C11_1_slot #<
  C11_2_slot,
  C11_2_slot #<
  C11_3_slot,

  C12_1_slot in 1..3,
  C12_2_slot in 2..4,
  C12_3_slot in 3..5,
  C12_1_slot #<
  C12_2_slot,
  C12_2_slot #<
  C12_3_slot,
  % END

  % member(C01_1_slot,  [1, 2, 3]),
  % member(C01_2_slot,  [2, 3, 4]),
  % member(C01_3_slot,  [3, 4, 5]),
  % C01_1_slot <
  % C01_2_slot,
  % C01_2_slot <
  % C01_3_slot,

  % member(C02_1_slot,  [1, 2, 3]),
  % member(C02_2_slot,  [2, 3, 4]),
  % member(C02_3_slot,  [3, 4, 5]),
  % C02_1_slot <
  % C02_2_slot,
  % C02_2_slot <
  % C02_3_slot,

  % member(C03_1_slot,  [1, 2, 3]),
  % member(C03_2_slot,  [2, 3, 4]),
  % member(C03_3_slot,  [3, 4, 5]),
  % C03_1_slot <
  % C03_2_slot,
  % C03_2_slot <
  % C03_3_slot,

  % member(C04_1_slot,  [1, 2, 3]),
  % member(C04_2_slot,  [2, 3, 4]),
  % member(C04_3_slot,  [3, 4, 5]),
  % C04_1_slot <
  % C04_2_slot,
  % C04_2_slot <
  % C04_3_slot,

  % member(C05_1_slot,  [1, 2, 3]),
  % member(C05_2_slot,  [2, 3, 4]),
  % member(C05_3_slot,  [3, 4, 5]),
  % C05_1_slot <
  % C05_2_slot,
  % C05_2_slot <
  % C05_3_slot,

  % member(C06_1_slot,  [1, 2, 3]),
  % member(C06_2_slot,  [2, 3, 4]),
  % member(C06_3_slot,  [3, 4, 5]),
  % C06_1_slot <
  % C06_2_slot,
  % C06_2_slot <
  % C06_3_slot,

  % member(C07_1_slot,  [1, 2, 3]),
  % member(C07_2_slot,  [2, 3, 4]),
  % member(C07_3_slot,  [3, 4, 5]),
  % C07_1_slot <
  % C07_2_slot,
  % C07_2_slot <
  % C07_3_slot,

  % member(C08_1_slot,  [1, 2, 3]),
  % member(C08_2_slot,  [2, 3, 4]),
  % member(C08_3_slot,  [3, 4, 5]),
  % C08_1_slot <
  % C08_2_slot,
  % C08_2_slot <
  % C08_3_slot,

  % member(C09_1_slot,  [1, 2, 3]),
  % member(C09_2_slot,  [2, 3, 4]),
  % member(C09_3_slot,  [3, 4, 5]),
  % C09_1_slot <
  % C09_2_slot,
  % C09_2_slot <
  % C09_3_slot,

  % member(C10_1_slot,  [1, 2, 3]),
  % member(C10_2_slot,  [2, 3, 4]),
  % member(C10_3_slot,  [3, 4, 5]),
  % C10_1_slot <
  % C10_2_slot,
  % C10_2_slot <
  % C10_3_slot,

  % member(C11_1_slot,  [1, 2, 3]),
  % member(C11_2_slot,  [2, 3, 4]),
  % member(C11_3_slot,  [3, 4, 5]),
  % C11_1_slot <
  % C11_2_slot,
  % C11_2_slot <
  % C11_3_slot,

  % member(C12_1_slot,  [1, 2, 3]),
  % member(C12_2_slot,  [2, 3, 4]),
  % member(C12_3_slot,  [3, 4, 5]),
  % C12_1_slot <
  % C12_2_slot,
  % C12_2_slot <
  % C12_3_slot,

  member([e102,   _, E102_trimester],   Schedule),
  member([e115,   _, E115_trimester],   Schedule),
  member([e128,   _, E128_trimester],   Schedule),
  member([e145_1, _, E145_1_trimester], Schedule),
  member([e145_2, _, E145_2_trimester], Schedule),
  member([e156,   _, E156_trimester],   Schedule),
  member([e176,   _, E176_trimester],   Schedule),
  member([e180,   _, E180_trimester],   Schedule),
  member([e199,   _, E199_trimester],   Schedule),
  member([e205,   _, E205_trimester],   Schedule),
  member([e234,   _, E234_trimester],   Schedule),
  member([e253,   _, E253_trimester],   Schedule),
  member([e265,   _, E265_trimester],   Schedule),
  member([e272,   _, E272_trimester],   Schedule),
  member([e289,   _, E289_trimester],   Schedule),
  member([e308,   _, E308_trimester],   Schedule),
  member([e332,   _, E332_trimester],   Schedule),
  member([e343,   _, E343_trimester],   Schedule),
  member([e344,   _, E344_trimester],   Schedule),
  member([e361,   _, E361_trimester],   Schedule),
  member([e373,   _, E373_trimester],   Schedule),
  member([e390,   _, E390_trimester],   Schedule),
  member([e397,   _, E397_trimester],   Schedule),
  member([e402,   _, E402_trimester],   Schedule),
  member([e421,   _, E421_trimester],   Schedule),
  member([e426,   _, E426_trimester],   Schedule),
  member([e428,   _, E428_trimester],   Schedule),
  member([e438,   _, E438_trimester],   Schedule),
  member([e440,   _, E440_trimester],   Schedule),
  member([e468,   _, E468_trimester],   Schedule),
  member([e474,   _, E474_trimester],   Schedule),
  member([e475,   _, E475_trimester],   Schedule),
  member([e504,   _, E504_trimester],   Schedule),
  member([e512,   _, E512_trimester],   Schedule),
  member([e516,   _, E516_trimester],   Schedule),
  member([e530,   _, E530_trimester],   Schedule),

  % ENGM 102
  member(E102_trimester - E102_trimester, [-1, 1]),
  member(E102_trimester, [1, 4, 7, 10]),

  % ENGM 115
  dif(E115_trimester, E265_trimester),

  % ENGM 128
  member(E128_trimester, [1, 2, 4, 5, 7, 8, 10, 11]),

  % Engm 145
  E145_1_trimester #> E390_trimester,
  E145_2_trimester #> E145_1_trimester,
  member(E145_1_trimester, [1, 2, 4, 5, 7, 8, 10, 11]),
  member(E145_2_trimester, [1, 2, 4, 5, 7, 8, 10, 11]),

  % Engm 156
  member(E156_trimester - E512_trimester, [-1, 1]),

  % Engm 176
  E176_trimester #= E438_trimester + 1,

  % Engm 180
  E180_trimester #> E234_trimester,

  % e199
  E199_trimester #> E344_trimester,
  member(E199_trimester, [1, 4, 7, 10]),

  % e205
  E205_trimester #= E128_trimester,
  member(E205_trimester, [1, 4, 7, 10]),

  % e234
  % No conditions

  % e253
  E253_trimester #> E530_trimester,
  member(E253_trimester, [2, 5, 8, 11]),

  % e265
  member(E265_trimester - E102_trimester, [-1, 1]),

  % e272
  E272_trimester #> E512_trimester,
  member(E272_trimester, [1, 4, 7, 10]),

  % e289
  % Must be taken immediately before and after a Sudoku seminar aka Sudoku Sandwich
  E289_trimester #< 12,
  E289_trimester #> 1,
  member(E289_trimester - 1, Sudokus),
  member(E289_trimester + 1, Sudokus),

  % e308
  % Already covered by `Matt's constraints`
  % E308_trimester =:= E332_trimester,

  % e332
  % No conditions

  % e343
  E343_trimester #> E199_trimester,
  member(E343_trimester, [3, 6, 9, 12]),

  % e344
  E344_trimester #> E145_2_trimester,
  member(E344_trimester, [2, 5, 8, 11]),

  % e361
  E361_trimester #>= E390_trimester + 9,

  % e373
  E373_trimester #> 1,

  % e390
  E390_trimester #= E373_trimester,

  % e397
  E397_trimester #> E516_trimester,
  member(E397_trimester, [1, 4, 7, 10]),

  % e402
  % Sudoku seminar. At most one Sudoku seminar per trimester.
  Sudokus = [ E402_trimester
            , E421_trimester
            , E426_trimester
            , E428_trimester
            , E438_trimester
            , E440_trimester
            , E468_trimester
            , E474_trimester
            , E475_trimester
            ],
  all_diff(Sudokus),

  % e421
  % Sudoku seminar. At most one Sudoku seminar per trimester.
  % 426 must be taken during same academic year
  div(E421_trimester, 3) #= div(E426_trimester, 3),

  % e426
  % Sudoku seminar. At most one Sudoku seminar per trimester.


  % e428
  % Sudoku seminar. At most one Sudoku seminar per trimester.
  E428_trimester #> E402_trimester,


  % e438
  % Sudoku seminar. At most one Sudoku seminar per trimester.


  % e440
  % Sudoku seminar. At most one Sudoku seminar per trimester.
  member(E440_trimester, [2, 5, 8, 11]),


  % e468
  % Sudoku seminar. At most one Sudoku seminar per trimester.
  E468_trimester #= E438_trimester + 5,


  % e474
  % Sudoku seminar. At most one Sudoku seminar per trimester.
  member(E474_trimester, [1, 2, 4, 5, 7, 8, 10, 11]),


  % e475
  % Sudoku seminar. At most one Sudoku seminar per trimester.
  member(E475_trimester, [3, 6, 9, 12]),

  % Kunundrum Klasses:
  all_members(
    [3, 6, 9, 12],
    [E504_trimester,
     E512_trimester,
     E516_trimester,
     E530_trimester]
  )

  % e504
  % Kunundrum Klass. At most one Kunundrum Klass per trimester.
  % member(E504_trimester, [3, 6, 9, 12]),

  % e512
  % Kunundrum Klass. At most one Kunundrum Klass per trimester.
  % member(E512_trimester, [3, 6, 9, 12]),


  % e516
  % Kunundrum Klass. At most one Kunundrum Klass per trimester.
  % member(E516_trimester, [3, 6, 9, 12]),


  % e530
  % Kunundrum Klass. At most one Kunundrum Klass per trimester.
  % member(E530_trimester, [3, 6, 9, 12]),


  .

check_blank :-
  Schedule = [
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _],
  [_, _, _]
  ],
  solve(Schedule)
  .

check_1 :-
  Schedule = [
  [e332  , _,  1],
  [e402  , _,  1],
  [e308  , _,  1],
  % This should return false quickly.
  [e332  , _,  2],
  [_     , _,  2],
  [_     , _,  2],
  [_     , _,  3],
  [_     , _,  3],
  [_     , _,  3],
  [_     , _,  4],
  [_     , _,  4],
  [_     , _,  4],
  [_     , _,  5],
  [_     , _,  5],
  [_     , _,  5],
  [_     , _,  6],
  [_     , _,  6],
  [_     , _,  6],
  [_     , _,  7],
  [_     , _,  7],
  [_     , _,  7],
  [_     , _,  8],
  [_     , _,  8],
  [_     , _,  8],
  [_     , _,  9],
  [_     , _,  9],
  [_     , _,  9],
  [_     , _,  10],
  [_     , _,  10],
  [_     , _,  10],
  [_     , _,  11],
  [_     , _,  11],
  [_     , _,  11],
  [_     , _,  12],
  [_     , _,  12],
  [_     , _,  12]
  ],
  solve(Schedule)
  .

