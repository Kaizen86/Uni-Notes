n=0:12
f=5
T=1/f
Ts=1/12
y=sin(2*pi*f*n*Ts)
stem(n,y)