
An infinitely long [[Impulse Response]]
# [[Finite Impulse Response]] vs IIR
FIR:
- No feedback
- Linear phase and stable
IIR:
- Feedback
- Achieves a better cut-off with fewer calculations

Preferred for linear phase however IIR is better as it uses fewer calculations

IIR filters can be designed using a number of techniques. A well known technique uses "analogue prototypes", based on real electrical circuits with known useful filter properties. This is because analogue filters have been quite well-researched before digital processing was created.
- For instance, a simple passive low-pass 1st order analogue filter could be implemented as an RC circuit:
- ![[RC Circuit.png]]
This circuit can be analysed very simply, via the reactance-based voltage divider rule:
$$
\begin{align}
  V_y &= \frac{R_2}{R_1+R_2} \cdot V_x \\
  \text{becomes:} \\
  V_{out} &= \frac{X_c}{R+X_c}\times V_{in}
\end{align}$$
- Where $X_c = \frac{1}{j \omega c}$, where $c$ is the speed of light.
Substitute the reactance expression:
$$V_{out} = \frac{\frac{1}{j \omega c}}{R + \frac{1}{j \omega c}} V_{in}$$
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
Let the radial critical frequency $\omega_{cf} = 2\pi f_{cf} = \frac{1}{RC}$ (or equivalently $RC = \frac{1}{\omega+{cf}}$):
$$H(\omega) = \frac{1}{1\frac{j\omega}{\omega_{cf}}}$$
This has a magnitude response (in dB):
- TODO insert graph
I have a headache.

# Bilinear Transformation Method
To convert an analogue prototype, like the one just derived, to a digital representation, we can use the Bilinear Transformation (BLT) method. This involves 2 main steps:
1. Apply a prewarp to critical frequencies
	- This involves an equation, such as:
	- $$\omega_{cf} = 2fs tan(\frac{\Omega_{cf}}{2})$$
	- where $fs$ is the sampling frequency, and... TODO copy this
	- This is doing the opposite warp from the next equation, hence "prewarp"
2. Apply BLT equation to the transfer function:
$$H(z) = H'(\omega)|_{j\omega \rightarrow 2fs(\frac{z-1}{z+1})}$$
	- What the entire fuck is that??
	- This is changing the scales in a non-linear way, so a pre-warp is needed (step 1).
------
"There's almost a step 0". Oh great.
0. Determine the normalised digital frequency
$$\Omega_{cf} = \frac{2\pi f_{cf}}{f_s}$$
## Example
$f_{cf} = 1KHz$ and $f_s = 10KHz$
Answer:
$$
\begin{align}
	\Omega_cf = \frac{2\pi \times 1000}{10000} = 0.2\pi
\end{align}
$$
## Example
1. Apply prewarp
$$\omega^{'}_{cf} = 2f_s tan(\frac{0.2\pi}{2})$$
- To help simplify the later expression,
$$\text{let } x = \frac{1}{tan(\frac{\Omega_{cf}}{2})}$$
- Letting this means we have:
	- TODO copy from picture
1. Apply the BLT
$$H(z) = H^{'}(\omega)|_{j\omega = 2f_s\frac{z-1}{z+1}}$$
	- owwww
- TODO copy from picture
"it's horrible, isn't it?" yes, yes it is
"you can think of z a little bit like this omega, but in the digital domain. they can take complex values as well"


---
$$
\begin{align}
	H(z) = \frac{1}{1+ \lbrace \frac{1}{1} \rbrace}
\end{align}
$$
	TODO copy from picture and fix braces
Multiply top and bottom together by $(z+1)$:
	TODO copy from picture
Multiply out the denominator and collect like terms:
	TODO copy from picture
Factor out $(1+d)$ from the denominator:
	TODO copy from picture
Letting ...:
we then have:
$$H(z) = k \frac{(z+1)}{z+\beta}$$
- This is now in a familiar or standard form for a z-domain transfer function.
- That denominator with the $\beta$ term is key to understanding if the system will be stable or oscillate. We'll look at stability first:

## Stability
The roots of the denominator are called *poles*, and the roots of the numerator are called *zeros*. The poles are values of $z$ at which the denominator becomes zero and hence the transfer function would be infinite. For example:
$$\frac{z-z_1}{z-p_1}$$
- Where $z_1$ is the zero and $p_1$ is the pole.
- Here, 
	- TODO copy from picture

For stability, the poles need to be in the unit circle, in the complex z-domain.
- TODO include picture of complex plane
- And point along the unit circle will have a distance of 1 from the origin.
Any pole outside the unit circle will be unstable.
In the analogue domain, you use the s-domain, but here we use the complex z-domain.

## Time-domain Input Output Difference Equation
Recall the z-domain transfer function:
$$H(z) = k \frac{(z+1)}{z+\beta}$$
First, divide top and bottom by z, and that will get us the negative power of z. This will give us terms that are more easily converted to time domain.
- TODO copy from picture and fix bracket height
$$
\begin{align}
	H(z) &= K(\frac{}{}) \\
	& = K(\frac{}{})	
\end{align}
$$
Multiply out the numerator:
- TODO

Noting that:
- TODO
To save time, equate both expressions and cross-multiply by both denominators:
- TODO
Multiplying out:
- TODO
"Now this is the bit of inverse magic. This z function ... time delay to take it back to time domain. Where you're multiplying by $z^{-1}$, that's like a time shift."
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
## 2
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
