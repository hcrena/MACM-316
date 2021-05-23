fx  = [2011 2012 2013 2014 2016 2017 2018 2019 2020];
fy = [4502104 4566769 4630077 4707103 4859250 4929384 5010476 5090955 5147712];
x = 2025;

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

n = [2 3 4 5 6 7 8 9];
qn = [ 5431497 5075667 4266852 3459192 4159479 10070142 27222733.5 55759885];
plot(n,qn);
xlabel('n');
ylabel('Approximated value');

for i = 1:length(qn)-1
    d = abs(qn(i+1) - qn(i));
    disp(d);
end
