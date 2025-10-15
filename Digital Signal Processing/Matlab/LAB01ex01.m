% Parameters
f = .5e3; % Frequency
fs = 44.1e3; % Sample rate
tlen = .5; % Duration

%   T/Ts
% = cycle time / sample time
% = (1/f)/(1/fs)
% = fs/f
% = 88.2 samples per cycle
Ts = 1/fs; % Sample interval in microseconds
t = 0 : Ts : tlen-Ts; % Array of time values
x = sin(2*pi*f*t); % Compute a sine wave

% Plays the wave at the sample rate
sound(x, fs);

% Show part of the wave
%plot(t, x);
stem(t, x);
xlabel('time, s')
ylabel('amplitude, arbitrary units')
% Set axis limits (xmin,xmax, ymin,ymax)
% xmax zooms in on the beginning 1/10th of the signal
axis([0 1/f*10 -1 1])

% Observations:
% This script computes a sine wave according to the parameters,
% then plays it through the speakers, then displays the first 10th of the signal.
