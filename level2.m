%% function level two, this function looks for rows, columns, and little matrices with only 2 possible choices and checks to see if they are the same choices and elimates those choices from the coresponding row, column, and or little matrix
function [main_matrix, poss]=level2(main_matrix, poss,np)
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
s3d=sum(poss,3);

% start with 1-D 
for i=1:1:9
    %move down move down the other (doing this so we can go through rows
    %and columns using the same loops
    for j=1:1:9
        % look for a sum of 2 and compare to any remaining sum of 2
        if s3d(i,j)==np
            %store the possibilites
            temp_p=squeeze(poss(i,j,:));
            % hop to the next comulmn
            if j<9
                for k=j+1:1:9
                    %look for other sum 2s
                    if s3d(i,k)==np
                        %store
                        temp_p2=squeeze(poss(i,k,:));
                        %check to see if they are identical
                        if temp_p==temp_p2
                            % remove indixies containing the ones from the
                            % possibility dimension from the entire row
                            ind = find(temp_p);
                            poss(i,:,ind)=0;
                            poss(i,j,:)=temp_p;
                            poss(i,k,:)=temp_p2;
                        end
                    end
                end
            end
        end
        if s3d(j,i)==np
            %store the possibilites
            temp_p3=squeeze(poss(j,i,:));
            % hop to the next comulmn
            if j<9
                for k=j+1:1:9
                    %look for other sum 2s
                    if s3d(k,i)==np
                        %store
                        temp_p4=squeeze(poss(k,i,:));
                        %check to see if they are identical
                        if temp_p3==temp_p4
                            % remove indixies containing the ones from the
                            % possibility dimension from the entire row
                            ind2 = find(temp_p3);
                            poss(:,i,ind2)=0;
                            poss(j,i,:)=temp_p3;
                            poss(k,i,:)=temp_p4;
                        end
                    end
                end
            end
        end
    end
end
kind=[0,1,2,0,1,2,0,1,2;
      0,0,0,1,1,1,2,2,2;];
for i=1:3:7
    for j=1:3:7
        for k=1:1:9
            if s3d(i+kind(1,k),j+kind(2,k))==np
                temp_m1=squeeze(poss(i+kind(1,k),j+kind(2,k),:));
                if k < 9
                    for l=(k+1):1:9
                        if s3d(i+kind(1,l),j+kind(2,l))==np
                            temp_m2=squeeze(poss(i+kind(1,l),j+kind(2,l),:));
                                if temp_m1==temp_m2
                                    indm = find(temp_m1);
                                    poss(i:i+2,j:j+2,indm)=0;
                                    poss(i+kind(1,k),j+kind(2,k),:)=temp_m1;
                                    poss(i+kind(1,l),j+kind(2,l),:)=temp_m2;
                                end
                                
                                if and(temp_m1==temp_m2,(i+kind(1,k))==(i+kind(1,l)))
                                    indm2 = find(temp_m1);
                                    poss(i+kind(1,k),:,indm2)=0;
                                    poss(i+kind(1,k),j+kind(2,k),:)=temp_m1;
                                    poss(i+kind(1,l),j+kind(2,l),:)=temp_m2;
                                end
                                if and(temp_m1==temp_m2,(j+kind(2,k))==(j+kind(2,l)))
                                    indm3 = find(temp_m1);
                                    poss(:,j+kind(2,l),indm3)=0;
                                    poss(i+kind(1,k),j+kind(2,k),:)=temp_m1;
                                    poss(i+kind(1,l),j+kind(2,l),:)=temp_m2;
                                end
                        end
                    end
                end
            end
        end
    end
end
[main_matrix, poss]=level1(main_matrix,poss);    
[main_matrix, poss]=level1point5(main_matrix,poss);
temp=temp1;
end

