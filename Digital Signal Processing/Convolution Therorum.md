$x[n]$ (Discrete input) $\rightarrow h[n]$ (Discrete [[Impulse Response]]) $\rightarrow y[n]$ (Discrete output)

In the time domain:
$$y[n] = (x * h)[n]$$
- The $*$ means [[discrete convolution]], not multiply!

The convolution theorem tells us that the convolution operation is changed to a multiplication in the frequency domain.
$X(\Omega) \rightarrow$ LTI System $H(\Omega) \rightarrow Y(\Omega)$
- Where:
$$
\begin{align}
	Y(\Omega) &= \text{DTFT}\{y[n]\} \; \text{(output)} \\
	X(\Omega) &= \text{DTFT}\{x[n]\} \; \text{(input)} \\
	H(\Omega) &= \text{DTFT}\{h[n]\} \; \text{(transfer function)} \\
\end{align}
$$
	
Therefore you can use simple multiplication in the frequency domain:
$$Y(\Omega) = H(\Omega) \cdot X(\Omega)$$
## Examples
1. Determine the DTFT of the [[impulse response]] for a 3 point moving-average filter:
$$
	y[n] = \frac{1}{3} \cdot x[n] + 
	       \frac{1}{3} \cdot x[n-1] +
	       \frac{1}{3} \cdot x[n-2]
$$
Answer: The impulse response of this moving average filter is given as follows:
$$
h[n] =
\begin{cases}
	\frac{1}3 & \text{for } 0 \leq n \leq 2; \\
	0         & \text{elsewhere}
\end{cases}
$$
The DTFT of this can be determined as follows:
$$
\begin{align}
	H(\Omega) &= \text{DTFT}\{h[n]\} \\
	          &= \sum^\infty_{n=-\infty} h[n] \; exp(-j \Omega n)
\end{align}
$$
Substituting in the expression for $h[n]$
$$
H(\Omega) =
	\sum^{-1}_{n=-\infty} 0    \; exp(-j \Omega n) + 
	\sum^{2}_{n=0} \frac{1}{3} \; exp(-j \Omega n) + 
	\sum^{\infty}_{n=3}   0    \; exp(-j \Omega n)
$$
Substituting in the values of $n$ and expanding
$$
H(\Omega) =
	\frac{1}{3} exp(-j \Omega 0) +
	\frac{1}{3} exp(-j \Omega 1) +
	\frac{1}{3} exp(-j \Omega 2)
$$
	
Expanding each complex exponential using Euler's identity and factorizing the $\frac{1}{3}$
Remember: Euler's identity is $exp(jA) = jsin(A)+cos(A)$ and $exp(c)=1$
- What the fuck??
$$
\begin{align}
	H(\Omega) = \frac{1}{3}(
		1 &+ cos( \Omega) - jsin(\Omega)\\
		  &+ cos(2\Omega) - jsin(2\Omega) \,
	)
\end{align}
$$
Combining real and imaginary terms
$$
\begin{align}
	H(\Omega) = \frac{1}{3}(
		1 &+ cos(\Omega) + cos(2\Omega) \\
		  &-j(sin(\Omega) + sin(2\Omega)) \,
	)
\end{align}
$$
We can then perform further simplification using trigonometric substitutions and/or determine the magnitude and phase of this function.
- Magnitude of a complex number, $A=a+jb$:
$$|A| = \sqrt{a^2 + b^2}$$
- Phase:
$$\angle \, A = tan^-1 \left\{ \frac{b}{a} \right\}$$

----
A simpler case is where the moving average is performed symmetric around zero where
$$y[n] = \frac{1}{3}x[n+1] + \frac{1}{3}x[n] + \frac{1}{3}x[n-1]$$
The impulse response is given by
$$
h[n] =
\begin{cases}
	\frac{1}3 & -1 \leq n \leq 1; \\
	0         & \text{elsewhere}
\end{cases}
$$
The DTFT of this can be determined in a similar way which is resulting in a **real** transfer function.
$$H(\Omega) = \frac{1}{3}(1 + 2cos(\Omega))$$
The magnitude of this is then
$$|H(\Omega)| = \frac{1}{3}(1 + 2cos(\Omega))$$
In decibels we have
$$
\begin{align}
	H_{db}(\Omega) &= 20 \; log_{10}(|H(\Omega)|) \\
	&= 20 \; log_{10} \left\{ \frac{1}{3} (1+2cos(\Omega)) \right\}
\end{align}
$$
The convolution theorem tells us that the input signal, in the frequency domain, multiplies with this transfer function (or equivalently sums on the decibel scale). This function will modify the input but will not provide a clear single function for this type of moving average filter.
$$
\begin{gather}
	&Y_{db}(\Omega) = &H_{db}(\Omega) &+ &X_{db}(\Omega) \\
	&\text{(Output)} &\text{(Transfer function)} &\; &\text{(Input)}
\end{gather}
$$

$$
\begin{align}
	&\text{Frequencies close to } 0             &\approx &+0dB \\
	&\text{Frequencies close to } \frac{\pi}{2} &\approx &-30dB \\
	&\text{Frequencies close to } \pi           &\approx &-10dB 
\end{align}
$$
This is almost like a ... (to be continued!)
