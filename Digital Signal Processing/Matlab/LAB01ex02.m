% Parameters
fs = 12e3; % Sample rate
tlen = 5; % Duration
fmin = .1e3;
fmax = 3e3;

Ts = 1/fs; % Sample interval
t = 0 : Ts : tlen-Ts;
N = length(t);

P = 0 : 1/N : 1-1/N;
df = (fmax * P-fmin * (P-2)) / 2;
x = sin(2*pi*t.*df); % Compute a sine wave with variable frequency

% Plays the wave at the sample rate
sound(x, fs);

% Show part of the wave
plot(t, x);
xlabel('time, s')
ylabel('amplitude, arbitrary units')
% Set axis limits (xmin,xmax, ymin,ymax)
% xmax zooms in on the beginning 0.2s of the signal
axis([0 1/fmin*20 -1 1])

% Observations:
% This script computes a sine wave of increasing frequency according to the parameters,
% ...
