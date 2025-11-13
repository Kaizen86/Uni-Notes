FIXME: This may need expanding!

FIR filters do not have feedback. This is the main distinguishing characteristic.

# Design Methodology
These can be designed in a number of different ways. A somewhat simple method is known as the *windowed sinc* method.
Say we have an input to an [[Linear Time Invariant Systems|LTI]]:
$$
\begin{gather}
	&x[n] &\rightarrow \boxed{\text{LTI System } h[n]=w[n] \cdot s[n]} \rightarrow &y[n] \\
	&Input & &Output
\end{gather}
$$
- $w$ is the window function, and $s$ is the sinc function

$sinc$ function in the time domain corresponds to a brick-wall filter response. In the frequency domain, it (ideally) has a sharp edge. (This depends on the $sinc$ pulse going to infinity, but in the real world it gets truncated)
![[sinc-pulse.png]]
- In this case, 0.5Hz is the "Critical frequency", where it transitions from pass-band to stop-band.
To achieve a perfect brick-wall response, you would need an infinitely-long $sinc$ pulse, so the time domain convolution would take literally forever. You can get close to perfect, but at the cost of lots of time and resources. This is obviously impractical in the real world, so we truncate it with [[Window Functions]].
