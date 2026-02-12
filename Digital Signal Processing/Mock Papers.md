$$
\begin{align}
	\left\{ 
		TODO
	\right\}
\end{align}
$$
$$
	h[n] = \begin{cases}
      \frac{\Omega_{cf}}{\pi} \cdot \text{sinc}\left( (m-n) \right) \dots
		  \text{ for $n=0$;} \\
      0 \text{ elsewhere}
    \end{cases}
$$

# Mock Paper 3
## 3. IIR Bandpass Design

$$
\begin{gather}
	f_s = 800 \text{ KHz} \quad 
		f_l = 150 \text{ KHz} \quad
		f_h = 250 \text{ KHz} \\
	
	\Omega_l = \frac{2\pi \cdot f_l}{f_s}
		\approx 1.178 \text{ rad/sample} \\
	{\Omega_h} \approx 1.963 \text{ rad/sample} \\
	{\omega_l}^{'} \approx 1.069 \text{ rad/sample} \\
	{\omega_h}^{'} \approx 2.395 \text{ rad/sample} \\
	
	\text{Centre Frequency (geometric mean)} \\
	{\omega_o}^{'} 
		= \sqrt{{\omega_l}^{'} \cdot {\omega_h}^{'}} 
		= 1.6 \times 10^6 \text{ rad/s} \\
	
	\text{Bandwidth (warped)} \\
	\dots \\
\end{gather}
$$
Check moodle for finished notes



# Missed a bunch of stuff, oops!!
TODO copy from alex's kindly-provided notes

Recall $H(z) = \frac{y(z)}{x(z)}$. Rearranging, we have $Y(z) = X(z) \cdot H(z)$:
$$X(z) \rightarrow \boxed{H(z)} \rightarrow Y(z)$$
Here, we are given our input:
