%% function level two, this function looks for rows, columns, and little matrices with only 2 possible choices and checks to see if they are the same choices and elimates those choices from the coresponding row, column, and or little matrix
function [main_matrix, poss]=chain(main_matrix, poss)
% temp for level one while loop
temp=ones(9,9);
wloop2=0;
np=2;

while sum(sum(abs(main_matrix-temp)))>0 %for f=1:1:5
    temp1=main_matrix;
    wloop2=wloop2+1;
    chain_main=main_matrix;
    chain_poss=poss;
    
% look for cells with only 2 possibilities in a row, column or little
% matrix, then eliminate those possibilities in the remaining row, col, or
% little mat
s3d=sum(poss,3);

% start with 1-D 
for i=1:1:9
    %move down move down the other (doing this so we can go through rows
    %and columns using the same loops
    for j=1:1:9
        % look for a sum of 2 and compare to any remaining sum of 2
        if s3d(i,j)==2
            ind=find(poss(i,j,:)>0);
         %keyboard
            for m=1:1:2
                chain_main(i,j)=ind(m);
                chain_poss(i,j,:)=0;
                chain_poss(i,j,ind(m))=1;
                [chain_main,chain_poss]=level1(chain_main,chain_poss);
                [chain_main,chain_poss]=level1point5(chain_main,chain_poss);
                [chain_main,chain_poss]=level2(chain_main,chain_poss);
                [chain_main,chain_poss]=double_pairs(chain_main,chain_poss);
                if m==1
                    chain1=chain_main;
                elseif m==2
                    chain2=chain_main;
                    
                    [i_chain,j_chain]=find(chain1==chain2);
                    for l=1:1:size(i_chain,1)
                    main_matrix(i_chain(l,1),j_chain(l,1))=chain1(i_chain(l,1),j_chain(l,1));
                    end
                    
                    poss=fill_poss(main_matrix,poss);
                    s3d=sum(poss,3);
                    
                end
            end
        end
                
    end
end
            
[main_matrix, poss]=level1(main_matrix,poss);    
[main_matrix, poss]=level1point5(main_matrix,poss);
[main_matrix, poss]=level2(main_matrix,poss);
[main_matrix, poss]=double_pairs(main_matrix,poss);
temp=temp1;
end