close all 
clear all 
clc

%% Inputs 
n = 31;
x = linspace(0,3,n);
dx = x(2)-x(1) ;
gamma = 1.4;
CFL =0.5;
nt = 1:1400;

tic ;
%% Non conservation function 
[V_throat_nc,t_throat_nc,rho_throat_nc,mach_throat_nc,p_throat_nc,mass_f_r_throat_nc,mass_flow_rate_nc] = non_conservation(n,x,dx,gamma,CFL);


%% Plotting Primitive Variables at throat 
figure(4) 
subplot(3,1,1) 
plot(nt,V_throat_nc,'linewidth',2,'color','r') ;
ylabel('Velocity')
xlabel('time steps')

subplot(3,1,2) 
plot(nt,rho_throat_nc,'linewidth',2,'color','b') ;
ylabel('Density')
xlabel('time steps')

subplot(3,1,3) 
plot(nt,t_throat_nc,'linewidth',2,'color','g') ;
ylabel('temperature')
xlabel('time steps')

figure(5)
subplot(3,1,1) 
plot(nt,p_throat_nc,'linewidth',2,'color','r') ;
ylabel('pressure')
xlabel('time steps')

subplot(3,1,2) 
plot(nt,mach_throat_nc,'linewidth',2,'color','b') ;
ylabel('Mach Number')
xlabel('time steps')

subplot(3,1,3) 
plot(nt,mass_f_r_throat_nc,'linewidth',2,'color','g') ;
ylabel('mass flow rate')
xlabel('time steps')

time_nc = toc 

tic 
%% Function for Conservation form 
[V_throat_c,t_throat_c,rho_throat_c,mach_throat_c,mass_f_r_throat_c,p_throat_c,mass_flow_rate_c] = Conservation(n,nt,CFL);

%% Plotting Primitive Variables at throat 
figure(9) 
subplot(3,1,1) 
plot(nt,V_throat_c,'linewidth',2,'color','r') ;
ylabel('Velocity')
xlabel('time steps')

subplot(3,1,2) 
plot(nt,rho_throat_c,'linewidth',2,'color','b') ;
ylabel('Density')
xlabel('time steps')

subplot(3,1,3) 
plot(nt,t_throat_c,'linewidth',2,'color','g') ;
ylabel('temperature')
xlabel('time steps')

figure(10)
subplot(3,1,1) 
plot(nt,p_throat_c,'linewidth',2,'color','r') ;
ylabel('pressure')
xlabel('time steps')

subplot(3,1,2) 
plot(nt,mach_throat_c,'linewidth',2,'color','b') ;
ylabel('Mach Number')
xlabel('time steps')

subplot(3,1,3) 
plot(nt,mass_f_r_throat_c,'linewidth',2,'color','g') ;
ylabel('mass flow rate')
xlabel('time steps')

time_c = toc
%% Steady state Mass flow rate comparision 
figure(11)
plot(x,mass_flow_rate_nc,'color','r','linewidth',3);
hold on 
plot(x,mass_flow_rate_c,'color','g','linewidth',3);
xlabel('length of nozzle')
ylabel('mass flow rate')
legend('Non Conservation','Conservation')
title(' Comparison of Normalized mass flow rate distributions of both forms')




       
       
       
       
       
       
       
        
    
