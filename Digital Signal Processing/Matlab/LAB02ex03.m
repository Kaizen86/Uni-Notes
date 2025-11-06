% Part 1: Noisy signal
f1=.5e3; % Sine wave frequency
fs=10e3; % Sample frequency
Ts=1/fs; % Sample period
tlen=0.5; % Total duration
t=0:Ts:tlen-Ts; % Compute sample positions
N=length(t); % Number of samples

x=sin(2*pi*f1*t); % Original sine wave
standev=1; % Standard deviation
n=randn(1,N)*standev; % Generate noise
xn=x+n; % Sine wave with noise

% Plot sine wave and noisy sine wave
plot(t,x,'LineWidth',3);
hold on
plot(t,xn,'LineWidth',1);
axis([0 1/f1*10 -4 4]);

xlabel('time,s');
ylabel('amplitude, arbitrary units');
legend('original signal','with noise');
hold off

% Part 2: Moving-average filter
M=3; % Number of taps
A=1; % No idea; changing this does nothing? Investigate further
B=ones(1,M)/M; % Generate M taps totalling 1
disp(B) % Print taps

% Filter the noisy signal using the taps
y=filter(B,A,xn);

% Plot the filtered signal compared to the noisy signal
plot(t,x,'LineWidth',3);
hold on
plot(t,xn,'LineWidth',1);
plot(t,y,'g','LineWidth',2);
axis([0 1/f1*10 -4 4]);

xlabel('time,s');
ylabel('amplitude, arbitrary units');
legend('original signal','with noise','filtered');
hold off

% Part 3: Fourier Transform
X=abs(fft(x)); % Fourier transform of original sine wave
Xn=abs(fft(xn)); % Fourier transform of noisy sine wave
Y=abs(fft(y)); % Fourier transform of filtered sine wave

fbin=fs/N;
f=0:fbin:fs-fbin;

plot(f,20*log10(X),'LineWidth',3)
hold on
plot(f,20*log10(Xn),'LineWidth',2)
plot(f,20*log10(Y),'g','LineWidth',1)

axis([0 fs/2 -260 100]);

xlabel('frequency, Hz');
ylabel('magnitude gain, dB');
legend('original signal','with noise','filtered');
hold off;
