
clear; close all; clc;

nn = [20 40 80];
iteration = zeros(numel(nn),1);

for ii = 1:numel(nn)
   
    n = nn(ii)-1;
    A = zeros(n,n);
    b = zeros(n,1);
    b(1) = 1/2;
    
%matrix A
for  i = 1:n
    for j = 1:n
        if i==j
            A(i,j) = 1;
        elseif abs(i-j) == 1
            A(i,j) = -1/2;
        end
    end
end


%exact solution
exact = A\b;


% initial value = 0 
XO = zeros(n,1);
% set empty matrix x
x = zeros(n,1);
%start with first iteration     
k = 1;
%tolerance
tol = 1e-3;
%maximum iteration
K = 100000;

while(k <= K)
    for i =1:n
        %make empty vector
        sumIJI = zeros(n,1);
        for j = 1:n
            if i~=j
                sumIJI = sumIJI + A(i,j)*XO(j);
            end
        end
        x(i) = 1/A(i,i) *(-sumIJI(i)+ b(i));
        relerr = norm(exact-x,inf)/norm(exact,inf);
    end
    if relerr < tol
        break;
    end
    k = k + 1;
    XO = x;
end
    
% Save iteration number after while-loop in iteration
iteration(ii) = k;
end

% print
disp("(b)")
for i = 1:3
    fprintf('n = %d , # of iteration = %d \n',nn(i), iteration(i))
end



