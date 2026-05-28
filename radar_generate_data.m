clc;
clear;
close all;

%% Barker Code

pulse = [1 1 1 -1 -1 1 1 -1 1 -1 1];

%% Delay

delay = 25;

%% Received Signal

rx = [zeros(1,delay) pulse];

%% Optional Noise

rx = awgn(rx,10,'measured');

%% Quantization

rx_quantized = round(rx);

%% Save To File

fid = fopen('radar_input.txt','w');

for i = 1:length(rx_quantized)

    fprintf(fid,'%d\n',rx_quantized(i));

end

fclose(fid);

disp('Radar samples exported')