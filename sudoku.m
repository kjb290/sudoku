
% input given values into main matrix
%             1 2 3 4 5 6 7 8 9
main_matrix=[ 2 0 0 0 5 0 0 0 7;  % 1
              0 0 0 1 0 8 0 0 0;  % 2
              0 0 6 0 7 0 3 0 0;  % 3
              0 3 0 0 0 0 0 2 0;  % 4
              4 0 2 0 9 0 1 0 8;  % 5
              0 9 0 0 0 0 0 4 0;  % 6
              0 0 8 0 1 0 6 0 0;  % 7
              0 0 0 9 0 6 0 0 0;  % 8
              5 0 0 0 8 0 0 0 4;] % 9

poss=ones(9,9,9);
% level 1 call
[main_matrix,poss]=level1(main_matrix,poss);
[r,c,little]=check_sol(main_matrix);

main_matrix

% level 1.5 call
if sum(r)~=405 && sum(c)~=405 && sum(sum(little))~=405
    [main_matrix, poss]=level1point5(main_matrix,poss);
    [r,c,little]=check_sol(main_matrix);
end

main_matrix

% level 2 call
if sum(r)~=405 && sum(c)~=405 && sum(sum(little))~=405
    [main_matrix, poss]=level2(main_matrix,poss);
    [r,c,little]=check_sol(main_matrix);
    
end

main_matrix

% level double pairs call
if sum(r)~=405 && sum(c)~=405 && sum(sum(little))~=405
    [main_matrix, poss]=double_pairs(main_matrix,poss);
    [r,c,little]=check_sol(main_matrix);
    
end

main_matrix

% level chain
if sum(r)~=405 && sum(c)~=405 && sum(sum(little))~=405
    [main_matrix, poss]=chain(main_matrix,poss);
    [r,c,little]=check_sol(main_matrix);
    
end

main_matrix


