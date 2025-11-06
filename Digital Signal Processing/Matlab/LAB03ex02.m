f1=.5e3; % First sine component frequency
f2=.6e3; % Second component frequency
phi1=0; % First component zero phase
phi2=pi/4; % Second component phase quarter-wave
fs=10e3; % Sample frequency
Ts=1/fs; % Sample period
tlen=0.5; % Total duration
t=0:Ts:tlen-Ts; % Compute sample positions
N=length(t); % Count samples

% Create a signal with two sine wave components
x=sin(2*pi*f1*t+phi1) + sin(2*pi*f2*t+phi2);
% Add noise to the signal
standev=1;
n=randn(1,N)*standev;
xn=x+n;

%{
plot(t,x,'LineWidth',3);
hold on
plot(t,xn,'LineWidth',1);
axis([0 1/f1*10 -4 4]);

xlabel('time,s');
ylabel('amplitude, arbitrary units');
legend('original signal','with noise');
hold off
%}

% Part 2 - Moving average noise filter
fcf=f1*1.1;
Omegacf=2*pi*fcf/fs;

plot(t,x,'LineWidth',3);
hold on;
for M=1:100:2001
    disp(A)
    n=(0:M-1)-floor(M/2);
    h=Omegacf/pi*sinc(n*Omegacf/pi);
    w=hamming(M)';
    %w=rectwin(M)';
    A=1; % Seems to be a dampening factor?
    B=h.*w; % Apply window function w
    
    y=filter(B,A,xn);
    
    %{
    plot(t,x,'LineWidth',3);
    hold on
    plot(t,xn,'LineWidth',1);
    plot(t,y,'g','LineWidth',2);
    axis([1/f1*100 1/f1*110 -4 4]);
    
    xlabel('time,s');
    ylabel('amplitude, arbitrary units');
    legend('original signal','with noise','filtered');
    hold off
    %}

    % Part 3 - Plot frequencies of signals
    %X=abs(fft(x));
    %Xn=abs(fft(xn));
    Y=abs(fft(y));
    
    fbin=fs/N;
    f=0:fbin:fs-fbin;
    
    %plot(f,20*log10(X),'LineWidth',3)
    %hold on
    %plot(f,20*log10(Xn),'LineWidth',2)
    %plot(f,20*log10(Y),'g','LineWidth',1)
    plot(f,20*log10(Y), 'LineWidth',1)
    
    axis([0 fs/2 -260 100]);
    
    xlabel('frequency, Hz');
    ylabel('magnitude gain, dB');
    %legend('original signal','with noise','filtered');
    %hold off
end