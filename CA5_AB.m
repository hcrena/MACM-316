clc; clear; close all;
format short;

xf= [0 0.25 0.5 0.75 1.0];
yf= [exp(-xf(1)) exp(-xf(2)) exp(-xf(3)) exp(-xf(4)) exp(-xf(5))];
xx = 0.5;

n = length(xf)-1;
x = zeros(1,n+1); 
a = zeros(1,n+1);

for i = 0:n
    x(i+1) = xf(i+1);
    a(i+1) = yf(i+1);
end
m = n-1;
h = zeros(1,m+1);
for i = 0:m
    h(i+1) = x(i+2) - x(i+1);
end

xa = zeros(1,m+1);
for i = 1:m
    xa(i+1) = 3.0*(a(i+2)*h(i)-a(i+1)*(x(i+2)-x(i))+a(i)*h(i+1))/(h(i+1)*h(i));
end

xl = zeros(1,n+1); xl(1) = 1;
xu = zeros(1,n+1); xu(1) = 0;
xz = zeros(1,n+2); xz(1) = 0;

for i = 1:m
    xl(i+1) = 2*(x(i+2)-x(i))-h(i)*xu(i);
    xu(i+1) = h(i+1)/xl(i+1);
    xz(i+1) = (xa(i+1)-h(i)*xz(i))/xl(i+1);
end

xl(n+1) = 1;
xz(n+1) = 0;
b = zeros(1,n+1); c = zeros(1,n+1); d = zeros(1,n+1);
c(n+1) = xz(n+1);

for i =0:m
    j = m-i;
    c(j+1) = xz(j+1)-xu(j+1)*c(j+2);
    b(j+1) = (a(j+2)-a(j+1))/h(j+1) - h(j+1)*(c(j+2)+2.0*c(j+1))/3.0;
    d(j+1) = (c(j+2)-c(j+1))/(3.0*h(j+1));
end

%printing x values
 fprintf('\nThe numbers x(0), ..., x(n) are:\n');
 for i = 0:n
   fprintf('   %5.4f', x(i+1));
 end
 
 %printing splines' coefficient
 fprintf('\n\nThe coefficients of the spline on the subintervals are:\n'); 
 fprintf('     a(i)        b(i)          c(i)          d(i)\n');
 for i = 0:m
   fprintf('%11.4f  %11.4f  %11.4f  %11.4f \n',a(i+1),b(i+1),c(i+1),d(i+1));
 end
 
 %interpolating values
 for i=1:length(xf)-1
         S = a(i) + b(i).*(xx-xf(i)) + c(i).*(xx-xf(i)).^2 +d(i).*(xx-xf(i)).^3;
 end
disp(['Interpolated value at ' num2str(xx) ' is equal to = ' num2str(S)])

 
 %Printing spline in S(X) form
 syms x
 for i = 1:length(xf)-1
     SS(i) = vpa(simplify(a(i) + b(i).*(x-xf(i)) + c(i).*(x-xf(i)).^2 + d(i).*(x-xf(i)).^3));
 end
 disp(['All Splines: '])
 disp(SS')
 
 firstdiff = diff(SS(3));
 seconddiff = diff(firstdiff);
 
 actual = exp(-x);
 firstactual = diff(actual);
 secondactual = diff(firstactual);
         