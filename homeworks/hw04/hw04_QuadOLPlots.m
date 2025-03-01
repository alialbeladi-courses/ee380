%% AEM 4321 / EE 4231 
% SOLUTION TEMPLATE: Quadcopter Open Loop Control

%% Vehicle Parameters
% These are the "true" values used in the quadcopter model.
% Note: The values below use scientific notation where "e" means 
% "10 to the power of".  For example, 65e-3 means 65*10^(-3).
m = 65e-3;              % Mass, kg
g = 9.81;               % Gravitational constant, m/s^2
kT = 5.276e-4;          % Thrust coefficient, N
umax = 500;             % Maximum thrust input command, unitless
umin = 0;               % Minimum thrust input command, unitless

hddmax = (4*kT*umax-m*g)/m;    % Maximum upward acceleration, m/s^2

%% Part A
% Are the quadcopter dynamics stable?


%% Part B
% The desired altitude trajectory is:
%    hdes(t) = 0.5*hbar*( 1-cos(pi*t) )
% Verify that the corresponding desired acceleration is:
%    d^2( hdes ) / dt^2 = 0.5*hbar*pi^2*cos(pi*t)
% What is the largest value of hbar that can be reached with this profile
% while remaining within the max acceleration limit?



%% Part C
% Define the open-loop motor command:
%     u(t) = (mhat/4/kThat)*( g + d^2(hdes)/dt^2 )
% Verify that if the controller has perfect estimates (mhat,kThat)=(m,kT)
% then h(t) will follow the desired trajectory hdes(t)


%% Part D
% Simulate the system with (mhat,kThat) = (m,kT)
% Hand in a plot of h(t) vs. t

% ***Fill in values for the parameter estimates***
mhat = 0;
kThat = 0;

% Desired final height, m
hbar = 1;   

% Initial Conditions
h0 = 0;            % Initial altitude, m
hdot0 = 0;         % Initial altitude velocity, m/s

% Simulate system
Tf = 1;            % Final simulation time, sec
sim('QuadOLSim',[0 Tf]);

% Plot results
hdes = 0.5*hbar*(1-cos(pi*tsim));

figure(1);
plot(tsim,h,'b',tsim,hdes,'r--');
xlabel('Time, sec');
ylabel('Altitude, m');
legend('Actual','Desired');
title('Simulation with perfect estimates')
grid on;

%% Part E
% Simulate the system with small errors (mhat,kThat) = (0.95*m,1.05*kT)
% Hand in a plot of h(t) vs. t

% ***Fill in values for the parameter estimates***
mhat = 0;
kThat = 0;

% Desired final height, m
hbar = 1;   

% Initial Conditions
h0 = 0;            % Initial altitude, m
hdot0 = 0;         % Initial altitude velocity, m/s

% Simulate system
Tf = 1;            % Final simulation time, sec
sim('QuadOLSim',[0 Tf]);

% Plot results
hdes = 0.5*hbar*(1-cos(pi*tsim));

figure(2);
plot(tsim,h,'b',tsim,hdes,'r--');
xlabel('Time, sec');
ylabel('Altitude, m');
legend('Actual','Desired');
title('Simulation with small errors in estimates')
grid on;
