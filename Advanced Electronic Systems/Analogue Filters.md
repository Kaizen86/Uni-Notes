Writing this on my phone because my laptop ran out of battery >:(
Hopefully John doesn't think ill of me...

Types of Filters:
- RC Circuit
- Low Pass, High Pass, Band Pass, Band Stop
- Butterworth Filter Response
- LC Ladder Filters
- Active Filters
	- Using active components such as Op Amps or transistors
- Analogue Impulse Response
	- $h(t)$
- Transfer Function
	- $H(\omega), H(f), H(j\omega), H(s)$
	- Where $\omega, f, j\omega$ are analogue frequencies, and $s$ is the Laplace ...

For the 1st order low-pass filter:
$$
\begin{align}
	&H(j\omega) = \frac{1}{1+j\omega RC} \\
	&\text{Substitute in } X_c = \frac{1}{j\omega c} \\
	&V_{out} = V_{in} \frac{\frac{1}{j\omega c}}{R + \frac{1}{j\omega c}} = V_{in} \frac{\frac{\cancel{j\omega c}}{\cancel{j\omega c}}1} {Rj\omega c+\frac{\cancel{j\omega c}}{\cancel{j\omega c}}1} \\
    &\text{Divide through by } V_{in}: \\
    &\frac{v_{out}}{v_{in}} = \cdots \times \frac{1}{1+j\omega c RC}
\end{align}
$$
Assume steady state AC conditions. $let\; s=j\omega$ and substiting imto the transfer function. Normally, $s=0+j\omega$
$$H(s) = H(j\omega) |_{\huge s=j\omega} = \frac{1}{1+sRC}$$
This is the Laplace transfer function for the RC circuit with output taken across the capacitor.
TODO insert circuit diagram

For digital, we use Fourier transforms. For analogue, we use Lapace transforms.
TODO copy laplace/fourier transform equations with relation to poles

Zeroes (numerator) increases the magnitude beyond a frequency, while poles (denominator) will reduce the magnitude.
TODO insert diagram.
