format long;

%A.Using Matlab, complete Question 6 in Exercise Set 2.2

%Q. The following four methods are proposed to compute 7^(1/5). Rank them
%in order, based on theri apparent speed of convergence, assuming p0 = 1

%initial conditions
p0 = 1;
p = p0;
pold = p0;
maxIter = 10000;
tol = 1e-3;
i = 1;

%four methods to compute 7^(1/5)
% equation_a = pold*((1 + (7-pold^5)/(pold^2))^3);
% equation_b = pold - (((pold^5) -7)/pold^2);
% equation_c = pold - ((pold^5 -7)/(5*pold^4));
% equation_d = pold - ((pold^5 -7)/12);

% computation fixed point iteration
while i < maxIter
    
    p =   pold - ((pold^5 -7)/12); %change the equation
    
    err = abs(p - pold);
    
    if err < tol
        break
    end
    
    pold = p;
    
    i = i+1;
    
    disp(pold);
    
end

disp(i);


        
