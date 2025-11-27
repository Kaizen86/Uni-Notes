# Determine the required analogue filter order
```math
fpass=12e3
fstop=24e3
fs=62.4e3
Apass=3
Astop=60
esqstop=10^(Astop*0.1)-1
esqpass=10^(Apass*0.1)-1
vstop=fstop/fpass
nanalogue=0.5/log10(vstop)*log10(esqstop/esqpass)
fpassa=fs*tan(pi*fpass/fs)/pi
fstopa=fs*tan(pi*fstop/fs)/pi
vstopa=fstopa/fpassa
nwarped=0.5/log10(vstopa)*log10(esqstop/esqpass)

# Answer is:
ceil(nanalogue)
```

# Determine the value of K to n sig figs
```matlab
fs=109250;
Omegacf=2*pi/19.1;
alpha=1/tan(Omegacf/2);
N=fs;
Q=1/sqrt(2);
B=[1 2 1]*K;
A=[1 2*(1-alpha^2)/(alpha^2+alpha/Q+1) (alpha^2-alpha/Q+1)/(alpha^2+alpha/Q+1)];
[H,f]=freqz(B,A,N,fs);
semilogx(f,20*log10(abs(H)),'LineWidth',5);
hold on
ax1=gca;
xlabel('frequency, Hz')
ylabel('magnitude response, dB')
grid(ax1,'on')
grid(ax1,'minor')
ax1.LineWidth=2;
hold off
```
Missing line is after `Q=`: `K=1/(alpha^2+alpha/Q+1);`
Answer to this question for 4 sig figs is $0.02183$.
# How many samples will be in the entire signal?
```matlab
fs=12.4e3;  
Ts=1/fs;  
tlen=7.6;  
t=0:Ts:tlen − Ts;  
N=length(t);
```

```math
fs=12.4e3
Ts=1/fs
tlen=7.6
N=tlen/Ts
# Answer: (*1e3)
N/1000
```
# Give a name (two words) for the variable fs?
"sampling frequency"
(not "sample frequency"! grumble grumble)
# In the frequency domain for $|X|$, which frequency bin will possess a peak to represent the main frequency of the signal?
```matlab
f1=1.12e3;
fs=38e3;
Ts=1/fs;
tlen=0.8;
t=0:Ts:tlen - Ts;
N=length(t);
x=sin(2*pi*f1*t);
standev=1;
n=randn(1,N)*standev;
xn=x+n;
magX=abs(fft(x));
magXn=abs(fft(xn));
fbin=fs/N;
f=0:fbin:fs - fbin;
semilogx(f,20*log10(magX),'LineWidth',3)
hold on
semilogx(f,20*log10(magXn),'LineWidth',2)
%axis([0 fs/2 - 260 100]);
xlabel('frequency, Hz');
ylabel('magnitude gain, dB');
legend('original signal','with noise');
hold off
```
Answer is `f1/fbin+1`. For this question, it's 897
For calculating `N`, see [[#How many samples will be in the entire signal?]]

# What band of frequencies will this filter keep?
```matlab
f1=1.8e3;
fs=22.6e3;
Ts=1/fs;
tlen=.4;
t=0:Ts:tlen-Ts;
N=length(t);
x=sin(2*pi*f1*t);
standev=1;
noise=randn(1,N)*standev;
xn=x+noise;
fcf=525;
Omegacf=2*pi*fcf/fs;
fo=f1;
Omegao=2*pi*fo/fs;
M=1001;
n=(0:M-1)-floor(M/2);
h=Omegacf/pi*sinc(n*Omegacf/pi);
w=hamming(M)';
A=1;
B=h.*w.*cos(n*Omegao);
y=filter(B,A,xn);
subplot(2,1,1)
plot(t,x,'LineWidth',3);
hold on
plot(t,xn,'LineWidth',1);
plot(t,y,'g','LineWidth',2);
axis([1/f1*100 1/f1*110 -4 4]);
xlabel('time,s');
ylabel('amplitude, arbitrary units');
legend('original signal','with noise','filtered');
hold off
X=fft( x );
Xn=fft( xn );
Y=fft( y );
subplot(2,1,2)
fbin=fs/N;
f=0:fbin:fs-fbin;
plot(f,20*log10(abs(X)),'LineWidth',3);
hold on
plot(f,20*log10(abs(Xn)),'LineWidth',1);
plot(f,20*log10(abs(Y)),'g','LineWidth',2);
xlabel('frequency, Hz');
ylabel('magnitude response, dB');
legend('noisy signal spectrum','filtered spectrum')
axis([1e2 fs/2 -40 100])
hold off
```
