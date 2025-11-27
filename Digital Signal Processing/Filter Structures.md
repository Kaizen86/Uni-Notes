This is a continuation of [[Higher Order IIR Filtering#Alternative Filter Structures]].

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
	&\large Z\left\{ y[n] \right\} = Y(z) &
	&\large Z\left\{ x[n] \right\} = X(z) \\
	
	&\large Z\left\{ w[n] \right\} = W(z) &
	&\large Z\left\{ w[n-1] \right\} = W(z)z^{-1} \\
	
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
The impulse response is the time domain characterisation of the system, in the time domain.
TODO copy from alex's kindly-provided notes
$$
\begin{align}
	X(z) \rightarrow &\boxed{H(z)} \rightarrow Y(z) \\
	&Z^{-1} \left\{H(z)\right\} = h[n] \\
	x[n] \rightarrow &\boxed{h(n)} \rightarrow y[n]
\end{align}
$$
Applying this to the previous example:
$$
\begin{align}
	Z^{-1} \left\{H(z)\right\}
	&= Z^{-1} \left\{
		\frac{b_0 \cdot z}{z+a_1}
		+
		\frac{b_1}{z+a_1}
	\right\} \\
	\\
	H(z) 
		&= \frac{b_0\,z+b_1}{z+a_1}
		= \frac{b_0\,z}{z+a_1}
		= \frac{b_1}{z+a_1} \\
		
	&\text{Using z-transform pairs:} \\
	\\
	Z^{-1}\left\{ \frac{z}{z-a} \right\}
		&= a^n \cdot u[n] \\
	\\
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
	\\
	&= \left( b_0(-a_1)^n \cdot u[n] \right) 
		+ \left( b_1(-a_1)^{n-1} \cdot u[n-1] \right)
\end{align}
$$

If $b_0 = 1$, $b_1 = 1$, and $a_1 = 0.5$:

| $n$ | $b_0(-a_1)^n \cdot u[n]$ | $b_1(-a_1)^{n-1} \cdot u[n-1]$ | $h[n]$  |
| --- | ------------------------ | ------------------------------ | ------- |
| 0   | 1                        | 0                              | 1       |
| 1   | -0.5                     | 1                              | 0.5     |
| 2   | 0.25                     | -0.5                           | -0.25   |
| 3   | -0.125                   | 0.25                           | 0.125   |
| 4   | 0.0625                   | -0.125                         | -0.625  |
| 5   | -0.0312                  | 0.0625                         | 0.0312  |
| 6   | 0.0156                   | -0.0312                        | -0.0156 |
This function is asymptotically approaching zero and is indicative of a stable system where the impulse response has this characteristic.
## Parallel Filter Structures
Previously, we have seen how a system can be designed as a cascade of lower order systems. For instance, a 10th order IIR filter can be split into x5 2nd order structures. The advantages include easier design methodology, together with better precision in the calculations on embedded devices. For example:
$$X(z) \rightarrow \boxed{\text{4th order } H(Z)} \rightarrow Y(z)$$
Series or Cascade arrangement:
$$
	X(z) \rightarrow
	\fbox{2nd order} \rightarrow
	\fbox{2nd order} \rightarrow
	Y(z)
$$
Parallel arrangements are also possible:
TODO insert diagram because I can't draw that using MathJax

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
$$
\begin{align}
	\frac{1}{(z-0.1)(z-0.2)} 
	&= \frac{A(z-0.2)}{(z-0.1)(z-0.2)} + \frac{B(z-0.1)}{(z-0.2)(z-0.1)} \\
	\\
	&= \frac{A(z-0.2)+B(z-0.1)}{(z-0.1)(z-0.2)}
\end{align}
$$
Equating the numerators
$$1 = A(z-0.2) + B(z-0.1)$$
Choosing values of $z$ where the other factors is zero. To determine $A$, let $z = +0.1$
$$
\begin{alignat}
	1 &= A(0.1 - 0.2) &+ &B(0.1-0.1) \\
	&= A(-0.1 ) &+ &\underbrace{B(0)}_{\huge=0}
\end{alignat}
$$
Solving for $A$:
$$A = \frac{1}{-0.1} = 10$$
For $B$, let $z = +0.2$:
$$1 = A(0) + B(0.2-0.1)$$
Substituting these back into $H(z)$
$$
\begin{alignat}{1}
	&H(z) = \frac{-10}{(z-0.1)} &&+ \frac{10}{(z-0.2)} \\
	&\Rightarrow \\
	&H(z) = \frac{-10z}{z-0.1} &&+ \frac{10z}{z-0.2}
\end{alignat}
$$
These can now be two parallel subsystems with an overall system response identical to the original $H(z)$.
$$H(z) = H_1(z) + H_2(z)$$

That was all step 2?! There were at least 6 steps there
3. Input/output difference equations
TODO include picture of diagram
Here, $Y(z) = Y_1(z) + Y_2(z)$. (Sum of the outputs). This leads to:
$$H_1(z) = \frac{Y_1(z)}{X(z)} \;\; \& \;\; H_2(z)=\frac{Y_2(z)}{X(z)}$$
Equating these with the expressions for $H_1(z)$ and $H_2(z)$ will then provide us with a path to determining the input/output difference equations for them individually.