fs=360;
fcf=fs/10;
Omegacf=2*pi*fcf/fs;
alpha=tan(Omegacf/2);
N=fs;
f=linspace(0,fs,N);

omega = 2*pi*f;
Omega=omega/fs;

H=alpha./(alpha+j*tan(Omega/2));
semilogx(f,20*log10(abs(H)), 'LineWidth',5);
hold on;

B=[alpha alpha]/(1+alpha);
A=[1 (alpha-1)/(1+alpha)];
[H,f2]=freqz(B,A,N,fs);
semilogx(f2,20*log10(abs(H)), 'LineWidth',3);

xlabel('frequency, Hz')
ylabel('magnitude response, dB')
legend('DtFT transfer function', 'z-domain transfer function','Location','best')
axis([0 fs/2 -50 10])
hold off
