clc;
clear;

%% Select electron ionization coefficient file
[file1, path1] = uigetfile('*.xlsx', 'Select Alpha_e File');
data_e = readmatrix(fullfile(path1, file1));

%% Select hole ionization coefficient file
[file2, path2] = uigetfile('*.xlsx', 'Select Alpha_h File');
data_h = readmatrix(fullfile(path2, file2));

%% Read data
xe = data_e(:,1);          % um
alpha_e = data_e(:,2);
xh = data_h(:,1);          % um
alpha_h = data_h(:,2);

%% Remove zero values
idxe = alpha_e > 0;
xe = xe(idxe);
alpha_e = alpha_e(idxe);

idxh = alpha_h > 0;
xh = xh(idxh);
alpha_h = alpha_h(idxh);

%% Convert to cm
xe = xe * 1e-4;
xh = xh * 1e-4;

%% Interpolate alpha_h onto electron grid
alpha_h_interp = interp1(xh, alpha_h, xe, 'linear', 'extrap');

%% Compute phi
phi = cumtrapz(xe, alpha_e - alpha_h_interp);

%% Electron multiplication
integrand_e = alpha_e .* exp(-phi);
In = trapz(xe, integrand_e);

%% Hole multiplication
integrand_p = alpha_h_interp .* exp(phi);
Ip = trapz(xe, integrand_p);

%% Optical multiplication
Mx = exp(phi(end) - phi) ./ (1 - Ip);

%% Gains
Mn = 1 / (1 - In);
Mp = 1 / (1 - Ip);

%% Plot Figure
figure;
plot(xe * 1e4, Mx, 'LineWidth', 2);
xlabel('Photon absorption position (\mum)');
ylabel('Optical Gain M(x)');
title('Optical Injection Gain');
grid on;

%% Results
fprintf('Electron Gain = %f\n', Mn);
fprintf('Hole Gain = %f\n', Mp);
fprintf('Optical Gain at x=0 = %f\n', Mx(1));
fprintf('Optical Gain at x=W = %f\n', Mx(end));