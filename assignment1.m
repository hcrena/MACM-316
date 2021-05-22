clear 
clc

format long

%% Question a
% functions at the bottom

% % Numerical solution
% a = 1;
% b = 62.10;
% c = 1;
% 
% % 1.1
% desc = fl(fl(b)^2) - 4*fl(a)*fl(c);
% sqdecr = sqrt(desc);
% num_x1 = fl(fl(-b) + fl(sqdecr));
% num_x2 = fl(fl(-b) - fl(sqdecr));
% den = 2*fl(a);
% Num11_x1 = fl(num_x1/den);
% Num11_x2 = fl(num_x2/den);
% 
% % 1.2 and 1.3
% 
% den_x12 = fl(fl(b) + fl(sqdecr));
% den_x13 = fl(fl(b) - fl(sqdecr));
% num_x1213 = -2*fl(c);
% Num12_x1 = fl(num_x1213/den_x12);
% Num13_x2 = fl(num_x1213/den_x13);

a = 1; b = 62.10; c = 1;
[Num11_x1, Num11_x2] = eq11(a,b,c);
[Num12_x1, Num13_x2] = eq1213(a,b,c);



%% Question b
% Set parameter
a = [1 pi 1 1 ];
b = [-sqrt(7) 13 1 -sqrt(35)];
c = [sqrt(2) 1 -exp(1) -2];


% Exact solution
Ex11_x1 = @(a,b,c) (-b+sqrt(b.^2-4*a.*c)) ./ (2*a);
Ex11_x2 = @(a,b,c) (-b-sqrt(b.^2-4*a.*c)) ./ (2*a);
Ex12_x1 = @(a,b,c) (-2*c)./ (b + sqrt(b.^2-4*a.*c));
Ex13_x2 = @(a,b,c) (-2*c)./ (b - sqrt(b.^2-4*a.*c));
Ex11_x1_Qb = Ex11_x1(a,b,c);
Ex11_x2_Qb = Ex11_x2(a,b,c);
Ex12_x1_Qb = Ex12_x1(a,b,c);
Ex13_x2_Qb = Ex13_x2(a,b,c);

% Numerical solution
[Num11_x1_Qb, Num11_x2_Qb] = eq11(a,b,c);
[Num12_x1_Qb, Num13_x2_Qb] = eq1213(a,b,c);

abs_err     = @(p,np) abs(p-np);
rel_err   = @(p,np) abs(p-np)./abs(p);

% Computing absolute error and relative error
% each columm represent each equation.
Ans_x1_abs_err =abs_err(Ex11_x1_Qb, Num11_x1_Qb);
Ans_x2_abs_err =abs_err(Ex11_x2_Qb, Num11_x2_Qb);
Ans_x1_rel_err =rel_err(Ex11_x1_Qb, Num11_x1_Qb);
Ans_x2_rel_err =rel_err(Ex11_x2_Qb, Num11_x2_Qb);

%% Question C
%Depending on b, we choose either x1(1.1) or x2(1.2). 
%From the subtraction of denominator, if the numbers in denominator is
%nearly equal and its close to 0, then it has large relative error by rounding. 
%Also, from the division, if numerator is larger than denominator, the
%error is getting larger.
C_Ans_x1_abs_err =abs_err(Ex12_x1_Qb, Num12_x1_Qb);
C_Ans_x2_abs_err =abs_err(Ex13_x2_Qb, Num13_x2_Qb);
C_Ans_x1_rel_err =rel_err(Ex12_x1_Qb, Num12_x1_Qb);
C_Ans_x2_rel_err =rel_err(Ex13_x2_Qb, Num13_x2_Qb);

% Compare x1 (1.1) to x1 (1.2)
a = 1; b = 62.10; c = 1;
[Num11_x1, Num11_x2] = eq11(a,b,c);
[Num12_x1,Num13_x2] = eq1213(a,b,c);
g1 = rel_err(Ex11_x1(a,b,c), Num11_x1);
g2 = rel_err(Ex11_x1(a,b,c), Num12_x1);

g3 = rel_err(Ex11_x2(a,b,c), Num11_x2);
g4 = rel_err(Ex11_x2(a,b,c), Num13_x2);

a = 1; b = -62.10; c = 1;
[Num11_x1, Num11_x2] = eq11(a,b,c);
[Num12_x1,Num13_x2] = eq1213(a,b,c);
g1 = rel_err(Ex11_x1(a,b,c), Num11_x1);
g2 = rel_err(Ex11_x1(a,b,c), Num12_x1);
g3 = rel_err(Ex11_x2(a,b,c), Num11_x2);
g4 = rel_err(Ex11_x2(a,b,c), Num13_x2);



function [Num11_x1, Num11_x2] = eq11(a,b,c) 

    % 1.1
    desc = fl(fl(b).^2) - 4*fl(a).*fl(c);
    sqdecr = sqrt(desc);
    num_x1 = fl(fl(-b) + fl(sqdecr));
    num_x2 = fl(fl(-b) - fl(sqdecr));
    den = 2*fl(a);
    Num11_x1 = fl(num_x1./den);
    Num11_x2 = fl(num_x2./den);
end

function [Num12_x1,Num13_x2] = eq1213(a,b,c)

    % 1.2 and 1.3
    desc = fl(fl(b).^2) - 4*fl(a).*fl(c);
    sqdecr = sqrt(desc);
    den_x12 = fl(fl(b) + fl(sqdecr));
    den_x13 = fl(fl(b) - fl(sqdecr));
    num_x1213 = -2*fl(c);
    Num12_x1 = fl(num_x1213./den_x12); 
    Num13_x2 = fl(num_x1213./den_x13);
end

%This function describes making 4-digits rounding 
function y = fl(x)
 y = round(x,4,'significant');
end