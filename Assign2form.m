
clear; close all; clc;

nn = [20 40 80];
iter = zeros(numel(nn),1);

for ii = 1:numel(nn)
    
    n = nn(ii) - 1;
    A = zeros(n,n);
    b = zeros(n,1);
    b(1) = 1/2;
    
    % Making matrix A
    for i = 1:n
        A(i,i) = 1;
        if i ~= 1
            A(i-1,i) = -1/2;
        end
        if i ~= n
            A(i+1,i) = -1/2;
        end
    end
    
    % we use initial value, which is zero
    XO = zeros(n,1);
    % we set x is zero,which is the result from iteration
    x = zeros(n,1);
    exact = A\b;
    
    % Step 1
    k = 1;
    TOL = 1e-3;
    N = 100000; % N is big enough 
    
    % Step 2
    while(k <= N)
        
        % Step 3
        % use for-loop for cigma
        for i =1:n
            sumIJI = zeros(n,1);
            for j = 1:n
                if i~=j
                    sumIJI = sumIJI + A(i,j)*XO(j);
                end
            end
            x(i) = 1/A(i,i) *(-sumIJI(i)+ b(i));
        end
        
        % Step 4
        % find the maximum value from absolute value
        if norm(exact-x, inf)/norm(exact,inf) < TOL
        %if max(abs(x-XO))/max(abs(x)) < TOL
            break;
        end
        
        % Step 5
        k = k + 1;
        
        % Step 6
        XO = x;
    end
    
    % Save iteration number after while-loop in iter
    iter(ii) = k;
end

% How many iterations are needed for each n?
disp("Problem (a)")
for i = 1:3
    fprintf('n = %d , iter = %d \n',nn(i), iter(i))
end
 