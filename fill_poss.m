%% function level one, this function calculates basic column, row, little mat elimination
function [poss]=fill_poss(main_matrix, poss)
% temp for level one while loop
temp=ones(9,9);

for i=1:1:9
    for j=1:1:9
        if main_matrix(i,j)>0
            poss(i,j,:)=0;
            poss(i,:,main_matrix(i,j))=0;
            poss(:,j,main_matrix(i,j))=0;            
            if i<4
                if j<4
                    poss(1:3,1:3,main_matrix(i,j))=0;
                elseif j<7
                    poss(1:3,4:6,main_matrix(i,j))=0;                
                else
                    poss(1:3,7:9,main_matrix(i,j))=0;                
                end
                
            elseif i<7
                if j<4
                    poss(4:6,1:3,main_matrix(i,j))=0;
                elseif j<7
                    poss(4:6,4:6,main_matrix(i,j))=0;                
                else
                    poss(4:6,7:9,main_matrix(i,j))=0;                
                end
            else
                if j<4
                    poss(7:9,1:3,main_matrix(i,j))=0;
                elseif j<7
                    poss(7:9,4:6,main_matrix(i,j))=0;                
                else
                    poss(7:9,7:9,main_matrix(i,j))=0;                
                end
            end       
        poss(i,j,main_matrix(i,j))=1;    
        end
    end
end



