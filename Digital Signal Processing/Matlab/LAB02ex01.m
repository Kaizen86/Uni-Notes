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
