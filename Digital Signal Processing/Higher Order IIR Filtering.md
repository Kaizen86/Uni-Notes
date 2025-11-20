Oh no
This follows on from [[Infinite Impulse Response#Filters 2nd Order]]

Higher order filters can be assembled from a series of 1st and 2nd order stages. For instance, a 3rd order filter can be created as follows:
$$
	\text{input} \rightarrow 
	\boxed{\text{1st order}} \rightarrow
	\boxed{\text{2nd order}} \rightarrow
	\text{output}
$$
Recall that Butterworth filters have -3db at the critical frequency. To achieve a Butterworth response with 3dB of attenuation at the Critical Frequency, the overall gain also needs to be -3dB. The 1st order stage already provides this. Therefore, the 2nd order stage just needs to 0dB at the critical frequency.
$$
\begin{gather}
	\text{input} \rightarrow 
		\boxed{\text{-3dB at }f_c} \rightarrow
		\boxed{\text{0dB at } f_c} \rightarrow
		\text{output} \\
	\text{Total gain at the critical frequency is therefore:} \\
	-3 + 0 = -3\text{dB}
\end{gather}
$$

... table of butterworth quality factors per stage ...

The Q values vary based on the analogue domain poles, which follow a specific pattern in the analogue domain. If we keep to just low/high pass filter, we can treat this as just Q values and skip some maths.
For instance, for a 4th order filter, we have:
$$
\begin{gather}
	\text{input} \rightarrow 
	\boxed{\begin{gather}
		\text{2nd order } \\
		0.5412
		\end{gather}} \rightarrow
	\boxed{\begin{gather}
		\text{2nd order } \\
		1.3066 
		\end{gather}} \rightarrow
	\text{output} \\
	\text{Total gain at the critical frequency} \\
	0.5412 \times 1.3066 = \frac{1}{\sqrt{2}} \\
	\text{which corresponds to:} \\
	20\text{log}_{10} \left( \frac{1}{\sqrt{2}} \right) = -3\text{dB}
\end{gather}
$$
For a 5th order filter, we have:
TODO copy from picture
This combines with the first order stage to give an overall gain of $\frac{1}{\sqrt{2}}$

# How to determine the required filter order
Sometimes, filters are specified as follows:
$$
\begin{align}
	&f_{pass} &= &\text{ passband frequency} \\
	&f_{stop} &= &\text{ stopband frequency} \\
	&A_p &= &\text{ passband allowable attenuation} \\
	&A_s &= &\text{ stopband minimum amount of attenuation} \\
\end{align}
$$
$$
\begin{gather}
	&\text{Required filter order is then:} \\
	&n \ge \frac{1}{2\text{log}_{10}v_s} \cdot \text{log}_{10} \left( 
		\frac{10^{0.1A_s}-1}{\epsilon^2}
	\right) \\
\end{gather}
$$
$$
\begin{align}
	\text{where } v_s &= \frac{f_{stop}}{f_{pass}}
		\text{ (for a low pass filter)} \\
	\text{ and } \epsilon^2 &= 10^{0.1\cdot A_p} -1
\end{align}
$$

```math
f_pass = 12000
f_stop = 48000
a_pass = 3
a_stop = 32
fs=244000
# Normalised digital frequencies
Omega_p = f_pass/fs * 2*pi
Omega_s = f_stop/fs * 2*pi
# Bilinear transform pre-warp:
# Pre-warped frequencies
omegaprime_p = 2*fs*tan((2*pi*f_pass/fs)/2)
omegaprime_s = 2*fs*tan((2*pi*f_stop/fs)/2)
# Butterworth analogue prototype
freq_ratio = v_s = omegaprime_s/omegaprime_p
epsilonsquared = 10^(0.1*a_pass)-1
n = 1/(2*log10(v_s)) * log10((10^(0.1*a_stop)-1)/epsilonsquared)
# Round it up
filter_orders = ceil(n)
```


## Example
Determine the required filter order and filter coefficients ...

holy shit i am so behind
TODO copy multiple pictures !!

Helpful calculators to check working:
https://chivertj.github.io/dspworksheets/IIRFilters/Design2ndorderDigitalLP.html
https://chivertj.github.io/dspworksheets/iirfilterdesign-worksheetcalcs.html

These coefficients are useful to help design the filter and we have a specialised format called "Second Order Stages", or SOS. Splitting the system up into these individual stages is useful for the design step but also the realisation step, where computations can sometimes be sensitive to rounding and truncation that is associated with digital floating point calculations in embedded systems.

A 3rd order system could be structured as follows:
	![[IIR DF1.jpg]]
$$
	H(z) = \frac
	{b_0 \;+\; b_1\; z^{-1} \;+\; b_2\; z^{-2} \;+\; b_3\; z^-3}
	{a_0 \;+\; a_1\; z^{-1} \;+\; a_2\; z^{-2} \;+\; a_3\; z^-3}
$$
This structure could be more sensitive to situations where coefficients close to zero or some some other values may not have sufficient precision in the digital floating point format. Determining the pole positions and other important details could demonstrate that the original system specification met and or the system is subsequently unstable due to the limited precision.
# Alternative Filter Structures
The filter structure that we have seen so far is known as Direct Form 1 (DF1).
There are other structures! A slightly more efficient filter structure which uses fewer time delays is known as a Direct Form 2 (DF2) filter structure. Recalling [[Linear Time Invariant Systems|LTI Systems]], you can swap the order of calculations without affecting the results. This lets us share the time delays in the middle:
	![[IIR DF2.jpg]]
The important part is this gives you the same result as a DF1, just using a slightly fewer resources.