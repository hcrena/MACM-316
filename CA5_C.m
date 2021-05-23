% Clamped cubic spline interpolation
 % Find the approximate value of f(1.5) from 
 % (x,y)= (0,1), (1,e), (2,e^2) & (3,e^3). 
 % Also f'(0)=1, f'(3)=e^3
 
 n = input('Enter n for (n+1) nodes, n:  ');
 x = zeros(1,n+1);
 a = zeros(1,n+1);
 
 for i = 0:n 
   fprintf('Enter x(%d) and f(x(%d)) on separate lines:  \n', i, i);
   x(i+1) = input(' ');
   a(i+1) = input(' ');
 end
 
 fprintf('Enter f''(x(0)) and f''(x(n)) on separate lines\n');
 fp0 = input(' ');
 fpn = input(' ');

 m = n - 1;
 h = zeros(1,m+1);
 for i = 0:m
   h(i+1) = x(i+2) - x(i+1);
 end

 xa = zeros(1,n+1);
 xa(1) = 3.0 * (a(2) - a(1)) / h(1) - 3.0 * fp0;
 xa(n+1) = 3.0 * fpn - 3.0 * (a(n+1) - a(n)) / h(n);
 
 for i = 1:m
   xa(i+1) = 3.0*(a(i+2)*h(i)-a(i+1)*(x(i+2)-x(i))+a(i)*h(i+1))/(h(i+1)*h(i));
 end

 
 
 xl = zeros(1,n+1);
 xu = zeros(1,n+1);
 xz = zeros(1,n+1);
 xl(1) = 2.0 * h(1);
 xu(1) = 0.5;
 xz(1) = xa(1) / xl(1);
 
 for i = 1:m
  xl(i+1) = 2.0 * (x(i+2) - x(i)) - h(i) * xu(i);
  xu(i+1) = h(i+1) / xl(i+1);
  xz(i+1) = (xa(i+1) - h(i) * xz(i)) / xl(i+1);
 end
 
 
 xl(n+1) = h(n) * (2.0 - xu(n));
 xz(n+1) = (xa(n+1) - h(n) * xz(n)) / xl(n+1);
 c = zeros(1,n+1);
 b = zeros(1,n+1);
 d = zeros(1,n+1);
 c(n+1) = xz(n+1);
 
 for i = 1:n
  j = n - i;
  c(j+1) = xz(j+1) - xu(j+1) * c(j+2);
  b(j+1) = (a(j+2)-a(j+1))/h(j+1)-h(j+1)*(c(j+2)+2.0*c(j+1))/3.0;
  d(j+1) = (c(j+2) - c(j+1)) / (3.0 * h(j+1));
 end  

 
 fprintf('The numbers x(0), ..., x(n) are:\n');
 for i = 0:n
   fprintf(' %5.4f', x(i+1));
 end
 fprintf('\n\nThe coefficients of the spline on the subintervals are: \n'); 
 fprintf('     a(i)          b(i)           c(i)         d(i)\n');
 
 for i = 0:m  
 fprintf('%11.4f %11.4f %11.4f %11.4f\n',a(i+1),b(i+1),c(i+1),d(i+1));
 end
  