[Animation of Cross Correlation](chivertj.github.io/dspworksheets/LTISystems/Ex_corranim.html)
[Interactive GPS Cross-Correlation demo](chivertj.github.io/dspworksheets/LTISystems/gps_interactive.html)

The calculation is similar to [[Discrete Convolution]], but there are some important differences. Discrete cross correlation is defined as follows:
$$\begin{align}
	R_{xy}[m] &= (x \star y)[n] \\
	&= \sum^{\infty}_{k=-\infty} x[k] \cdot y[k-m]
\end{align}$$
- Star ($\star$), not an asterix ($*$)!

The maximum...
$$\begin{align}
	y[n] &= (x \star y)[n] \\
	&= \sum^{\infty}_{k=-\infty} x[k] \cdot y[n-k]
\end{align}$$
