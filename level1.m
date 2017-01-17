%% function level one, this function calculates basic column, row, little mat elimination
function [main_matrix, poss]=level1(main_matrix,poss)
% temp for level one while loop
temp=ones(9,9);
wloop=0;


% level one solves
while sum(sum(abs(main_matrix-temp)))>0 %for f=1:1:5
    temp1=main_matrix;
    wloop=wloop+1;

% start eliminating possibilities
% eliminate those that are input into main matrix
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

% check for solved cells
s3d=sum(poss,3);
for i=1:1:9
    for j=1:1:9
        if s3d(i,j)==1
            ind=find(poss(i,j,:));
            main_matrix(i,j)=ind;
        end
    end
end
temp=temp1;
end

