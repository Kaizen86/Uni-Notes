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

TODO copy multiple pictures !!
...
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
# Filter Structures
TODO include diagram of DF1/DF2 comparison
In DF1, we can summarize the equation quite quickly:
$$y[n] = -a_1 \cdot y[n-1] + b_0 \cdot x[n] + b_1 \cdot x[n-1]$$
For DF2, as mentioned earlier, we can swap the operations around and reduce the number of blocks we need to draw. However, to be able to analyse this filter structure, we have to introduce an intermediate variable $w$.
$$y[n] = b_0 \cdot w[n] + b_1 \cdot w[n-1]$$
Note: The z-domain transfer lets us determine the [[Infinite Impulse Response#Stability|stability of the system by checking the magnitude of its poles]].
$$w[n] = x[n] + (-a_1) \cdot w[n-1]$$
Taking the z-transforms of these:
$$
\begin{align}
	&\large Z\left\{ y[n] \right\} = Y(z) & &\large Z\left\{ x[n] \right\} = X(z) \\
	&\large Z\left\{ w[n] \right\} = W(z) & &\large Z\left\{ w[n-1] \right\} = W(z)z^{-1} \\
	\Aboxed{&\large Z\left\{ w[n-2] \right\} = W(z)z^{-2}}
\end{align}
$$

$$
\begin{gather}
	w[n] = x[n] + (-a_1) \cdot w[n-1] \\
	\text{becomes} \\
	Y(z) = b_0 \cdot W(z) + b_1 \cdot W(z) \cdot z^{-1}
\end{gather}
$$
$$
\begin{gather}
	w[n] = x[n] + (-a_1) \cdot w[n-1] \\
	\text{becomes} \\
	W(z) = X(z) -a_1 \cdot W(z) \cdot Z^{-1}
\end{gather}
$$
Applying these to the two time-domain equations can yield the z-domain versions ... dangit missed this bit

To determine the transfer function $H(z) = \large\frac{Y(z)}{X(z)}$, we need to rearrange the equations and solve for $Y(z)$ and $X(z)$:
$$
\begin{align}
	&\boxed{Y(z) = W(z) \left( b_0+b_1 \cdot z^{-1} \right)}
		\text{ Also factored out } W(z) \text{!}\\
	&\boxed{\begin{align}
		X() &= W(z) + a_1 \cdot W(z) \cdot z^{-1}\\
		&= W(z) \left( 1+a_1 \cdot z^{-1} \right)
	\end{align}}
\end{align}
$$
Dividing $Y(z)$ by $X(z)$:
$$
\begin{align}
	\frac{Y(z)}{X(z)} = \frac
		{\cancel{W(z)} \left( b_0+b_1 \cdot z^{-1} \right)}
		{\cancel{W(z)} \left( 1+a_1 \cdot z^{-1} \right)}
\end{align}
$$
This is our transfer function:
$$H(z) = \frac{b_0+b_1 \cdot z^{-1}} {1+a_1 \cdot z^{-1}}$$
To determine the pole, we can multiply top & bottom by $z$ first:
$$
\begin{align}
	H(z) &= 
		\frac
			{b_0 + b_1 \cdot z^{-1}}
			{1 + a_1 \cdot z^{-1}}
		\times \frac{z}{z} \\
	\\
	&= \frac
		{b_0 \cdot z + b_1 \cancel{z^{-1}} \cancel{z^1}}
		{z + a_1 \cancel{z^{-1}} \cancel{z^1}} \\
	\\
	&= \frac
		{b_0 \left( z+\large\frac{b_1}{b_0} \right)}
		{z+a_1}
\end{align}
$$
The value of $z$ that makes the denominator zero is the pole. $z+a_1 = 0$
hence $z=-a$ is the pole value.
Here, $p_1 = -a_1$
There is only 1 pole for this system as it first order.
Recalling the rules of [[Infinite Impulse Response#Stability|stability]], The magnitude of the pole should be less than 1 to ensure the system is stable.
$$|p_1| < 1$$
The impulse response ... TODO copy
$$
\begin{align}
	X(z) \rightarrow &\boxed{H(z)} \rightarrow Y(z) \\
	&Z^{-1} \left\{H(z)\right\} = h[n] \\
	x[n] \rightarrow &\boxed{h(n)} \rightarrow y[n]
\end{align}
$$
Applying this to the previous example:
$$
	Z^{-1} \left\{H(z)\right\}
	= Z^{-1} \left\{
		\frac{b_0 \cdot z}{z+a_1}
		+
		\frac{b_1}{z+a_1}
	\right\}
$$
## from previous
(what does that mean?)
$$
\begin{align}
	H(z) 
		&= \frac{b_0\,z+b_1}{z+a_1}
		= \frac{b_0\,z}{z+a_1}
		= \frac{b_1}{z+a_1} \\
		
	&\text{Using z-transform pairs:} \\
	
	Z^{-1}\left\{ \frac{z}{z-a} \right\}
		&= a^n \cdot u[n]\\
		
	Z^{-1}\left\{ \frac{z \cdot z^{-1}}{z-a} \right\}
		&= a^{n-1} \cdot u[n-1]  \text{ (time delayed)} \\
\end{align}
$$
Using these, we have:
$$
\begin{align}
	h[n]
		&= Z^{-1}\left\{ H(z) \right\}
		= Z^{-1}\left\{ \frac{b_0 \cdot z}{z+a_1} \right\}
		= Z^{-1}\left\{ \frac{b_1}{z+a_1} \right\} \\
	&= b_0(-a_1)^n \cdot u[n]
\end{align}
$$

If $b_0 = 1$, $b_1 = 1$, and $a_1 = 0.5$:

| $n$ | $b_0(-a_1)^n \cdot u[n]$ | $b_1(-a_1)^{n-1} \cdot u[n-1]$ | $h[n]$  |
| --- | ------------------------ | ------------------------------ | ------- |
| 0   | 1                        | 0                              | 1       |
| 1   | -0.5                     | 1                              | 0.5     |
| 2   | -0.25                    | -0.5                           | -0.25   |
| 3   | -0.125                   | 0.25                           | 0.125   |
| 4   | 0.0625                   | -0.125                         | -0.625  |
| 5   | -0.0312                  | 0.0625                         | 0.0312  |
| 6   | 0.0156                   | -0.0312                        | -0.0156 |
This function is asymptotically approaching zero and is indicative of a stable system where the impulse response has this characteristic.
## Parallel Filter Structures
Previously, we have seen how a system can be designed as a cascade of lower order systems. For instance, a 10th order IIR filter can be split into x5 2nd order structures. The advantages include easier design methodology, together with better precision in the calculations on embedded devices. For example:
$$X(z) \rightarrow \boxed{\text{4th order (}H(Z)\text{)} } \rightarrow Y(z)$$
Series or Cascade arrangement:
TODO
Parallel arrangements are also possible:
TODO insert diagram

---
Partial fraction Expansion (PFE) can be used to split a transfer function into a sum of transfer functions.
### Example
Determine the PFE of following and the corresponding time-domain input/output difference equations for the individual transfer functions.
$$H(z) = \frac{z}{z^2 -0.3z +0.02}$$
Steps:
1. Factorise the denominator
2. Perform the PFE
3. Determine the corresponding time-domain difference equations (input/output)

please start a new list obsidian thank you
1. Factorizing (can use $\large\frac{-b \pm \sqrt{b^2-4ac}}{2a}$)
$$H(z) = \frac{z}{(z-0.1) (z-0.2)}$$
2. 
$$
	\frac{H(z)}{z} = \frac{z}{(z-0.1) (z-0.2)}
	= \frac{A}{z-0.1} + \frac{B}{z-0.2}
$$
Cross-multiplying both denominators:
$$\begin{align}
	\frac{1}{(z-0.1)(z-0.2)} 
	&= \frac{A(z-0.2)}{(z-0.1)(z-0.2)} + \frac{B(z-0.1)}{(z-0.2)(z-0.1)} \\
	&= \frac{A(z-0.2)+B(z-0.1)}{(z-0.1)(z-0.2)}
\end{align}
$$
Equating the numerators
$$1 = A(z-0.2) + B(z-0.1)$$
Choosing values of $z$ where the other factors is zero. To determine $A$, let $z = +0.1$
$$
\begin{align}
	1 &= A(0.1 - 0.2) &+ &B(0.1-0.1) \\
	&= A(-0.1) &+ &\underbrace{B(0)}_{\huge=0}
\end{align}
$$
Solving for $A$:
$$A = \frac{1}{-0.1} = 10$$
For $B$, let $z = +0.2$:
$$1 = A(0) + B(0.2-0.1)$$
Substituting these back into $H(z)$
$$
\begin{align}
	&H(z) = \frac{-10}{(z-0.1)} + \frac{10}{(z-0.2)} \\
	&\Rightarrow \\
	&H(z) = \frac{-10z}{z-0.1} + \frac{10z}{z-0.2}
\end{align}
$$
These can now be two parallel subsystems with an overall system response identical to the original $H(z)$.
$$H(z) = H_1(z) + H_2(z)$$

That was all step 2?! There were at least 6 steps there
3. Input/output difference equations
TODO include picture of diagram
Here, $Y(z) = Y_1(z) + Y_2(z)$. (Sum of the outputs). This leads to:
$$H_1(z) = \frac{Y_1(z)}{X(z)} \;\; \& \;\; H_2(z)=\frac{Y_2(z)}{X(z)}$$
Equating these with the expressions for $H_1(z)$ and $H_2(z)$ will then provide us with a path to determining the input/output difference equations for them individually.

Exam date is a Thursday in late January. He can't say exactly what date yet but it should be announced soon.