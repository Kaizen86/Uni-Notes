fs = 12e3;
fmin = 500;
fmax = 2500;
t_chirp = 0.02;
t_gap = 0.05;
n_reps = 5;
echo_delay = 0.025;
echo_atten = 0.5;
noise_level = 0.2;

t = linspace(0, t_chirp, round(fs * t_chirp));
chirp_sig = chirp(t, fmin, t_chirp, fmax, 'linear');
one_period = [chirp_sig, zeros(0, round(fs*t_gap))];

tx_signal = repmat(one_period, 1, n_reps);
delay_samples = round(echo_delay * fs);
rx_signal = zeros(1, length(tx_signal));
rx_signal(delay_samples+1:end) = echo_atten * tx_signal(1:end-delay_samples);
received = rx_signal + noise_level*randn(size(tx_signal));

[r, lags] = xcorr(received, chirp_sig);
lags_time = lags / fs;

subplot(3,1,1)
time_tx = (0:length(tx_signal)-1)/fs;
plot(time_tx, tx_signal, 'b')
title('Transmitted Chirp Bursts')
xlabel('Time, s')
ylabel('Amplitude')
grid on
xlim([0 0.30])

subplot(3,1,2)
time_rx = (0:length(received)-1)/fs;
plot(time_rx, received, 'k')
title('Received Signal (with echo + noise)')
xlabel('Time, s')
ylabel('Amplitude')
grid on
xlim([0 0.30])

subplot(3,1,3)
plot(lags_time, r)
title('Cross-Correlation between Received Signal and Chirp')
xlabel('Time, s / lag')
ylabel('Correlation')
grid on
xlim([-0.1 0.1])
