% Simplified version of ex02
% Parameters
fs = 12e3; % Sample rate
tlen = 5; % Duration
fmin = .1e3;
fmax = 3e3;

t = linspace(0, tlen, fs*tlen);
x = chirp(t, fmin, tlen, fmax, 'linear');

% Plays the wave at the sample rate
sound(x, fs);

% Show part of the wave
plot(t, x);
xlabel('time, s')
ylabel('amplitude, arbitrary units')
% Set axis limits (xmin,xmax, ymin,ymax)
% xmax zooms in on the beginning 1/10th of the signal
axis([0 1/fmin*20 -1 1])

% Observations:
