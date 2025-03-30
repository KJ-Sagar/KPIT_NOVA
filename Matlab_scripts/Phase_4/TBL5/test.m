% MATLAB Script to Build Simulink Model for Dynamic Vibration Absorber

% Parameters
M1 = 20;       % Mass of primary system (kg)
M2 = 200;      % Mass of secondary system (kg)
k1 = 100;      % Stiffness of primary system (N/m)
b = 100;       % Damping coefficient (N-s/m)

% Calculate k12 for tuned absorber condition
omega_excitation = 2; % Excitation frequency (rad/s)
k12 = omega_excitation^2 * M2; % Stiffness of coupling spring (N/m)

% Create a new Simulink model
new_system('DynamicVibrationAbsorber');
open_system('DynamicVibrationAbsorber');

% Add blocks
add_block('simulink/Sources/Sine Wave', 'DynamicVibrationAbsorber/Force');
add_block('simulink/Math Operations/Sum', 'DynamicVibrationAbsorber/Sum1');
add_block('simulink/Math Operations/Gain', 'DynamicVibrationAbsorber/Gain1_M1');
add_block('simulink/Continuous/Integrator', 'DynamicVibrationAbsorber/Integrator1_y1_dot');
add_block('simulink/Continuous/Integrator', 'DynamicVibrationAbsorber/Integrator1_y1');
add_block('simulink/Math Operations/Gain', 'DynamicVibrationAbsorber/Gain_k1');
add_block('simulink/Math Operations/Product', 'DynamicVibrationAbsorber/Product_k1_y1');
add_block('simulink/Math Operations/Gain', 'DynamicVibrationAbsorber/Gain_b');
add_block('simulink/Math Operations/Product', 'DynamicVibrationAbsorber/Product_b_y1_dot');
add_block('simulink/Math Operations/Gain', 'DynamicVibrationAbsorber/Gain_k12');
add_block('simulink/Math Operations/Sum', 'DynamicVibrationAbsorber/Sum_y1_y2');
add_block('simulink/Math Operations/Product', 'DynamicVibrationAbsorber/Product_k12_y1_y2');
add_block('simulink/Math Operations/Sum', 'DynamicVibrationAbsorber/Sum2');
add_block('simulink/Math Operations/Gain', 'DynamicVibrationAbsorber/Gain2_M2');
add_block('simulink/Continuous/Integrator', 'DynamicVibrationAbsorber/Integrator2_y2_dot');
add_block('simulink/Continuous/Integrator', 'DynamicVibrationAbsorber/Integrator2_y2');
add_block('simulink/Scopes/Scope', 'DynamicVibrationAbsorber/Scope_y1');
add_block('simulink/Scopes/Scope', 'DynamicVibrationAbsorber/Scope_y2');

% Set block parameters
set_param('DynamicVibrationAbsorber/Force', 'Amplitude', '1', 'Frequency', '2');
set_param('DynamicVibrationAbsorber/Gain1_M1', 'Gain', num2str(1/M1));
set_param('DynamicVibrationAbsorber/Gain_k1', 'Gain', num2str(k1));
set_param('DynamicVibrationAbsorber/Gain_b', 'Gain', num2str(b));
set_param('DynamicVibrationAbsorber/Gain_k12', 'Gain', num2str(k12));
set_param('DynamicVibrationAbsorber/Gain2_M2', 'Gain', num2str(1/M2));

% Connect blocks (CORRECTED BRANCHING)
add_line('DynamicVibrationAbsorber', 'Force/1', 'Sum1/1');
add_line('DynamicVibrationAbsorber', 'Sum1/1', 'Gain1_M1/1');
add_line('DynamicVibrationAbsorber', 'Gain1_M1/1', 'Integrator1_y1_dot/1');
add_line('DynamicVibrationAbsorber', 'Integrator1_y1_dot/1', 'Integrator1_y1/1');
add_line('DynamicVibrationAbsorber', 'Integrator1_y1/1', 'Gain_k1/1');
add_line('DynamicVibrationAbsorber', 'Gain_k1/1', 'Product_k1_y1/1');
add_line('DynamicVibrationAbsorber', 'Product_k1_y1/1', 'Sum1/2');
add_line('DynamicVibrationAbsorber', 'Integrator1_y1_dot/1', 'Gain_b/1');
add_line('DynamicVibrationAbsorber', 'Gain_b/1', 'Product_b_y1_dot/1');
add_line('DynamicVibrationAbsorber', 'Product_b_y1_dot/1', 'Sum1/3');

% Branching for y1 signal
add_line('DynamicVibrationAbsorber', 'Integrator1_y1/1', 'Sum_y1_y2/1', 'Branch', ['y1_branch']);
add_line('DynamicVibrationAbsorber', 'y1_branch/1', 'Product_k12_y1_y2/2');

add_line('DynamicVibrationAbsorber', 'Integrator2_y2/1', 'Sum_y1_y2/2');
add_line('DynamicVibrationAbsorber', 'Sum_y1_y2/1', 'Gain_k12/1');
add_line('DynamicVibrationAbsorber', 'Gain_k12/1', 'Product_k12_y1_y2/1');
add_line('DynamicVibrationAbsorber', 'Product_k12_y1_y2/1', 'Sum1/4');
add_line('DynamicVibrationAbsorber', 'Product_k12_y1_y2/1', 'Sum2/1');
add_line('DynamicVibrationAbsorber', 'Sum2/1', 'Gain2_M2/1');
add_line('DynamicVibrationAbsorber', 'Gain2_M2/1', 'Integrator2_y2_dot/1');
add_line('DynamicVibrationAbsorber', 'Integrator2_y2_dot/1', 'Integrator2_y2/1');
add_line('DynamicVibrationAbsorber', 'Integrator1_y1/1', 'Scope_y1/1');
add_line('DynamicVibrationAbsorber', 'Integrator2_y2/1', 'Scope_y2/1');

% Set simulation parameters (optional)
set_param('DynamicVibrationAbsorber', 'StopTime', '20'); % Simulation time

disp('Simulink model "DynamicVibrationAbsorber" created.');