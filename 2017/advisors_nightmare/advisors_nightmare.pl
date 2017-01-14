all_members([H], L2) :- member(H, L2).
all_members([H|T],L2) :- member(H, L2), all_members(T, L2).


solve(Schedule) :-
  Schedule = [C1_1, C1_2, C1_3, C2_1, C2_2, C2_3, C3_1, C3_2, C3_3, C4_1, C4_2, C4_3, C5_1, C5_2, C5_3, C6_1, C6_2, C6_3, C7_1, C7_2, C7_3, C8_1, C8_2, C8_3, C9_1, C9_2, C9_3, C10_1, C10_2, C10_3, C13_1, C11_2, C11_3, C12_1, C12_2, C12_3],

  C1_1  = [C1_1_num,  C1_1_trimester],
  C1_2  = [C1_2_num,  C1_2_trimester],
  C1_3  = [C1_3_num,  C1_3_trimester],
  C2_1  = [C2_1_num,  C2_1_trimester],
  C2_2  = [C2_2_num,  C2_2_trimester],
  C2_3  = [C2_3_num,  C2_3_trimester],
  C3_1  = [C3_1_num,  C3_1_trimester],
  C3_2  = [C3_2_num,  C3_2_trimester],
  C3_3  = [C3_3_num,  C3_3_trimester],
  C4_1  = [C4_1_num,  C4_1_trimester],
  C4_2  = [C4_2_num,  C4_2_trimester],
  C4_3  = [C4_3_num,  C4_3_trimester],
  C5_1  = [C5_1_num,  C5_1_trimester],
  C5_2  = [C5_2_num,  C5_2_trimester],
  C5_3  = [C5_3_num,  C5_3_trimester],
  C6_1  = [C6_1_num,  C6_1_trimester],
  C6_2  = [C6_2_num,  C6_2_trimester],
  C6_3  = [C6_3_num,  C6_3_trimester],
  C7_1  = [C7_1_num,  C7_1_trimester],
  C7_2  = [C7_2_num,  C7_2_trimester],
  C7_3  = [C7_3_num,  C7_3_trimester],
  C8_1  = [C8_1_num,  C8_1_trimester],
  C8_2  = [C8_2_num,  C8_2_trimester],
  C8_3  = [C8_3_num,  C8_3_trimester],
  C9_1  = [C9_1_num,  C9_1_trimester],
  C9_2  = [C9_2_num,  C9_2_trimester],
  C9_3  = [C9_3_num,  C9_3_trimester],
  C10_1 = [C10_1_num, C10_1_trimester],
  C10_2 = [C10_2_num, C10_2_trimester],
  C10_3 = [C10_3_num, C10_3_trimester],
  C13_1 = [C13_1_num, C13_1_trimester],
  C11_2 = [C11_2_num, C11_2_trimester],
  C11_3 = [C11_3_num, C11_3_trimester],
  C12_1 = [C12_1_num, C12_1_trimester],
  C12_2 = [C12_2_num, C12_2_trimester],
  C12_3 = [C12_3_num, C12_3_trimester],


  all_members(
  [e102, e115, e128, e145_1, e145_2, e156, e176, e180, e199, e205, e234, e253, e265, e272, e289, e308, e332, e343, e344, e361, e373, e390, e397, e402, e421, e426, e428, e438, e440, e468, e474, e475, e504, e512, e516, e530],
  [C1_1_num, C1_2_num, C1_3_num, C2_1_num, C2_2_num, C2_3_num, C3_1_num, C3_2_num, C3_3_num, C4_1_num, C4_2_num, C4_3_num, C5_1_num, C5_2_num, C5_3_num, C6_1_num, C6_2_num, C6_3_num, C7_1_num, C7_2_num, C7_3_num, C8_1_num, C8_2_num, C8_3_num, C9_1_num, C9_2_num, C9_3_num, C10_1_num, C10_2_num, C10_3_num, C13_1_num, C11_2_num, C11_3_num, C12_1_num, C12_2_num, C12_3_num]
  ),


  % Offerings
  Fall2017  = [[ e102, e156, e332, e397, e474],
               [ e176, e265, e289, e361, e373],
               [ e145_1, e145_2, e199, e390, e402, e438],
               [ e115, e234, e308, e426, e428],
               [ e128, e180, e272, e421, e468]],

  Winter2017 =[[ e308, e361, e402, e440, e468],
               [ e128, e176, e253, e390, e474],
               [ e156, e265, e344, e421, e428],
               [ e205, e234, e289, e332, e438],
               [ e115, e145_1, e145_2, e180, e373, e426]],

  Spring2018 =[[ e176, e421, e428, e468, e475],
               [ e156, e205, e373, e390, e402],
               [ e289, e308, e361, e512, e530],
               [ e115, e234, e343, e426, e516],
               [ e180, e265, e332, e438, e504]],

  Fall2018  = [[ e115, e390, e397, e426, e468],
               [ e128, e156, e373, e428, e438],
               [ e180, e199, e265, e361, e421],
               [ e145_1, e145_2, e234, e272, e289, e308],
               [ e102, e176, e332, e402, e474]],

  Winter2018 =[[ e176, e361, e421, e426, e440],
               [ e180, e205, e234, e332, e344],
               [ e128, e156, e373, e390, e438],
               [ e115, e145_1, e145_2, e289, e402, e474],
               [ e253, e265, e308, e428, e468]],

  Spring2019 =[[ e176, e361, e468, e512, e516],
               [ e234, e265, e343, e438, e475],
               [ e156, e205, e332, e421, e504],
               [ e180, e308, e402, e426, e530],
               [ e115, e289, e373, e390, e428]],

  Fall2019  = [[ e145_1, e145_2, e199, e332, e390, e397],
               [ e115, e265, e373, e426, e438],
               [ e102, e128, e272, e421, e468],
               [ e176, e180, e289, e308, e474],
               [ e156, e234, e361, e402, e428]],

  Winter2019 =[[ e145_1, e145_2, e156, e176, e361, e426],
               [ e205, e253, e265, e440, e468],
               [ e115, e289, e373, e428, e438],
               [ e128, e332, e344, e421, e474],
               [ e180, e234, e308, e390, e402]],

  Spring2020 =[[ e289, e308, e332, e343, e428],
               [ e176, e361, e421, e426, e468],
               [ e115, e205, e402, e438, e504],
               [ e156, e180, e475, e512, e516],
               [ e234, e265, e373, e390, e530]],

  Fall2020  = [[ e115, e289, e426, e438, e474],
               [ e145_1, e145_2, e156, e176, e421, e468],
               [ e102, e128, e265, e332, e390],
               [ e234, e308, e361, e397, e428],
               [ e180, e199, e272, e373, e402]],

  Winter2020 =[[ e176, e332, e344, e361, e474],
               [ e205, e253, e289, e373, e421],
               [ e115, e156, e180, e428, e468],
               [ e145_1, e145_2, e234, e426, e438, e440],
               [ e128, e265, e308, e390, e402]],

  Spring2021 =[[ e308, e361, e390, e475, e504],
               [ e180, e205, e234, e265, e530],
               [ e176, e289, e343, e421, e438],
               [ e332, e426, e428, e468, e516],
               [ e115, e156, e373, e402, e512]].

