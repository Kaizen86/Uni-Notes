% Part 1: Noisy signal
f1=.5e3;
fs=10e3;
Ts=1/fs;
tlen=0.5;
t=0:Ts:tlen-Ts;
N=length(t);

x=sin(2*pi*f1*t);
standev=1;
n=randn(1,N)*standev;
xn=x+n;

plot(t,x,'LineWidth',3);
hold on
plot(t,xn,'LineWidth',1);
axis([0 1/f1*10 -4 4]);

xlabel('time,s');
ylabel('amplitude, arbitrary units');
legend('original signal','with noise');
hold off

% Part 2: Moving-average filter
M=3;
A=1;
B=ones(1,M)/M;
disp(B)

y=filter(B,A,xn);

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
X=abs(fft(x));
Xn=abs(fft(xn));
Y=abs(fft(y));

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
