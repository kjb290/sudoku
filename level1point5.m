%% function level 1.5, checks out little matrices in greater detail (i.e. if there are only 2 spots for a number and they are in same row or column within little mat, it elinimates those values from corresponding rows and columns
function [main_matrix, poss]=level1point5(main_matrix,poss)
% temp for level one while loop
temp=ones(9,9);
wloop=0;

% level one solves
while sum(sum(abs(main_matrix-temp)))>0 %for f=1:1:5
    temp1=main_matrix;
    wloop=wloop+1;

% start eliminating possibilities
% eliminate those that are input into main matrix

for i=1:3:7
    for j=1:3:7
        for m=1:1:9
            temp_col=sum(squeeze(poss(i:i+2,j:j+2,m)),1);
            temp_row=sum(squeeze(poss(i:i+2,j:j+2,m)),2);
            for l=1:1:3
                if sum(sum(squeeze(poss(i:i+2,j:j+2,m))))==temp_col(l)
                    poss(:,(j+l-1),m)=0;
                    poss((i:i+2),(j+l-1),m)=temp_row;
                end
                if sum(sum(squeeze(poss(i:i+2,j:j+2,m))))==temp_row(l)
                    poss((i+l-1),:,m)=0;
                    poss((i+l-1),(j:j+2),m)=temp_col;
                end
            end
        end
    end
end

[main_matrix, poss]=level1(main_matrix,poss);  
temp=temp1;
end

