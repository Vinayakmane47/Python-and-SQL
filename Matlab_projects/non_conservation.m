function [V_throat_nc,t_throat_nc,rho_throat_nc,mach_throat_nc,p_throat_nc,mass_f_r_throat_nc,mass_flow_rate_nc] = non_conservation(n,x,dx,gamma,CFL)

%% Calculating Initial Profiles 

rho = 1-0.3146.*x ;
t = 1-0.2314*x;  % t = temperature 
V = (0.1 +1.09*x).*t.^0.5 ; 

% Area
a = 1+2.2*(x-1.5).^2 ; 
%time step 
nt = 1400;


%% outer time loop 
% conditions at starting of time step 
t_old = t;
V_old = V;
rho_old = rho;

 % time step size 
for ts =1:n
     a_sound = sqrt(t(ts));
     dt(ts) = CFL*dx/(a_sound +V(ts));
end 
dt = min(dt); 

for k = 1:nt % time loop
    t_old = t ;
    V_old = V;
    rho_old = rho;
    
   
    
    %predictors loop 
    for j = 2:n-1 
        
        dv_dx = (V(j+1) -V(j))./dx;
        drho_dx = (rho(j+1)-rho(j))./dx;
        dt_dx = (t(j+1) -t(j))./dx;
        dloga_dx = (log(a(j+1))-log(a(j)))./dx; 
      
        
        % Contuinity equation 
        drho_dt_p(j) = -rho(j).*dv_dx -rho(j).*V(j).*dloga_dx - V(j).*drho_dx;
        
        % Momentum equation
        dv_dt_p(j) = -V(j).*dv_dx -(1/gamma)*(dt_dx +(t(j)/rho(j)).*drho_dx);
        
        %Energy equation 
        dt_dt_p(j) = -V(j).*dt_dx -(gamma-1).*t(j).*(dv_dx +V(j)*dloga_dx);
        
        %Solution upate 
        
        V(j) = V(j) + dv_dt_p(j).*dt ;
        t(j) = t(j) + dt_dt_p(j).*dt ;
        rho(j) = rho(j) + drho_dt_p(j).*dt;
    
    
    
    %% Correctors loop 
    
        
        dv_dx = (V(j) -V(j-1))./dx;
        drho_dx = (rho(j)-rho(j-1))./dx;
        dt_dx = (t(j) -t(j-1))./dx;
        dloga_dx = (log(a(j))-log(a(j-1)))./dx; 
      
        
        % Contuinity equation 
        drho_dt_c(j) = -rho(j).*dv_dx -rho(j).*V(j).*dloga_dx - V(j).*drho_dx;
        
        % Momentum equation
        dv_dt_c(j) = -V(j).*dv_dx -(1/gamma)*(dt_dx +(t(j)/rho(j))*drho_dx);
        
        %Energy equation 
        dt_dt_c(j) = -V(j).*dt_dx -(gamma-1).*t(j)*(dv_dx +V(j)*dloga_dx);
         
    
    end 
    %% Computing average time derivative 
        
       drho_dt_avg = 0.5.*(drho_dt_p+drho_dt_c);
       dv_dt_avg = 0.5.*(dv_dt_p+dv_dt_c);
       dt_dt_avg = 0.5.*(dt_dt_p + dt_dt_c);
       
       %% Final Solution Update 
       for i =2:n-1 
       rho(i) = rho_old(i) + drho_dt_avg(i).*dt ;
       V(i)   = V_old(i) +dv_dt_avg(i).*dt;
       t(i) = t_old(i) + dt_dt_avg(i).*dt;
       end
       
       %% Apply Boundary Conditions 
       % Inlet Boundary Conitio
       V(1) = 2*V(2) -V(3) ;  
       
       
       %Outlet Bounary Conditions 
       
       V(n) = 2.*V(n-1) -V(n-2) ;
       rho(n) = 2.*rho(n-1) - rho(n-2) ;
       t(n) = 2.*t(n-1) -t(n-2) ;
    
       
 %% Calculating other quantities 
mass_flow_rate_nc = rho.*a.*V;
pressure = rho.*t ;
mach_number = V./((t).^0.5);

   
%% Throat Variables 
V_throat_nc(k) = V(16);
t_throat_nc(k) = t(16);
rho_throat_nc(k) = rho(16);
p_throat_nc(k)  = pressure(16);
mach_throat_nc(k) = mach_number(16);
mass_f_r_throat_nc(k) = mass_flow_rate_nc(16);


% plotting mass flow rate at various time step 

for l = [1,50,100,150,200,700]
    if l==k
        figure(1)
        plot(x,mass_flow_rate_nc)
        hold on 
    elseif k==1400
        plot(x,mass_flow_rate_nc)
    end  
    xlabel('Length of nozzle');
    ylabel('Mass Flow Rate');
    legend('time-step=1','time step=50','time step=100','time step=150','time step=200','time step=700','time step=1400')
    title('Variation of Mass flow rate distribution inside the nozzle at different time steps during the time-marching process');
    
end
    

end

%% Plotting 

ntr = 1:1400;
figure(2)
plot(ntr,V_throat_nc)
hold on 
plot(ntr,t_throat_nc)
plot(ntr,rho_throat_nc)
plot(ntr,p_throat_nc)
plot(ntr,mach_throat_nc)
plot(ntr,mass_f_r_throat_nc)
legend('velocity','temperature','density','pressure','machnumber','mass flow rate')
 ylabel('non dimensionless parameters')  ;
 xlabel('no. of time steps')
 title('Time-wise variation of primitive variables')
 
figure(3)
plot(x,V,'linewidth',2);
hold on 
plot(x,t,'linewidth',2);
plot(x,rho,'linewidth',2);
plot(x,pressure,'linewidth',2);
plot(x,mach_number,'linewidth',2);
plot(x,mass_flow_rate_nc,'linewidth',2);
legend('velocity','temperature','density','pressure','machnumber','mass flow rate')
 ylabel('non dimensionless parameters')  ;
 xlabel('length of nozzle ')
 title('steady state distribution  of primitive variables inside nozzle')
 
 

end

