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

| Order $N$<br>(Stage) | $Q_1$  | $Q_2$  | $Q_3$  | $Q_4$  | $Q_5$  |
| -------------------- | ------ | ------ | ------ | ------ | ------ |
| 2                    | 0.7071 | ---    | ---    | ---    | ---    |
| 3                    | 1      | ---    | ---    | ---    | ---    |
| 4                    | 0.5412 | 1.3066 | ---    | ---    | ---    |
| 5                    | 0.618  | 1.618  | ---    | ---    | ---    |
| 6                    | 0.5176 | 0.7071 | 1.9319 | ---    | ---    |
| 7                    | 0.555  | 0.8019 | 2.247  | ---    | ---    |
| 8                    | 0.5098 | 0.6013 | 0.9    | 2.5629 | ---    |
| 9                    | 0.5321 | 0.6527 | 1      | 2.8794 | ---    |
| 10                   | 0.5062 | 0.5612 | 0.7071 | 1.1013 | 3.1962 |

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
$$
\begin{align}
	\text{input} \rightarrow
	\boxed{\begin{gather}
		\text{1st order} \\
		\text{gain} = \frac{1}{\sqrt{2}}
		\end{gather}} \rightarrow
	\boxed{\begin{gather}
		\text{2nd order} \\
		Q = 0.6180
		\end{gather}} \rightarrow
	\boxed{\begin{gather}
		\text{2nd order} \\
		Q = 1.6180
		\end{gather}} \rightarrow
	\text{output}
\end{align}
$$
Total gain of 2nd stages of the critical frequency is:
$$0.618\times1.618 \approx 1$$
This combines with the first order stage to give an overall gain of $\frac{1}{\sqrt{2}}$

# Useful Formulae
See [[Infinite Impulse Response#Filters 2nd Order]]
Normalised digital frequency is calculated with:
$$\Omega = \frac{2\pi f}{fs}$$
Pre-warping formula
$${\omega'} = 2f_s \text{ tan}\left( \frac{\Omega}{2} \right)$$
Butterworth filter order is calculated with:
$$
	n \ge \frac{1}{2\cdot\text{log}_{10}(v_s)} \cdot \text{log}_{10} \left( 
		\frac{10^{0.1\cdot A_s}-1}{\epsilon^2}
	\right)
$$
- Where the normalised frequency $v_s$ has $f_o$ which is the critical or bandpass frequency and the free frequency is given by the stop band frequency, i.e $f=f_s$ so that:
$$
\begin{align}
	v_s &= \frac{f}{f_o}
		\text{ for a low pass filter,} \\
	v_s &= \frac{f_o}{f}
		\text{ for a high pass filter,} \\
	\text{and } \epsilon^2 &= 10^{0.1\cdot A_p} -1
\end{align}
$$
# How to determine the required filter order
Sometimes, filters are specified as follows:
TODO include picture of graph
$$
\begin{align}
	f_{pass} &= \text{ passband frequency} \\
	f_{stop} &= \text{ stopband frequency} \\
	A_p &= \text{ passband allowable attenuation} \\
	A_s &= \text{ stopband minimum amount of attenuation} \\
\end{align}
$$
$$
\begin{gather}
	&\text{Required filter order is then:} \\
	&n \ge \frac{1}{2\cdot\text{log}_{10}(v_s)} \cdot \text{log}_{10} \left( 
		\frac{10^{0.1\cdot A_s}-1}{\epsilon^2}
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


This equation can be used to ... the digital case(?) if we use pre-warped pass and stop-band frequencies, i.e:
$$
\begin{align}
	n_s &= \frac{{\omega'}_{stop}} {{\omega'}_{pass}} \text{ (for low pass)} \\
	n_s &= \frac{{\omega'}_{pass}} {{\omega'}_{stop}} \text{ (for high pass)} \\
	\text{where: } \\
	{\omega'}_{pass} &= 2f_s \text{ tan} \left(
		\frac{\Omega_{pass}}{2}
		\right) \\
	{\omega'}_{stop} &= 2f_s \text{ tan} \left(
		\frac{\Omega_{stop}}{2}
		\right) \\
	\text{\&} \\
	\Omega_{pass} &=\frac{2\pi\, f_{pass}}{f_s} \\
	\Omega_{stop} &=\frac{2\pi\, f_{stop}}{f_s} \\
\end{align}
$$

## Example
Determine the required filter order and filter coefficients for a low-pass filter with critical frequency $f_{pass}=12\text{kHz}$ and and a stop-band frequency $f_{stop} = 48\text{kHz}$. The allowable attenuation in the pass-band is $A_p = 3dB$, and the minimum amount of stop-band attenuation is $A_s = 32dB$.

### Filter orders
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
# Round up to nearest filter order
filter_orders = ceil(n)
```
Yay this is correct!
### Filter coefficients
Helpful calculators to check working:
https://chivertj.github.io/dspworksheets/IIRFilters/Design2ndorderDigitalLP.html
https://chivertj.github.io/dspworksheets/iirfilterdesign-worksheetcalcs.html

Note: large section missing, here sorry
$$
\begin{gather}
	\text{input} \rightarrow
		\boxed{1^\text{st}\text{ order}} \rightarrow
		&\boxed{2^\text{nd}\text{ order}}& \rightarrow
		\text{output} \\
	&Q = 1& \\
	&\left( 3^\text{rd}\text{ order} \right)&
\end{gather}
$$
These coefficients are useful to help design the filter and we have a specialised format called "Second Order Stages", or SOS. Splitting the system up into these individual stages is useful for the design step but also the realisation step, where computations can sometimes be sensitive to rounding and truncation that is associated with digital floating point calculations in embedded systems.

A 3rd order system could be structured as follows:
	![[IIR DF1.jpg]]
- And the transfer function looks like this. Note the denominator (right-side) switches sign.
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
The important part is this gives you the same result as a DF1, just using a slightly fewer resources. In practice, fewer time delays means less computer memory being used to store the delayed samples. In specialised DSP devices, there's a limited number of high-speed memory blocks, so this lets us potentially use more of those and improve performance.

DF2 represents a "bi-quadratic system", because there's two quadratic systems. One in the numerator, and one in the denominator.

Continued in [[Filter Structures]].
