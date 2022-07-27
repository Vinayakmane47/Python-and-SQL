close all
clear all
clc

%% Inputs 
n = 31;
x = linspace(0,3,n);
dx = x(2) -x(1) ; 
gamma = 1.4;
CFL = 0.5;
nt = 1:1400; ;
%% Initial Conditions 
rho(1:5) = 1;
t(1:5) = 1;
a = 1+2.2.*(x-1.5).^2 ;

for i = 6:15
rho(i) = 1-0.366*(x(i)-0.5);
t(i)   = 1-0.167*(x(i)-0.5);
end 
for ii = 16:31
rho(ii) = 0.634-0.3879*(x(ii)-1.5);
t(ii)   = 0.833-0.3507*(x(ii)-1.5);
end 
% Assumption 
U2 = 0.59; % for Constant mass flow rate value 
for j = 1:31
    V(j) = 0.59./(rho(j).*a(j));
end 





for ts =1:n
     a_sound = sqrt(t(ts));
     dt(ts) = CFL*dx/(a_sound +V(ts));
end 
dt = min(dt); 
    % Solution Vectors 
e = t;
U1 = rho.*a;
U2 = rho.*a.*V;
U3 = U1.*((t/(gamma-1)) + (gamma/2).*(V.^2));

%% Time loop 
for tt = 1:length(nt) 
   
 % Storing Initial Values 
    U1_old = U1;
    U2_old = U2;
    U3_old = U3;
    

for nx = 2:n-1 

%% Predictors step 
% Flux Vector 
F1 = U2 ;
% For F2 
F2t1 = (U2.^2)./U1 ;
F2t2 = (gamma-1)/gamma;
F2t3 = (U3 -(gamma/2).*F2t1);
F2  = F2t1 + F2t2.*F2t3;

% F3 
F3t1 = gamma.*((U2.*U3)./U1);
F3t2 = gamma.*((gamma-1)./2);
F4t3 = (U2.^3)./(U1.^2);
F3 = F3t1 - F3t2.*F4t3;

% Source term J2
J2t1 = (1./gamma) ;
J2t2 = rho(nx).*t(nx) ;
J3t3 = (a(nx+1)-a(nx))./dx;
J2 = J2t1.*J2t2.*J3t3;

% Predictors Step derivative  
du1dt_p(nx) = -(F1(nx+1)-F1(nx))./dx ;
du2dt_p(nx) = -(F2(nx+1)-F2(nx))./dx + J2 ;
du3dt_p(nx) = -(F3(nx+1) -F3(nx))./dx ;

% Solution update 
U1(nx) = U1_old(nx) + du1dt_p(nx).*dt;
U2(nx) = U2_old(nx) + du2dt_p(nx).*dt;
U3(nx) = U3_old(nx) + du3dt_p(nx).*dt;
 rho =U1./a ;
 t = (gamma-1).*((U3./U1) - (gamma/2).*((U2/U1).^2));
   
end 

for nx = 2:n-1 

% correctors step 
% Flux Vector 
F1 = U2 ;
% For F2 
F2t1 = (U2.^2)./U1 ;
F2t2 = (gamma-1)/gamma;
F2t3 = (U3 -(gamma/2).*F2t1);
F2  = F2t1 + F2t2.*F2t3;

% F3 
F3t1 = gamma.*((U2.*U3)./U1);
F3t2 = gamma.*((gamma-1)/2);
F4t3 = (U2.^3)./(U1.^2);
F3 = F3t1 - F3t2.*F4t3;

% Source term J2
J2t1 = (1./gamma) ;
J2t2 = rho(nx).*t(nx) ;
J3t3 = (a(nx)-a(nx-1))./dx;
J2 = J2t1.*J2t2.*J3t3;


% Correctors Step derivative  
du1dt_c = -(F1(nx)-F1(nx-1))./dx ;
du2dt_c = -(F2(nx)-F2(nx-1))./dx + J2 ;
du3dt_c = -(F3(nx) -F3(nx-1))./dx ;


end

% Average time derivative 
du1dt_avg = 0.5.*(du1dt_p + du1dt_c);
du2dt_avg = 0.5.*(du2dt_p + du2dt_c);
du3dt_avg = 0.5.*(du3dt_p +du3dt_c);

%% Final Solution update 
for y =2:n-1 
    U1(y) = U1_old(y) + du1dt_avg(y).*dt;
    U2(y) = U2_old(y) + du2dt_avg(y).*dt;
    U3(y) = U3_old(y) + du3dt_avg(y).*dt;
    
   
 
end 



%% Apply Boundary Conditions 
% Inlet Boundary Conditions


U1(1) = a(1);
U2(1) = 2.*U2(2) -U2(3);
U3(1) = U1(1).*((t(1)./(gamma-1)) + (gamma/2).*((U2(1)/U1(1)).^2));

% Outlet Boundary Conditions 
U1(n) = 2.*U1(n-1) -U1(n-2) ;
U2(n) = 2.*U2(n-1) -U2(n-2) ;
U3(n) = 2.*U3(n-1) -U3(n-2);

    rho = U1./a ;
    V = U2./U1 ;
    t = (gamma-1).*((U3./U1) - (gamma/2).*((U2./U1).^2));




end









