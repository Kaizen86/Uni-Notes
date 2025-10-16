$x[n]$ (Discrete input) $\rightarrow h[n]$ (Discrete [[Impulse Response]]) $\rightarrow y[n]$ (Discrete output)

In the time domain:
$$y[n] = (x * h)[n]$$
- The $*$ means [[discrete convolution]], not multiply!

The convolution theorem tells us that the convolution operation is changed to a multiplication in the frequency domain.
$X(\Omega) \rightarrow$ LTI System $H(\Omega) \rightarrow Y(\Omega)$
- Where:
$$
\begin{align}
	Y(\Omega) &= DTFT\{y[n]\} \; \text{(output)} \\
	X(\Omega) &= DTFT\{x[n]\} \; \text{(input)} \\
	H(\Omega) &= DTFT\{h[n]\} \; \text{(transfer function)} \\
\end{align}
$$
	
Therefore you can use simple multiplication in the frequency domain:
$$Y(\Omega) = H(\Omega) \cdot X(\Omega)$$
## Examples
1. Determine the DTFT of the [[impulse response]] for a 3 point moving-average filter:
$$y[n] = \frac{1}{3} \cdot x[n] + \frac{1}{3} \cdot x[n-1] + \frac{1}{3} \cdot x[n-2]$$
Answer: The impulse response of this moving average filter is given as follows:
$$h[n] =
	\begin{cases}
      \frac{1}3 & \text{for} 0<=n<=2 \\
      0 & \text{elsewhere}
    \end{cases}
$$
The DTFT of this can be determined as follows:
$$
\begin{align}
	H(\Omega) &= DTFT\{h[n]\} \\
	&= \sum^\infty_{n=-\infty} h[n] exp(-j \Omega n)
\end{align}
$$
Substituting in the expression for $h[n]$
$$
\begin{align}
	H(\Omega) &= DTFT\{h[n]\} \\
	&= \sum^{-1}_{n=-\infty} 0 exp(-j \Omega n) + ...
\end{align}
$$
- TODO finish transcribing this!
Substituting in the values of $n$ and expanding
$$
\begin{align}
	H(\Omega) = \frac{1}{3} exp(-j \Omega 0) + \frac{1}{3} exp(-j \Omega 1) + \frac{1}{3} exp(-j \Omega 2) \\
\end{align}	$$
	
Expanding each complex exponential using Euler's identity and factorizing the $\frac{1}{3}$
Remember: Euler's identity is $exp(jA) = jsin(A)+cos(A)$ and $exp(c)=1$
- What the fuck??
$$
H(\Omega) = \frac{1}{3}(
	1 + cos(\Omega)-jsin(\Omega)
	  + cos(2\Omega)-jsin(2\Omega))
$$
Combining real and imaginary terms
$$
H(\Omega) = \frac{1}{3}(
	1 + cos(\Omega)-jsin(\Omega)
	  -j(sin(\Omega))+jsin(2\Omega)))
$$
We can then perform further simplification using trigonometric substitutions and/or determine the magnitude and phase of this function.
- Magnitude of a complex number, $A=a+jb$:
$$|A| = \sqrt{a^2+b^2}$$
- Phase:
$$<A = tan^-1\{\frac{b}{a}\}$$
	todo make that a proper triangle thing

----
A simpler case is where the moving average is performed symmetric around zero where
$$y[n] = \frac{1}{3}x[n+1] + \frac{1}{3}x[n] + \frac{1}{3}x[n-1]$$
The impulse response is given by
$$h[n] =
	\begin{cases}
      \frac{1}3 & -1<=n<=1; \\
      0 & \text{elsewhere}
    \end{cases}
$$
The DTFT of this can be determined in a similar way which is resulting in a __real__ transfer function.
$$H(\Omega) = \frac{1}{3}(1 + 2cos(\Omega))$$
The magnitude of this is then
$$|H(\Omega)| = \frac{1}{3}(1 + 2cos(\Omega))$$
In decibels we have
$$H_{db}(\Omega) = 20 \; log_{10}(1 H(\Omega) \\
= 20 \; log_{10}\{\frac{1}{3} (1+2cos(\Omega))\}$$
The convolution theorem tells us that the input signal, in the frequency domain, multiplies with this transfer function (or equivalently sums on the decibel scale)
$$Y_{db}(\Omega) = H{db}(\Omega) + X_{db}(\Omega)$$
- TODO label each as Output, Transfer Function, Input respectively
- This function will modify the input but will not provide a clear single function for this type of moving average filter.
Frequencies close to zero ...
TODO finish copying from pictures

