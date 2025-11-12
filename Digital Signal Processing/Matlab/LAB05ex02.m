% Setup variables
fs=1e4;
fcf=fs/300; % Difference: this got changed from /400
Omegacf=2*pi*fcf/fs; % Normalised digital frequency
alpha=1/tan(Omegacf/2); % Helps simplify the equations
N=fs;

Q=1/sqrt(2);
K=alpha^2/(alpha^2+alpha/Q+1); % Difference: this got adjusted

% Second order high-pass Butterworth
B = [1 -2 1]*K; % Difference: 2 got changed to -2
A = [1  2*(1-alpha^2)/(alpha^2+alpha/Q+1)  (alpha^2-alpha/Q+1)/(alpha^2+alpha/Q+1)];
[H,f2] = freqz(B,A,N,fs);
semilogx(f2,20*log10(abs(H)),'LineStyle','-','LineWidth',3);

% Configure graph
xlabel('frequency, Hz')
ylabel('magnitude response, dB')
axis([1 fs/2 -50 10])
grid on
grid minor
hold off