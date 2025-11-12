% Setup variables
fs=1e4;
fcf=fs/400;
Omegacf=2*pi*fcf/fs; % Normalised digital frequency
alpha=1/tan(Omegacf/2); % Helps simplify the equations
N=fs;

% No idea; can't find a match in my notes
Q=1/sqrt(2); % as in "q-factor"?
K=1/(alpha^2+alpha/Q+1);

% Second order
B=[1 2 1]*K;
A=[1 2*(1-alpha^2)/(alpha^2+alpha/Q+1) (alpha^2-alpha/Q+1)/(alpha^2+alpha/Q+1)];
[H,f2]=freqz(B,A,N,fs);
semilogx(f2,20*log10(abs(H)),'LineWidth',3);
hold on

% First order
alpha=1/alpha; % Reciprocal of alpha for some reason
B=[alpha alpha]/(1+alpha); % 2 elements, what?
A=[1 (alpha-1)/(1+alpha)];
[H,f2]=freqz(B,A,N,fs);
semilogx(f2,20*log10(abs(H)),'LineWidth',3);

% Sith order (silly)
alpha=1/tan(Omegacf/2);
B=[1 2 1]*K;
A=[1 2*(1-alpha^2)/(alpha^3+alpha/Q+1) (alpha^2-alpha/Q+1)/(alpha^2+alpha/Q+1)];
[H,f3]=freqz(B,A,N,fs);
semilogx(f3,20*log10(abs(H)*300),'LineWidth',3);
hold on

% Configure graph
xlabel('frequency, Hz')
ylabel('magnitude response, dB')
legend('2nd order','1st order', 'sith order','Location','best')
axis([1 1e3 -50 10])
grid on
grid minor
hold off