This is a continuation of [[Higher Order IIR Filtering#Alternative Filter Structures]].

Comparison of DF1 and DF2 structures:
![[DF1 DF2 Structure Comparison.png]]
In DF1, we can summarize the equation quite quickly:
$$y[n] = -a_1 \cdot y[n-1] + b_0 \cdot x[n] + b_1 \cdot x[n-1]$$
# Analysing DF2
For DF2, as mentioned earlier, we can swap the operations around and reduce the number of blocks we need to draw. However, to be able to analyse this filter structure, we have to introduce an intermediate variable $w$.
![[IIR DF2.jpg]]
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
The value of $z$ that makes the numerator zero is the 'zero' (lol). $b_0\left( z+\frac{b_1}{b_0} \right) = 0$. Multiplying both sides by $\frac{1}{b_0}$  gives $z+\frac{b_1}{b_0} = 0$. 
The value of $z$ that makes the denominator zero is the pole. $z+a_1 = 0$. Hence $z=-a$ is the pole value. Here, $p_1 = -a_1$ There is only 1 pole for this system as it first order.

Recalling the rules of [[Infinite Impulse Response#Stability|stability]], The magnitude of the pole should be less than 1 to ensure the system is stable.
$$|p_1| < 1$$
The impulse response is the time domain characterisation of the system, in the time domain.
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
		+ \frac{b_1}{z+a_1}
	\right\} \\
	\\
	H(z) 
		&= \frac{b_0 \cdot z + b_1}{z+a_1}
		= \frac{b_0 \cdot z}{z+a_1}
		+ \frac{b_1}{z+a_1} \\
	\\
	&\text{Using z-transform pairs:} \\
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
	h[n] &= Z^{-1}\left\{ H(z) \right\} \\ \\
		&= Z^{-1}\left\{ \frac{b_0 \cdot z}{z+a_1} \right\}
		+ Z^{-1}\left\{ \frac{b_1}{z+a_1} \right\} \\
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
# Parallel Filter Structures
Previously, we have seen how a system can be designed as a cascade of lower order systems. For instance, a 10th order IIR filter can be split into x5 2nd order structures. The advantages include easier design methodology, together with better precision in the calculations on embedded devices. For example:
$$
\begin{gather}
	X(z) \rightarrow &\fbox{4th order}& \rightarrow Y(z) \\
	&H(Z)&
\end{gather}
$$
Series or Cascade arrangement:
$$
\begin{gather}
	X(z)
		\rightarrow &\fbox{2nd order}&
		\rightarrow &\fbox{2nd order}&
		\rightarrow Y(z) \\
	&H_1(z)& &H_2(z)&
\end{gather}
$$
$$H(z) = H_1(z) \times H_2(z)$$

Parallel arrangements are also possible:
![[Parallel Filter Structure.png|600]]
$$H(z) = H_1(z) + H_2(z)$$

# Partial Fraction Expansion
Partial Fraction Expansion (PFE) can be used to split a transfer function into a sum of transfer functions.
### PFE Example
Determine the PFE of following and the corresponding time-domain input/output difference equations for the individual transfer functions.
$$H(z) = \frac{z}{z^2 -0.3z +0.02}$$

Steps involved are:
1. Factorise the denominator
2. Perform the PFE
3. Determine the corresponding time-domain difference equations (input/output)

Using those steps to solve the example:
1. Factorize the denominator (can use $\large\frac{-b \pm \sqrt{b^2-4ac}}{2a}$)
$$H(z) = \frac{z}{(z-0.1) (z-0.2)}$$
2. Perform the PFE
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

That was all step 2?! I counted 8 different things there!

3. Input/output difference equations
![[PFE Parallel Subsystems.jpg|500]]
Here, $Y(z) = Y_1(z) + Y_2(z)$. (Sum of the outputs). This leads to:
$$
	H_1(z) = \frac{Y_1(z)} {X(z)}
	\enspace \& \enspace
	H_2(z) = \frac{Y_2(z)} {X(z)}
$$
Equating these with the expressions for $H_1(z)$ and $H_2(z)$ will then provide us with a path to determining the input/output difference equations for them individually.
## DF2 Example 1
Find z-domain transfer of this DF2:
$$y_1[n] = -10x[n] + 0.1y_1[n-1] \text{ (from } H_1(z) \text{)}$$

Working:
$$
\begin{gather}
	H_1(z) = \frac{-10z}{z-0.1} \\
	\left( \text{also given by } H_1(z) = \frac{Y_1}{X(z)} \right) \\
\end{gather}
$$
$$
\begin{align}
	\frac{Y_1(z)}{X(z)} &= \frac{-10z}{z-0.1} \times \frac{z^{-1}}{z^{-1}} \\
	\Rightarrow \frac{Y_1(z)}{X(z)} &= \frac
		{-10 \cancel{z}\cancel{z^{-1}}}
		{1 \cancel{z}\cancel{z^{-1}} -z^{-1}} = \frac{-10}{1-z^{-1} \cdot 0.1}
\end{align}
$$
Multiplying both sides by the denominator:
$$
\begin{align}
	\frac{Y_1(z)} {\cancel{X(z)}}
		\cdot \cancel{X(z)} \cdot \left(1-z^{-1} \cdot 0.1\right) \\
	= \frac{-10} {\cancel{1-z^{-1} \cdot 0.1}}
			\left(\cancel{1-z^{-1} \cdot 0.1}\right) \cdot X(z)
\end{align}
$$
Multiplying out the remaining terms:
$$Y_1(z) - 0.1 \cdot Y(z) \cdot z^{-1} = -10 \cdot X(z)$$
Taking inverse z-transforms:
$$
\begin{alignat*}{1}
	&Z^{-1}\lbrace Y_1(z)\rbrace
		&&
		&&= y_1[n] \\
	&Z^{-1}\lbrace 0.1 \cdot Y_1(z) \cdot z^{-1}\rbrace
		&&= 0.1 \cdot Z^{-1}\lbrace Y_1(z) \cdot z^{-1}\rbrace
		&&= 0.1 \cdot y_1[n-1] \\
	&Z^{-1}\lbrace -10x \cdot X(z)\rbrace
		&&= -10 \cdot z^{-1}\lbrace X(z) \rbrace
		&&= -10 \cdot x[n]
\end{alignat*}
$$
Using these, yields the overall inverse z-transform. Then we can solve it in terms of the current time output.
$$
\begin{alignat*}{1}
	&y_1[n]& &-0.1 \cdot y_1[n-1] = &-10 \cdot x[n] \\
	\Rightarrow \:
	&y_1[n] =& &+0.1 \cdot y_1[n-1] &-10 \cdot x[n]
\end{alignat*}
$$
- Note: John swapped the order of the terms for some reason. I'm not flipping them because that's easier to read.

Filter structure for this first order subsystem can be drawn here as Direct Form 1:
![[DF1 Example.png|500]]
## DF2 Example 2
Find z-domain transfer of this DF2:
$$
\begin{align}
	y_2[n] = 10x[n] + 0.2y_2[n-1] \bigl(\text{from } H_2(z) \bigr) \\
	
\end{align}
$$

Following a similar derivation, we have:
$$
\begin{align}
	\frac{Y_2(z)}{X(z)}
		&= \frac{10 \cdot Z}{(z-0.2)} \times \frac{z^{-1}}{z^{-1}} \\
	\Rightarrow \frac{Y_2(z)}{X(z)}
		&= \frac
			{10 \cdot \cancel{z}\cancel{z^{-1}} 1}
			{1\cancel{z}\cancel{z^-1}-0.2\cdot z^{-1}}
		= \frac{10}{1-0.2 \cdot z^{-1}}
\end{align}
$$
Cross multiplying by both denominators:
$$
\begin{align}
	&\frac{Y_2(z)}{\cancel{X(z)}} \cdot
		\cancel{X(z)} \cdot \left( 1-0.2 \cdot z^{-1} \right) \\
	&= \frac{10}{\cancel{1-0.2 \cdot z^{-1}}} \cdot 
		\cancel{1-0.2 \cdot z^{-1}} \cdot X(z)
\end{align}
$$
This relates the outputs to the inputs in the z-domain. Multiplying out the remaining terms:
$$Y_2(z) - 0.2 \cdot Y_2(z) \cdot z^{-1} = 10 \cdot X(z)$$
Taking inverse of z-transforms:
$$
\begin{alignat*}{1}
	&Z^{-1}\left\{ Y_2(z)\right\}
		&&
		&&= y_2[n] \\
	&Z^{-1}\lbrace -0.2 \cdot Y_2(z) \cdot z^{-1}\rbrace
		&&= -0.2 \cdot Z^{-1}\lbrace Y_2(z) \cdot z^{-1}\rbrace
		&&= -0.2 \cdot y_2[n-1] \\
	&Z^{-1}\lbrace -10x \cdot X(z)\rbrace
		&&= 10 \cdot z^{-1}\lbrace X(z) \rbrace
		&&= 10 \cdot x[n]
\end{alignat*}
$$
Combining and solving for the current output:
$$
\begin{alignat*}{1}
	y_2[n] &= -&0.2 \cdot y_2[n-1] = 10 \cdot x[n] \\
	\Rightarrow y_2[n] &= &0.2 \cdot y_2[n-1] + 10 \cdot x[n]
\end{alignat*}
$$
- Again, John swapped the order of terms and I have not. No idea why he does that!
---
Drawing the filter structures:
Example 1:
![[DF1 Example Structure.png||600]]
Alternatively, drawing them individually and then on an overall system:

![[DF1 Example Structure Individually.png||400]]
**In the exam you can draw them separately.**

All this does involve a lot of algebra, so [John made a tool](https://chivertj.github.io/dspworksheets/IIRFilters/biquadanalyzermanualentry.html) to help with that. If you're stuck, this can help to compare against.

Example 2 diagram:
![[DF1 Example 2 Structure.png|600]]
For $w[n]$:
![[DF1 Example 2 For w-n.png|500]]
For $y[n]$::
![[DF1 Example 2 For y-n.png|500]]
z-transforming example $\textnumero\: 1$:
$$
	W(z) = \boxed{ 0.5  \cdot X(z)}
         + \boxed{ 0.5  \cdot W(z) \cdot z^{-1}}
         + \boxed{-0.06 \cdot W(z) \cdot z^{-2}}
$$
z-transforming example $\textnumero\: 2$:
$$W(z) = 0.2 \cdot W(z)$$

## Questions
### 1.
Solve for $X(z)$ with example $\textnumero\: 1$ and then factor out $W(z)$
$$
\begin{align}
	\boxed{0.5 \cdot X(z)} &= W(z) 
		+ \boxed{-0.5 \cdot W(z) \cdot z^{-1}}
		+ \boxed{0.06 \cdot W(z) \cdot z^{-2}} \\
	X(z) &= \frac{W(z)}{0.5} \cdot \left( 1
		+ \boxed{-0.5  \cdot z^{-1}}
		+ \boxed{0.06 \cdot z^{-2}}
	\right)
\end{align}
$$
Combine to determine $H(z) = \frac{Y(z)}{X(z)}$:
$$
\begin{align}
	H(z) &= \frac{Y(z)}{X(z)} \\
	&= W(z) \\
	\cdots &\text{ To be continued!}
\end{align}
$$
- TODO John will revisit this later
Important! Aim to get:
$$H(z) = \frac{0.1\cdot z^{-2}} {1-0.5 \cdot z^{-1} + 0.06 \cdot z^{-2}}$$

### 2.
