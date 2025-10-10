Euler's Identity: $exp(\theta\phi) = sin(\theta)+cos(\phi)$

Input Analogue Filter $\rightarrow$ Analogue to Digital Converter $\rightarrow$ Digital Signal Processor $\rightarrow$ Digital to Analogue Converter $\rightarrow$ Output Analogue Filter

[Audio quantization example](https://chivertj.github.io/dspworksheets/dsp_introduction/Ex_Quantization.html)

# Surprise practice
Apparently everyone else knew this was happening, so I guess I'm blind lol

1. $$
\begin{align}
	f(t) &= 0.5 \times sin(2\pi f t) \\
	f(t) &= 0.5 \times sin(2\pi t \times 21 \times 10^3)
\end{align}
$$
2. $$
\begin{align}
	f[n] &= sin(2pi \times f T_s n) \\
	F_s &= 100,000 \\
	T_s &= \frac{1}{F_s} \\
	f[n] &= sin(2pi \times 1 \times 10^-5 \times n)
\end{align}
$$
3. $$
\begin{align}
	\omega = 0.5\pi
\end{align}
$$
4. uhh
5. 
```math
(0.5*34000)/2
```
$$
\begin{align}
	\omega &= 2\pi f \\
	&= 2\pi \cdot 8500 \\
	&= 17000\pi \; rads/second
\end{align}
$$
6. Complex sinusoid
	$Ae^{j\omega t} = Acos(\omega t)+jAsin(\omega t)$
7. $Ae^{j\Omega n} = Acos(\Omega n)+jAsin(\Omega n)$


## Useful formulas
$$
\begin{align}
	y(t) &= A \cdot sin(2\pi ft) \\
	y(t) &= A \cdot sin(\omega t) \\
	y[n] &= A \cdot sin(2\pi f T_s n) \\
	y[n] &= A \cdot sin(\frac{2\pi fn}{f_s}) \\
	y[n] &= A \cdot sin(\Omega n)
\end{align}
$$
