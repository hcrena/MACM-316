
%population of BC at July 1
x  = {2011,2012,2013,2014,2016,2017,2018,2019,2020};
fx = {4502104,4566769,4630077,4707103,4859250,4929384,5010476,5090955,5147712};
t = 2015;

%part A
%write Nevile's method to approximate the population in 2015 using n data
%points. Plot the approximation versus n

n = input("Enter n for (n+1) nodes, n: ");
xx = zeros(1,n+1);
q = zeros(n+1,n+1);

for i = 0:n
    fprintf("Enter x(%d) and f(x(%d)) on separate lines: \n",i, i);
    xx(i+1) = x(i);
    q(i+1,1) = fx(i);
end
x = input("Now enter a point at which to evaluate the polynominal, x = ");

d = zeros(1,n+1);
d(1) = x-xx(1);
for i = 1:n
    d(i+1) = x-xx(i+1);
    for j = 1:i
        q(i+1,j+1) = (d(i+1)*q(i,j)-d(i-j+1)*q(i+1,j))/(d(i+1)-d(i-j+1));
    end
end

fprintf('Table for interpolation evaluated at x = %11.0f: \n',x);
for i = 0:n
    fprintf('%11.0f ',xx(i+1));
    for j = 0:i
        fprintf('%11.0f ',q(i+1,j+1));
    end
    fprintf('\n');
end
        

    