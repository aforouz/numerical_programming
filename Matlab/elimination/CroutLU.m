function [L, U] = CroutLU(A)
    [m, n]=size(A);
    if m==n
        %invertible
        for i=1:n
            if det(A(1:i,1:i))==0
                L=[];
                U=[];
                return;
            end
        end
        %1
        L=eye(m);
        U=zeros(m);
        %2
        for j=1:n
            %3
            for i=1:j
                s=0;
                for p=1:i-1
                    s=s + L(i,p)*U(p,j);
                end              
                U(i,j)=A(i,j)-s;
            end
            %4
            for i=j+1:n
                s=0;
                for p=1:j-1
                    s=s + L(i,p)*U(p,j);
                end
                L(i,j)=(A(i,j)-s)/U(j,j);
            end
        end
    else
        L=[];
        U=[];
    end
return