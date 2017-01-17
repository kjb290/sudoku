%% function level one, this function calculates basic column, row, little mat elimination
function [main_matrix, poss]=double_pairs(main_matrix, poss)
% temp for level one while loop
temp=ones(9,9);
wloop2=0;
np=2;

% level main matrix is changing

while sum(sum(abs(main_matrix-temp)))>0 %for f=1:1:5
    temp1=main_matrix;
    wloop2=wloop2+1;
    
    
% look for cells with only 2 possibilities in a row, column or little
% matrix, then eliminate those possibilities in the remaining row, col, or
% little mat
for i=1:3:7
    for l=1:1:3
        for m=1:1:9
            if sum(poss(i+l-1,:,m))<4
                if and(sum(poss(i+l-1,1:3,m))==0,sum(poss(i+l-1,4:6,m))==0)
                    temp_dbp=poss(i+l-1,7:9,m);
                    poss(i:i+2,7:9,m)=0;
                    poss(i+l-1,7:9,m)=temp_dbp;
                end
                if and(sum(poss(i+l-1,1:3,m))==0,sum(poss(i+l-1,7:9,m))==0)
                    temp_dbp=poss(i+l-1,4:6,m);
                    poss(i:i+2,4:6,m)=0;
                    poss(i+l-1,4:6,m)=temp_dbp;
                end
                if and(sum(poss(i+l-1,4:6,m))==0,sum(poss(i+l-1,7:9,m))==0)
                    temp_dbp=poss(i+l-1,1:3,m);
                    poss(i:i+2,1:3,m)=0;
                    poss(i+l-1,1:3,m)=temp_dbp;
                end
            end
            if sum(poss(:,i+l-1,m))<4
                if and(sum(poss(1:3,i+l-1,m))==0,sum(poss(4:6,i+l-1,m))==0)
                    temp_dbp=poss(7:9,i+l-1,m);
                    poss(7:9,i:i+2,m)=0;
                    poss(7:9,i+l-1,m)=temp_dbp;
                end
                if and(sum(poss(1:3,i+l-1,m))==0,sum(poss(7:9,i+l-1,m))==0)
                    temp_dbp=poss(4:6,i+l-1,m);
                    poss(4:6,i:i+2,m)=0;
                    poss(4:6,i+l-1,m)=temp_dbp;
                end
                if and(sum(poss(4:6,i+l-1,m))==0,sum(poss(7:9,i+l-1,m))==0)
                    temp_dbp=poss(1:3,i+l-1,m);
                    poss(1:3,i:i+2,m)=0;
                    poss(1:3,i+l-1,m)=temp_dbp;
                end
            end
        end
    end
end


[main_matrix, poss]=level1(main_matrix,poss);    
[main_matrix, poss]=level1point5(main_matrix,poss);
[main_matrix, poss]=level2(main_matrix,poss);    
temp=temp1;
end
