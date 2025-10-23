Calculating these by hand is a bit tedious, but luckily computers can do that for us. MATLAB has a dedicated function called `convolution`, and others have similar but it usually isn't called a convolution for some reason.

Discrete convolution is defined as follows: $y[n] = (x*h)[n]$
- The $*$ means convolution, not multiply!
- Can also be written as $x[n]*h[n]$

## Mathematical definition
$$\begin{align}
	y[n] &= (x \star y)[n] \\
	&= \sum^{\infty}_{k=-\infty} x[k] \cdot y[n-k]
\end{align}$$
$x[n] \rightarrow$ [[LTI]] $h[n] \rightarrow y[n]$
Mathematically we have:
$$
\begin{align}
	y[n] &= (x \star y)[n] \\
	     &= \sum^{\infty}_{k=-\infty} x[k]   \cdot h[n-k] \\
	     &= \sum^{\infty}_{k=-\infty} x[n-k] \cdot h[k]
\end{align}
$$
Example: Convolve:
$$
\begin{align}
	x[n] &= 1,2,0 &(for n&=0,1,2) \\
	h[n] &= 1,-1  &(for n&=0,1)
\end{align}
$$

| $n$\\$k$ | -1         | 0          | 1          | 2          | 3          | $y[n]$ |
| -------- | ---------- | ---------- | ---------- | ---------- | ---------- | ------ |
| -1       | 0          | 1x0        | 2x0        | 0          | 0          | 0      |
| 0        | 0          | 1x1        | 2x0        | 0          | 0          | 1      |
| 1        | 0          | 1x(-1)     | 2x1        | 0          | 0          | -1+2=1 |
| 2        | 0          | 1x0        | 2x(-1)     | 0          | 0          | -2     |
| 3        | 0          | 1x0        | 2x0        | 0          | 0          | 0      |
|          | ($x[k=0]$) | ($x[k=1]$) | ($x[k=2]$) | ($x[k=3]$) | ($x[k=4]$) |        |
