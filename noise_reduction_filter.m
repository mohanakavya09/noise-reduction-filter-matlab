% Noise Reduction Filter Design using MATLAB
% Demonstrates noise removal from a noisy signal

clc;
clear;
close all;

% Sampling parameters
fs = 1000;
t = 0:1/fs:1;

% Original signal
signal = sin(2*pi*50*t);

% Add random noise
noise = 0.5 * randn(size(t));
noisySignal = signal + noise;

% Design a low-pass FIR filter
filterOrder = 50;
cutoffFrequency = 100;

normalizedCutoff = cutoffFrequency / (fs/2);

b = fir1(filterOrder, normalizedCutoff, 'low');

% Apply the filter
filteredSignal = filter(b, 1, noisySignal);

% Plot original, noisy and filtered signals
figure;

subplot(3,1,1);
plot(t, signal);
title('Original Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, noisySignal);
title('Noisy Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
plot(t, filteredSignal);
title('Filtered Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

sgtitle('Noise Reduction using FIR Low-Pass Filter');
