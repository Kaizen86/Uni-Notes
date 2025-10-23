
% randn: Random number between -1 and +1
% filter: Performs convolution
% fft: Computes the Discrete Fourier Transform

% Moving average
% y[n] = (1/5)*x[n] + (1/5)*x[n-1] + (1/5)*x[n-2] + (1/5)*x[n-3] + (1/5)*x[n-4]
coefficients = [1/5, 1/5, 1/5, 1/5, 1/5];

Fs=10;
duration=floor(2*pi * 5);

t = linspace(0, duration, duration*Fs);
signal = sin(t); % Sine Wave
noisy = signal+randn(1, duration*Fs); % Generate a random signal

filtered = filter(coefficients, 1, noisy); % Apply the moving average filter

plot(signal, color='blue')
hold on;
plot(noisy, color='#ff8000');
plot(filtered, color='green');
hold off;

% Plot complex magnitude of FFT in new window
plot(abs(fft(signal)), color='blue');
hold on;
plot(abs(fft(noisy)), color='#ff8000');
plot(abs(fft(filtered)), color='green');
