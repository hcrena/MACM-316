fx  = [2011 2012 2013 2014 2016 2017 2018 2019 2020];
fy = [4502104 4566769 4630077 4707103 4859250 4929384 5010476 5090955 5147712];
x = 2014.5;

n = length(fx);

for i = 1:n
n = length(fx)-i;
xx = zeros(1,n+1);
q = zeros(n+1,n+1);

for ia = 0:n
    xx(ia+1) = fx(ia+1);
    q(ia+1,1) = fy(ia+1);
end

d = zeros(1,n+1);
d(1) = x-xx(1);
for ia = 1:n
    d(ia+1) = x-xx(ia+1);
    for j = 1:ia
        q(ia+1,j+1) = (d(ia+1)*q(ia,j)-d(ia-j+1)*q(ia+1,j))/(d(ia+1)-d(ia-j+1));
    end
end

%  list for storing approximate values
yp = [];
fprintf('Interpolation Table evaluated at x = %11.0f: \n ', x);
for ia = 0:n
    fprintf('%11.0f ', xx(ia+1));
    yp(end+1) = q(ia+1,1);
    for j = 0:ia
        fprintf('%11.8f ', q(ia+1,j+1));
    end
    fprintf('\n');
end
disp(['From Table, interpolated value at ' num2str(x) ' is equal to = ' num2str(q(end,end))]);

end

%remove data points from back
n = [2 3 4 5 6 7 8 9];
qn = [4745616 4745377.875 4747396.2656 4746620.8359 4747953.2969 4747392.7402 4747505.1145 4747931.4217];
%plot(n,qn);
%xlabel('n');
%ylabel('Approximated value');

%remove data points from front
a = [2 3 4 5 6 7 8 9];
qa = [4745139.75 4745377.875 4745845.4062 4746620.8359 4746832.1836 4747392.7402 4747505.1145 4747931.4217];
plot(a,qa);
%xlabel('n');
%ylabel('Approximated value');

%method1: differences
for i = 1:length(qa)-1
    d = abs(qa(i+1) - qa(i));
    disp(d);
end


