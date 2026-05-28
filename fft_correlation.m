clc;
clear;
close all;

%% SIGNALS

x = [1 1 1 -1 -1 1 1 -1];

delay = 10;

y = [zeros(1,delay) x];

%% ZERO PADDING

N = length(x) + length(y) - 1;

x_pad = [x zeros(1,N-length(x))];

y_pad = [y zeros(1,N-length(y))];

%% FFT

X = fft(x_pad);

Y = fft(y_pad);

%% CIRCULAR CORRELATION

R = ifft(conj(X).*Y);

%% PLOT

figure;
plot(abs(R))
title('FFT Based Circular Correlation')
grid on