[Animation of Cross Correlation](https://chivertj.github.io/dspworksheets/LTISystems/Ex_corranim.html)
[Interactive GPS Cross-Correlation demo](https://chivertj.github.io/dspworksheets/LTISystems/gps_interactive.html)

The calculation is similar to [[Discrete Convolution]], but there are some important differences. It has a lot of applications, and is often used to compare if two signals match. You'd compare if an incoming signal matches a stored version, and get a peak when the signals match the most. More information on the [Moodle](https://moodle.port.ac.uk/course/view.php?id=2583).

Discrete cross correlation is defined as follows:
$$\begin{align}
	R_{xy}[m] &= (x \star y)[n] \\
	&= \sum^{\infty}_{k=-\infty} x[k] \cdot y[k-m]
\end{align}$$
- Star ($\star$), not an asterix ($*$)!

The maximum of this function, i.e the result of the cross-correlation operation between two signals, represents the point in time where the two signals can be considered to have the most similarity. This is potentially useful for a range of applications such as: 
- medical ultrasound
- car parking sensors
This is where the time where the two signals are found to match can be used to calculate distance, depth, and potentially other useful information. See worksheet and slides for examples. Also, in Matlab, we have used the `xcorr` function.