fs=44.1e3;
Ts=1/fs;
tlen=0.5;
t=0:Ts:tlen-Ts;
N=length(t);
fmin=.3e3;
fmax=5e3;
P=0:1/N:1-1/N;
df=(fmax*P-fmin*(P-2))/2;
x=sin(2*pi*t.*df);

subplot(3,1,1)
plot(t,x)
xlabel('time, s')
ylabel('amplitude, arbitary units')
axis([0 1/fmin*5 -1 1])
title('Time Domain')

X=abs(fft(x));
subplot(3,1,2)
fbin=fs/N;
f=0:fbin:fs-fbin;
plot(f,X);
xlabel('frequency, Hz');
ylabel('magnitude gain, dB');
axis([0 fs 0 250])
title('DFT/FFT')

subplot(3,1,3)
stft(x,fs)
