function[V_throat_c,t_throat_c,rho_throat_c,mach_throat_c,mass_f_r_throat_c,p_throat_c,mass_flow_rate_c] = Conservation(n,nt,CFL)



x = linspace(0,3,n);
dx = x(2)-x(1) ; 
gamma = 1.4;

%% Initial Conditions 

a = 1+2.2*(x-1.5).^2;


%% Initial Conditions 
for i=1:1:length(x)
    
    if(x(i)>=0 && x(i)<=0.5)
        rho(i)=1;
        t(i)=1;
        
    elseif (x(i)>=0.5  && x(i)<=1.5)
          rho(i)=1-0.366*(x(i)-0.5);
          t(i)=1-0.167*(x(i)-0.5);
                
    elseif (x(i)>=1.5  && x(i)<=3)
           rho(i)= 0.634-0.3879*(x(i)-1.5);
           t(i)= 0.833-0.3507*(x(i)-1.5);
        
    end 
end 
    % Solution Vectors 
e = t;
V = 0.59./(rho.*a);
U1= rho.*a;
U2= rho.*a.*V;
U3= rho.*a.*((t./(gamma-1))+(gamma/2).*V.^2);




% Solution Vectors 
%% Time loop 
for tt = 1:1:length(nt) 
 % Storing Initial Values 
    U1_old = U1;
    U2_old = U2;
    U3_old = U3;
    
    dt =min((CFL.*dx)./(t.^(0.5)+V));
   
    F1= U2;
    F2= ((U2.^2)./U1 )+ ((gamma-1)/gamma).*(U3-((gamma/2) * (U2.^2)./U1));
    F3= ((gamma*U2.*U3)./U1) - ((gamma*(gamma-1)/2) * (U2.^3)./(U1.^2));
      
    for nx = 2:n-1 
    %% Predictors step 
      % Source term J2
      J2(nx) = (1/gamma)*rho(nx)*t(nx)*((a(nx+1)-a(nx))/dx);  
      % Predictors Step derivative  
      du1dt_p(nx) = -(F1(nx+1)-F1(nx))./dx ;
      du2dt_p(nx) = -(F2(nx+1)-F2(nx))./dx + J2(nx) ;
      du3dt_p(nx) = -(F3(nx+1)-F3(nx))./dx ;
      
      % Solution update 
      U1(nx) = U1_old(nx) + du1dt_p(nx).*dt;
      U2(nx) = U2_old(nx) + du2dt_p(nx).*dt;
      U3(nx) = U3_old(nx) + du3dt_p(nx).*dt;

    end 
    rho =U1./a ;
    V=U2./U1;
    t = (gamma-1).*((U3./U1) - (gamma./2).*(V).^2);
    
    % correctors step 
    % Flux Vector 
    F1= U2;
    F2= ((U2.^2)./U1 )+ ((gamma-1)/gamma).*(U3-((gamma/2) * (U2.^2)./U1));
    F3= ((gamma*U2.*U3)./U1) - ((gamma*(gamma-1)/2) * (U2.^3)./(U1.^2));
    
    
    for j = 2:n-1 
    % Source term J2
    J2(j) = (1/gamma)*rho(j)*t(j)*((a(j)-a(j-1))/dx);
    % Correctors Step derivative  
    du1dt_c(j) = -(F1(j)-F1(j-1))./dx ;
    du2dt_c(j) = -(F2(j)-F2(j-1))./dx + J2(j) ;
    du3dt_c(j) = -(F3(j)-F3(j-1))./dx ;

    end

    % Average time derivative 
    du1dt_avg = 0.5.*(du1dt_p + du1dt_c);
    du2dt_avg = 0.5.*(du2dt_p + du2dt_c);
    du3dt_avg = 0.5.*(du3dt_p + du3dt_c);

    %% Final Solution update 
    for y =2:n-1 
      
        U1(y) = U1_old(y) + du1dt_avg(y).*dt;
        U2(y) = U2_old(y) + du2dt_avg(y).*dt;
        U3(y) = U3_old(y) + du3dt_avg(y).*dt;  
     
    end 

%% Apply Boundary Conditions 
% Inlet Boundary Conditions
    %boundary conditions

    U1(1) = rho(1).*a(1);
    U2(1)= 2*U2(2)-U2(3);
    U3(1)= U1(1)*((t(1)/(gamma-1))+(gamma/2)*V(1).^2);
    
    U1(n)= 2*U1(n-1)- U1(n-2);
    U2(n)= 2*U2(n-1)- U2(n-2);
    U3(n)= 2*U3(n-1)- U3(n-2);

    % calcultaing primitive variables
    rho = U1./a;
    V= U2./U1;
    t = (gamma-1)*((U3./U1)-(gamma/2)*V.^2);
   
    p= rho.*t;
    
    
    
     %% Calculating other quantities 
mass_flow_rate_c = rho.*a.*V;
pressure = rho.*t ;
mach_number = V./((t).^0.5);

   
%% Throat Variables 
V_throat_c(tt) = V(16);
t_throat_c(tt) = t(16);
rho_throat_c(tt) = rho(16);
p_throat_c(tt)  = pressure(16);
mach_throat_c(tt) = mach_number(16);
mass_f_r_throat_c(tt) = mass_flow_rate_c(16);

    %% Plotting 
    
for l = [1,50,100,150,200];
if l==tt
    figure(6) 
plot(x,mass_flow_rate_c) ;
hold on 
elseif tt==700
plot(x,mass_flow_rate_c) ;
end
    xlabel('Length of nozzle');
    ylabel('Mass Flow Rate');
    legend('time-step=1','time step=50','time step=100','time step=150','time step=200','time step=700')
    title('Variation of Mass flow rate distribution inside the nozzle at different time steps during the time-marching process');
    
end 


end



%% Plotting 

ntr = 1:1400;
figure(7)
plot(ntr,V_throat_c)
hold on 
plot(ntr,t_throat_c)
plot(ntr,rho_throat_c)
plot(ntr,p_throat_c)
plot(ntr,mach_throat_c)
plot(ntr,mass_f_r_throat_c)
legend('velocity','temperature','density','pressure','machnumber','mass flow rate')
 ylabel('non dimensionless parameters')  ;
 xlabel('no. of time steps')
 title('Time-wise variation of primitive variables')
 
figure(8)
plot(x,V,'linewidth',2);
hold on 
plot(x,t,'linewidth',2);
plot(x,rho,'linewidth',2);
plot(x,pressure,'linewidth',2);
plot(x,mach_number,'linewidth',2);
plot(x,mass_flow_rate_c,'linewidth',2);
legend('velocity','temperature','density','pressure','machnumber','mass flow rate')
 ylabel('non dimensionless parameters')  ;
 xlabel('length of nozzle ')
 title('steady state distribution  of primitive variables inside nozzle')
end 
