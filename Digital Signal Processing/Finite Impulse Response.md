FIXME: This may need expanding!

FIR filters do not have feedback. This is the main distinguishing characteristic.

# Design Methodology
These can be designed in a number of different ways. A somewhat simple method is known as the *windowed $\textit{sinc}$* method.
Say we have an input to an [[Linear Time Invariant Systems|LTI]]:
$$
\begin{gather}
	&x[n] &\rightarrow \boxed{\text{LTI System } h[n]=w[n] \cdot s[n]} \rightarrow &y[n] \\
	&\text{Input} & &\text{Output}
\end{gather}
$$
- $w$ is the window function, and $s$ is the $\text{sinc}$ function

$\text{sinc}(t)$ function in the time domain corresponds to a brick-wall filter response. In the frequency domain, it (ideally) has a sharp edge. (This depends on the $\text{sinc}$ pulse going to infinity, but in the real world it gets truncated)
![[sinc-pulse.png]]
- In this case, 0.5Hz is the "Critical frequency", where it transitions from pass-band to stop-band.

In DSP, we use *[[Digital Signal Processing/Intro#^define-discrete|discrete]] [[Window Functions#^explain-normalised-freq|normalised]] $\textit{sinc}$*, which is defined as: $\text{sinc}(n) = \frac{\sin(\pi n)}{\pi n}$

To achieve a perfect brick-wall response, you would need an infinitely-long $\text{sinc}$ pulse, so the time domain convolution would take literally forever. You can get close to perfect, but at the cost of lots of time and resources. This is obviously impractical in the real world, so we truncate it with [[Window Functions]].
