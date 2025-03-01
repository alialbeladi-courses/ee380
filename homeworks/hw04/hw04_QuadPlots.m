%% PID Control of Quadcopter Altitude Near Hover

%% Vehicle Parameters
m = 65e-3;              % Mass, kg
g = 9.81;               % Gravitational constant, m/s^2
kT = 5.276e-4;          % Thrust coefficient, N
umax = 500;             % Maximum motor input command, unitless
umin = 0;               % Minimum motor input command, unitless

hddmax = (4*kT*umax-m*g)/m;    % Maximum upward acceleration, m/s^2


%% Part A: Closed-Loop ODE
% Consider the following PD control law with gravity feedforward
%    u = Kp*(hdes-h) - Kd*hdot + (mhat*g)/(4*kThat)
% Here u is the individual motor command input (unitless).  Also,
% (mhat,kThat) indicate that these are estimates used by the controller.
%
% Derive an ODE that models the closed-loop dynamics with this control
% law assuming perfect cancellation of the gravitational term.



%% Part B: Select PD Control Gains
% Choose the gains Kp and Kd to make the closed-loop stable
% and to satisfy requirements i), ii), and iii).
%
% ***Fill in your answers for (wn,zeta,Kp,Kd) below.

% Select closed-loop natural frequency and damping ratio
wn = 0;      % Desired natural freq, rad/sec
zeta = 0;    % Desired damping ratio, unitless
      
% Solve for gains to achieve desired (wn,zeta)
Kp = 0
Kd = 0

%% Part C: Simulate Closed-Loop
% Include a disturbance force in the quadcopter model:
%   m d^2(h)/dt^2 = (4*kT) * u - mg + Fd

% The Simulink model also has an integral term and a disturbance force. 
% Set integral gain and disturbance to be zero for this part.
Ki = 0;   % Integral gain
Fd = 0;   % Disturbance Force, N

% Parameter estimates (used in controller)
mhat = m;
kThat = kT;

% Altitude reference, m
hdes = 1;   % desired altitude, m

% Initial Conditions
h0 = 0;        % Initial altitude, m
hdot0 = 0;     % Initial altitude velocity, m/s

% Simulate system
Tf = 5;            % Final simulation time, sec
sim('QuadPID',[0 Tf]);

% Plot results

