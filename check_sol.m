%% function check solution column, row, little mat 
function [rowsum, colsum, littlesum]=check_sol(main_matrix)
% check solution
%break into rows and cols
for i=1:1:9
    eval(['row', num2str(i) ,'= main_matrix(',num2str(i),',:);'])
    eval(['col', num2str(i) ,'= main_matrix(:,',num2str(i),');'])
end

% break into little matrices
count=0;
for i=1:3:7
    for j=1:3:7
        count=count+1;
        eval(['little_m', num2str(count),'=main_matrix(',num2str(i),':',num2str(i+2),',',num2str(j),':',num2str(j+2),');'])
    end
end
rowsum=[sum(row1);sum(row2);sum(row3);sum(row4);sum(row5);sum(row6);sum(row7);sum(row8);sum(row9)];
colsum=[sum(col1),sum(col2),sum(col3),sum(col4),sum(col5),sum(col6),sum(col7),sum(col8),sum(col9)];
littlesum=[sum(sum(little_m1)),sum(sum(little_m2)),sum(sum(little_m3));sum(sum(little_m4)),sum(sum(little_m5)),sum(sum(little_m6));sum(sum(little_m7)),sum(sum(little_m8)),sum(sum(little_m9))];

