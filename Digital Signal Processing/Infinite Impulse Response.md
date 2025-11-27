As the name suggests, it's an infinitely long [[Impulse Response]]
# [[Finite Impulse Response]] vs IIR
FIR:
- No feedback
- Linear phase and stable
IIR:
- Feedback
- Achieves a better cut-off with fewer calculations

FIR is preferred for linear phase however IIR is better as it uses fewer calculations

IIR filters can be designed using a number of techniques. A well known technique uses "analogue prototypes", based on real electrical circuits with known useful filter properties. This is because analogue filters have been quite well-researched before digital processing was created.
- For instance, a simple passive low-pass 1st order analogue filter could be implemented as an RC circuit:
- ![[RC Circuit.png|400]]
Because this circuit has known characteristics, it can be analysed very simply via the reactance-based voltage divider rule:
$$
\begin{alignat}{1}
  &V_y &= \frac{R_2}{R_1+R_2}\, &V_x \\
  \text{becomes:} \\
  &V_{out} &= \frac{X_c}{R+X_c}\, &V_{in}
\end{alignat}
$$
- Where $X_c = \large\frac{1}{j \omega c}$, in which $c$ is the speed of light.
Substitute the reactance expression:
$$
	V_{out} = \frac
		{\frac{1}{j \omega c}}
		{R + \frac{1}{j \omega c}} \,
	V_{in}
$$
Divide both sides by $V_{in}$ and multiply the top & bottom by $j \omega c$:
$$
	\frac{V_{out}}{V_{in}} =
	\frac
		{\frac {\cancel{j \omega c}} {\cancel{j \omega c}} }
		{Rj \omega c + \frac{\cancel{j \omega c}}{\cancel{j \omega c}} }
	= \frac{1}{1+j \omega Rc}
$$
This is a frequency dependent gain function, also known as a transfer function, $H(\omega)$, also known as a transfer function, $H(\omega)$
$$H(\omega) = \frac{1}{1+j \omega R c}$$
Let the radial critical frequency $\omega_{cf} = 2\pi f_{cf} = \large\frac{1}{RC}$ (or equivalently $RC = \large\frac{1}{\omega+{cf}}$):
$$H(\omega) = \frac{1}{1\huge\frac{j\omega}{\omega_{cf}}}$$
This has a magnitude response (in dB):
- ![[RC filter response.jpg|500]]
I have a headache.

# Bilinear Transformation Method
To convert an analogue prototype, like the one just derived, to a digital representation, we can use the Bilinear Transformation (BLT) method. This involves 2 main steps; prewarp and applying the BLT. First though, there's a 'step 0'.
0. Determine the normalised digital frequency
$$\Omega_{cf} = \frac{2\pi f_{cf}}{f_s}$$
1. Apply a prewarp to critical frequencies
	- This involves an equation, such as:
$$\omega_{cf} = 2f_s\, tan\left( \frac{\Omega_{cf}}{2} \right)$$
	- where $fs$ is the sampling frequency, and $\Omega_{cf} = \large\frac{2\pi f_{cf}}{f_s}$ is the [[Window Functions#^explain-normalised-freq|normalised digital frequency]].
	- This is doing the opposite warp from the next equation, hence "prewarp"
	- If we don't do this, the critical frequency will be in the wrong place.
2. Apply BLT equation to the transfer function:
$$H(z) = H'(\omega)|_{\huge j\omega \rightarrow 2fs\left(\frac{z-1}{z+1}\right)}$$
	- What the entire fuck is that??
	- This is changing the scales in a non-linear way, so a prewarp is needed (step 1).
## Example
$f_{cf} = 1\text{KHz}$ and $f_s = 10\text{KHz}$
Answer:
0. Find normalised critical frequency 
$$
\begin{align}
	\Omega_{cf} = \frac{2\pi \times 1000}{10000} = 0.2\pi
\end{align}
$$
1. Apply prewarp
$${\omega'}_{cf} = 2f_s\, tan\left( \frac{0.2\pi}{2} \right)$$
- To help simplify the later expression;
$$\text{let } \alpha = \frac{1}{tan\left( \frac{\Omega_{cf}}{2} \right)}$$
- Letting this means we have:
$$
\begin{align}
	{\omega'}_{cf} &=\frac{2f_s}{\alpha} \\
	\text{Where}\; \alpha &= \frac{1}{tan\left( \frac{0.2\pi}{2} \right)}
\end{align}
$$
- Putting this back into the transfer function, we have:
$$
	{H'}(\omega) 
	= \frac{1}{1+ \huge\frac{j\omega} {{\omega'}_{cf}} }
	= \frac{1}{1+j\omega \huge\frac{\alpha}{2f_s} }
$$

1. Apply the BLT (curly braces to illustrate separate parts)
$$H(z) = H^{'}(\omega)|_{\huge j\omega = 2f_s\frac{z-1}{z+1}}$$
$$
\begin{align}
	&= \frac{1} {1+\left\{ \huge\frac{2f_s \frac{z-1}{z+1} }{{\omega'}_{cf}} \right\}} \\
	\\
	&= \frac{1} {1+\left\{ \huge\frac{2f_s \frac{z-1}{z+1} }{\frac{2f_s}{\alpha}} \right\}}
\end{align}
$$
$$
\begin{align}
	&= \frac{1} {1+\left\{ 2f_s \large\frac{z-1}{z+1} \right\} \div \left\{ \large\frac{2f_s}{\alpha} \right\}} \\
	\\
	&= \frac{1} {1+\left\{ \cancel{2f_s} \large\frac{z-1}{z+1} \right\} \times \left\{ \frac{\large\alpha}{\cancel{2f_s}} \right\}} \\
\end{align}
$$
$$ = \frac{1} {1+\alpha \large\frac{z-1}{z+1} }$$
- owwww
"it's horrible, isn't it?" that's an understatement...
"you can think of z a little bit like this omega, but in the digital domain. they can take complex values as well"
![[its-quite-simple-really.webp|250]]

2. Multiply top and bottom together by $(z+1)$:
$$H(z) = \frac{1}{z+1 + \alpha\left( z-1 \right)}$$
3. Multiply out the denominator and collect like terms:
$$H(z) = \frac{z+1}{z(1+\alpha) + 1-\alpha}$$
4. Factor out $(1+\alpha)$ from the denominator:
$$
	H(z) = \frac{1}{1+\alpha}
	\left( \frac
		{z+1}
		{z + \left\{
			\large\frac {1-\alpha} {1+\alpha}
		\right\}}
	\right)
$$
$$
\begin{gather}
	\text{let}\; \beta=\frac{1-\alpha}{1+\alpha}
	\text{ \& }
	K=\frac{z+1}{z+\beta} \\
	
	\text{we then have:} \\
	H(z) = K \frac{(z+1)}{z+\beta}
\end{gather}
$$
- This is now in a familiar or standard form for a z-domain transfer function.
- That denominator with the $\beta$ term is key to understanding if the system will be stable or oscillate.

## Stability
We can analyse the equation to determine if the given filter will be stable or will oscillate.

The roots of the denominator are called *poles*, and the roots of the numerator are called *zeros*. The poles are values of $z$ at which the denominator becomes zero and hence the transfer function would be infinite. For example:
$$\frac{z-z_1}{z-p_1}$$
- Where $z_1$ is the zero and $p_1$ is the pole.
$$
\begin{alignat}{1}
	&\text{Here,} \\
	&z + \beta &&= 0 \\
	\therefore\; &z &&= -\beta
\end{alignat}
$$
$$\text{so that } p_1 = z = -\beta$$

For stability, the poles need to be in the unit circle, in the complex z-domain.
- ![[IIR Pole Stability diagram.jpg]]
- Any point along the unit circle will have a distance of 1 from the origin.
Any pole outside the unit circle will be unstable and will oscillate.
In the analogue domain, you use the s-domain, but here we use the complex z-domain.

## Time-domain Input Output Difference Equation
Recall the z-domain transfer function:
$$H(z) = K \frac{(z+1)}{z+\beta}$$
1. First, divide top and bottom by z, and that will get us the negative power of z. This will give us terms that are more easily converted to time domain.
$$\frac{z}{z} = 1$$
$$
\begin{align}
	H(z) &= K( \frac
		{1 \cancel{\frac{z}{z}} + \frac{1}{z}} {1 \cancel{\frac{z}{z}} + \frac{\beta}{z}}) \\
	\\
	& = K(\frac {1+z^{-1}} {1+\beta z^{-1}} )
\end{align}
$$
2. Multiply out the numerator:
$$H(z) = \frac{K+K z^{-1}} {1+\beta z^{-1}}$$

3. Equate both expressions and cross-multiply by both denominators:
	- Recall that an [[Linear Time Invariant Systems|LTI System]] in z-domain looks like: $X(x) \rightarrow \boxed{H(z)} \rightarrow Y(z)$
$$
\begin{align}
	\text{Noting that:}\; H(z) &= \frac{Y(z)}{X(z)}, \\
	\left(1+\beta z^{-1}\right) \frac{Y(z)\cancel{X(z)}}{\cancel{X(z)}}
	&= 
\end{align}
$$
- TODO
"Now this is the bit of inverse magic. This z function ... time delay to take it back to time domain. Where you're multiplying by $z^{-1}$, that's like a time shift." I couldn't quite keep up with him there, sorry.
TODO
"When we z-transform it, it becomes much simpler because you're multiplying with z's, and it's just algebra."

Combining these:
$$y[n]+\beta y[n-1] = $$
Solving for $y[n]$:
$$y[n] = kx[n] + kx[n-1] - \beta y[n-1]$$
- This is the time domain difference equation

This can be illustrated as a first-order direct form 1 filter structure. 
- TODO insert diagram
In MATLAB, we can look at this form:
- TODO copy equations
Functions like `filter(B,A,n,fs)` have:

We can use this to implement, for instance, a Butterworth filter

---
## Practice with using Analogue Prototype Method using Bilinear Transformation
### 1.
```math
# Sampling frequency
fs=1000
# Analogue cut-off frequency
fcf=200
# Normalised digital cutoff freq
Omegacf=2*pi*fcf/fs
# Frequency warped analogue cut-off freq
omegacf=2*fs*tan(Omegacf/2)
```
$f_s$ and $f_{cf}$ in Hertz
$\Omega_{cf}$ in rad/sample
$\omega_{cf}$ in rad/second
$\omega_0=\omega_{cf}$ for some reason
- $\alpha = \frac{2f_s}{\omega_0}$ or $\alpha = \frac{1}{tan(\frac{\Omega_{cf}}{2})}$

Analogue prototype transfer function:
$$
\begin{align}
	(j\omega) &= \frac{\omega_0}{j\omega+\omega_0} 
	= \frac{1}{1 + \frac{j\omega}{\omega_0} } \\
	H(s) &= \frac{\omega_0}{s+\omega_0} \\
\end{align}
$$
TODO copy from pictures

---
### 2
```math
# Sampling frequency
fs=1000
# Analogue cut-off frequency
fcf=499
# Normalised digital cutoff freq
Omegacf=2*pi*fcf/fs
# Frequency warped analogue cut-off freq
omegacf=2*fs*tan(Omegacf/2)
```
oh lawdy oh good heavens

# Filters: 2nd Order
TODO include picture of graph comparing 1st/2nd order frequency response slopes

## How to make a 2nd order filter
(this apparently won't be on the exam, phew)
You simply run the filter again! You have 2 filters one after another, in stages. Phrased formally, a 2nd order response can be achieved by cascading two 1st order responses, e.g:
$$
	\text{input} \rightarrow 
	\fbox{1st Order} \rightarrow 
	\fbox{1st Order} \rightarrow
	\text{output}
$$
However, you can't just slap them together and expect things to work; the design of the two staged should not be treated independently. You're likely to get slightly weird attenuation. We need to design them so that the overall response provides the correct amount of attenuation at the critical frequency.

The overall second order response is often described as follows:
$$
	H(\omega) = \frac{1}
		{\left(\frac {j\omega} {\omega_0} \right)^2
		+ \frac {j\omega}	{Q\omega_0}
		+ 1}
$$
This describes the analogue transfer function with a gain at the critical frequency, $\omega_0 = 2\pi f_0 \;\text{rads/s}$, where the gain is given by Q, also known as the "Quality Factor".

For a particular type of filter design, called a Butterworth, we have an overall gain response as $\frac{1}{\sqrt{2}}$. For a second order Butterworth filter, we therefore have:
$$Q = \frac{1}{\sqrt{2}} \;\;\;\;\; Q_{db} = 20\text{log}_{10}(Q) \approx -3.01\text{dB}$$
TODO add space between the equations properly
This value of Q means the filter response can be considered "maximally flat". If Q is greater than this value, then the response will start to have some ripples
TODO include picture of graph - fuck didn't get a photo of it :(

To convert this analogue response to digital, we can use the [[Infinite Impulse Response#Bilinear Transformation Method|Bilinear Transformation Method]] again.
1. Prewarp of the critical frequency
$$
\begin{gather}
	\Omega_0 = \frac{2\pi f_0}{fs} \\
	\text{Where}\; \Omega_0=\text{rad/sample,}\; f_s=\text{sampling frequency,}\; \text{specified critical frequency in Hz}
\end{gather}
$$
	- The pre-warp is then
$$
\begin{gather}
	{\omega'}_0 = 2f_s \tan\left( \frac{\Omega_0}{2} \right) \\
	
	\text{let } \alpha = \frac{1} {\tan\left( \frac{\Omega_0}{2} \right)}
	\text{, so that } {\omega'}_0 = \frac{2f_s}{\alpha}
\end{gather}$$
2. Substitute in the prewarped frequency ${\omega'}_0$ to analogue 2nd order prototype and then perform the BLT:
$$
\begin{align}
	{H'}(\omega) = H(\omega)|_{\huge\omega_0 = {\omega'}_0}
	= \frac{1}{\left(\frac{j\omega}{{\omega'}_0}\right) + \frac{j\omega}{{\omega'}_0Q} + 1}
\end{align}
$$
TODO copy from picture and include John's workings

Applying the BLT: $j\omega \rightarrow 2f_s \frac{z-1}{z+1}$
$$
\begin{align}
	H(z) = {H'}(\omega)|_{\huge j\omega = 2f_s \frac{z-1}{z+1}} \\
	\\
	H(z) = \frac{1}{
		\ldots
	} \\
	\\
	H(z) = \frac{1}{
		\ldots
	} \\
	\\
	H(z) = \frac{1}{
		\ldots
	}
\end{align}
$$

TODO copy long-ass fraction
We need to get $H(z)$ to this fraction of polynomials ("AIM to get").
TODO copy from picture
Multiplying out terms in the denominator and collect like terms together:
$$
\begin{align}
	\alpha^2(z-1)^2 = \alpha^2(z^2 - 2z+1)
		= \alpha^2 z^2 - 2\alpha^2 z + \alpha^2 \\
	\frac{\alpha}{Q} (z-1)(z+1) 
		= \frac{\alpha}{Q} \left( z^2-1 \right)
		= \frac{z^2\alpha}{Q} - \frac{\alpha}{Q} \;(?) \\
	(z+1)^2 = z^2 + 2z + 1
\end{align}
$$
TODO finish copying from picture
To make the denominator factor on $z^2$ equal to 1 (useful as it is a more standard form), we have:
$$
	H(z) = \frac{1}{\alpha^2 + \frac{\alpha}{Q} +1} \times \frac
		{(z+1)^2}
		{\ldots}
$$
TODO finish copying from picture
Multiplying $k$ into the numerator, we have:
$$
	H(z) = \frac
		{\ldots}
		{\ldots}
$$
Multiplying top and bottom by $\huge\frac{z^{-2}}{z^{-2}}$:

Now, this is a bit big, so we can try to summarize it into something we give to Matlab:
$$
\begin{align}
	H(z) = \frac
		{b_0 + b_1\, z^{-1} + b_2\, z^{-2}}
		{a_0 + a_1\, z^{-1} + a_2\, z^{-2}}
\end{align}
$$

[helpful calculator john made](https://chivertj.github.io/dspworksheets/IIRFilters/Design2ndorderDigitalLP.html)

Continued in [[Higher Order IIR Filtering]].
