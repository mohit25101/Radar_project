clc;
clear;
close all;

%% PULSE

pulse = [1 1 1 -1 -1 1 1 -1 1 -1 1];

%% TARGET DELAYS

d1 = 20;
d2 = 50;

%% TARGET AMPLITUDES

a1 = 1;
a2 = 0.7;

%% RECEIVED SIGNAL

rx1 = [zeros(1,d1) a1*pulse];

rx2 = [zeros(1,d2) a2*pulse];

L = max(length(rx1),length(rx2));

rx1 = [rx1 zeros(1,L-length(rx1))];
rx2 = [rx2 zeros(1,L-length(rx2))];

rx = rx1 + rx2;

%% ADD NOISE

rx = awgn(rx,5,'measured');

%% CORRELATION

corr_out = xcorr(rx,pulse);

%% PLOT

figure;
plot(abs(corr_out))
title('Multi Target Detection')
grid on