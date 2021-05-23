% n for (n+1) nodes,
n=8;
% data points
xx =[2011 2012 2013 2014 2016 2017 2018 2019 2020];
q = [4502104; 4566769; 4630077; 4707103; 4859250; 4929384; 5010476; 5090955; 5147712];
% point to be interpolated
x = 2014.5;

% Neville Interpolation
d = zeros(1,n+1);
d(1) = x-xx(1);
 for i = 1:n
    d(i+1) = x-xx(i+1);
    for j = 1:i
       q(i+1,j+1) = (d(i+1)*q(i,j)-d(i-j+1)*q(i+1,j))/(d(i+1)-d(i-j+1));
    end
end
 
%  list for storing approximate values
yp = [];
%  diplaying table for interpolation
fprintf('Table for interpolation evaluated at x = %0.4f: \n', x);
for i = 0:n
    fprintf('%2.4f ', xx(i+1));
    yp(end+1) = q(i+1,1);
    if i==3
        yp(end+1) = q(n+1,n+1);
    end
    for j = 0:i
       fprintf('%0.4f ', q(i+1,j+1));
    end
    fprintf('\n');
end
fprintf("The approximate value for x = 4.5 using Neville Interpolation is %.4f\n",q(n+1,n+1));

% plotting approximation vs n plot
xp = [1,2,3,4,4.5,6,7,8,9,10];
plot(xp,yp,'o',xp,yp,'-');
title('Approximation vs n plot')
xlabel('n');
ylabel('Approximate value');
