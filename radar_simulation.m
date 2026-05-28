clc;
clear;
close all;

%% PARAMETERS

pulse = [1 1 1 -1 -1 1 1 -1 1 -1 1];

delay = 25;

snr = 10;

%% TRANSMITTED SIGNAL

tx = pulse;

%% RECEIVED SIGNAL

rx = [zeros(1,delay) tx];

%% ADD NOISE

rx = awgn(rx,snr,'measured');

%% CROSS CORRELATION

corr_out = xcorr(rx,tx);

%% PEAK DETECTION

[peak,index] = max(abs(corr_out));

estimated_delay = index - length(tx);

%% DISPLAY

disp(['Estimated Delay = ',num2str(estimated_delay)])

%% PLOTS

figure;

subplot(3,1,1)
stem(tx)
title('Transmitted Pulse')

subplot(3,1,2)
stem(rx)
title('Received Signal')

subplot(3,1,3)
plot(abs(corr_out))
title('Cross Correlation Output')
grid on