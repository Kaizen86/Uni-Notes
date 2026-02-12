He showed the filter circuit we will be measuring
How to use an oscilloscope
- Use 2 channels to compare input and output signals
- "It's like Google Earth, this button zooms in, *zoom zoom zoom zoom*"


For coursework1, we have to do good measurements, keep a handwritten logbook, and design&simulate an 'advanced' filter. It's apparently up to us which filter we make (does not have to be active). For coursework 2, we have to build that filter.
The deadline for both of these is **16th March**.

# Sallen-Key Unity Gain Active Filter
what the fuck does that mean?
Active Filters include an Op-Amp or sometimes transistors. We will be focusing on Op-Amps. Today, we will analyse this circuit:
![[Sallen-Key Unity Gain Active Filter.jpg]]

John: "We won't be going on any detours today."
Someone: "Yeah, right."
John: "I do have big ears, you know..." LOL

# Kirchoff's Current Law (KCL)
$$
\begin{gather}
	I_1 = I_2 + I_3 \quad \enclose{circle}{1}
	\quad
	\boxed{\begin{align}
		I_2=I_+ + I_4 \\
		\text{Assume } I_+ \approx 0\text{A} \\
		\text{Then } I_2 = I_4 \quad \enclose{circle}{2}
	\end{align}} \\
	
	\text{Define expressions for the currents:} \\
	I_1 = \frac{V_i-V_a}{z_1} \enclose{circle}{3} \quad
	I_2 = \frac{V_a-V_+}{z_2} \enclose{circle}{4} \quad
	I_3 = \frac{V_a-V_o}{Z_3} \enclose{circle}{5} \quad
	I_4 = \frac{V_+}{z_4}     \enclose{circle}{6} \\
	
	\text{Determining an expression for } V_a \text{ using } \enclose{circle}{2}, \enclose{circle}{4}, \&\, \enclose{circle}{6}: \\
	
	\boxed{V_a = V_+\left(\frac{z_2+z_4}{z_4}\right)} \quad
	\frac{V_a-V_+}{z_2} = \frac{V_+}{z_4} \\
\end{gather}
$$

## Aim: Determine the transfer function:
oh fuck, brace yourself for this bit!
$$
\begin{align}
	G(s) = \frac{V_o(s)}{V_i(s)} = \frac
		{z_3z_4}
		{z_1z_2 + z_2z_3 + z_1z_3 + z_3z_4}
\end{align}
$$
From $\enclose{circle}{1}$, substituting using $\enclose{circle}{3}$, $\enclose{circle}{4}$, & $\enclose{circle}{5}$:
$$\frac{V_i-V_a}{z_1} = \frac{V_a-V_+}{z_2} + \frac{V_a-V_o}{z_3}$$
Bringing like terms together:
$$
	\frac{V_i}{z_1} =
	\frac{V_a}{z_1} + \frac{V_a}{z_2} + \frac{V_a}{z_3} 
	- \frac{V_+}{z_2} - \frac{V_o}{z_3}
$$
Factoring:
$$
	\frac{V_i}{z_1} =
	V_a \left( \frac1{z_1} + \frac1{z_2} + \frac1{z_3} \right)
	- \frac{V_+}{z_2} - \frac{V_o}{z_3}
$$
Common denominator for $V_a$ and substituting $V_a$ :
$$
	\frac{V_i}{z_1} =
	V_a \left( \frac
		{z_2z_3 + z_1z_3 + z_1z_2}
		{z_1 z_2 z_3}
	\right)
	- \frac{V_+}{z_2} - \frac{V_o}{z_3}
$$
Substituting expression for $V_a$ :

$$
\begin{alignat*}{1}
	\frac{V_i}{z_1} &=
	V_+ \left( \frac
		{z_2 + z_4}
		{z_4}
	\right) \left( \frac
		{z_2z_3 + z_1z_3 + z_1z_2}
		{z_1 z_3 z_4}
	\right)
	&-& \frac{V_+}{z_2} - \frac{V_o}{z_3}
	\\ \\
	
	&= V_+ \frac
		{(z_2+z_4) (z_2z_3 + z_1z_3 + z_1z_2)}
		{z_1 z_2 z_3 z_4}
	&-& \frac{V_+}{z_2} \frac{z_1 z_3 z_4}{z_1 z_3 z_4}
	\;- \frac{V_o}{z_3}
	\\ \\
	
	&= V_+ \left( \frac
		{z_2z_3 + z_1z_3 + z_1z_2 + z_3z_4 + z_1z_4}
		{z_1 z_3 z_4}
	\right)
	&-& \frac{V_o}{z_3}
\end{alignat*}
$$

---
Assuming $V_+ = V_-\,$; also $V_- = V_o\,$, hence $V_+ = V_o\,$.
Applying this substitution:
$$
	\frac{V_i}{\cancel{z_1}} = V_o \left( \frac
		{z_2z_3 + z_1z_3 + z_1z_2 + z_3z_4 + z_1z_4}
		{\cancel{z_1} z_3 z_4}
	\right)
	- \frac{V_o}{z_3} \frac{z_1z_4}{\cancel{z_1}z_4}
$$
Cancelling the common $z_1$ in all the denominators and combining the $V_o$ terms or factors:
$$
	V_i = V_o \left( \frac
		{z_2z_3 + z_1z_3 + z_1z_2 + z_3z_4 + \cancel{z_1z_4} - \cancel{z_1z_4}}
		{z_3 z_4}
	\right)
$$
Dividing through by $V_i$ on both sides and bringing the inverted expression to the other side:
$$
\begin{alignat*}{1}
	G(s) &= \frac{V_o}{V_i} = \frac
		{z_3 z_4}
		{z_2z_3 + z_1z_3 + z_1z_2 + z_3z_4} \\
		
	\text{Rearranging:} \\
	G(s) &= \frac1{
		\frac{z_1 z_2}{z_3 z_4} +
		\frac1{z_4} (z_1+z_2) + 1
	}
\end{alignat*}
$$
This is the required transfer function for the unity gain Sallen-Key filter topology with general impedances. We can now use it to determine the transfer function for a low-pass configuration:
![[Sallen-Key Low Pass Filter.jpg]]

---
From this,
$$
\begin{align}
	&z_1 = R_1; \quad 
	z_2 = R_2; \quad
	z_3 = X_{c1} = \frac1{sC_1}; \quad 
	z_4 = X_{c2} = \frac1{sC_2} \\
	
	&\boxed{\begin{align}
		&\text{Capacitor Reactance can be} \\
		&\text{in the complex frequency:} \\ 
		&X_{c1} = \frac1{j\omega C_1} \\ 
		&\text{ or in the s-domain: } \\
		&s \rightarrow j\omega
	\end{align}}
\end{align}
$$
Substituting these into the transfer function:
$$
\begin{align}
	G_{LP}(s) &= \frac1{
		\frac{R_1R_2}{
			\frac1{s C_1} \times \frac1{s C_2}
		} + s C_2(R_1 + R_2) + 1
	} \\ \\
	&= \frac1{
		s^2 R_1 R_2 C_1 C_2
		+ s C_2(R_1 + R_2) + 1
	}
\end{align}
$$
This can now be related to the standard 2nd order response:
$$
	H_{LP}(s) = \frac1 {
		\frac{s^2}{\omega_o^2} + \frac{s}{\omega_o Q} + 1
	}
$$
Comparing these, we have:
$$
\begin{alignat*}{1}
	\omega_o^2 &= \frac1{R_1R_2 C_1C_2} &\Rightarrow \enspace&
	&\omega_o =& \frac1{\sqrt{R_1R_2 C_1C_2}} \\ \\
	
	\omega_o Q &= \frac1{C_2(R_1+R_2)} &\Rightarrow \enspace&
	&Q =& \frac{\sqrt{R_1R_2 C_1C_2}}{C_2(R_1+R_2)}
\end{alignat*}
$$

# Design Example
Design a 2nd order Butterworth filter ($Q=\frac1{\sqrt{2}}$) and a critical frequency of $f_o =4 \text{ kHz}$. Assume $R_1=R_2=10\text{ k}\Omega$. Determine the required capacitor Farad values to achieve this specification.

$C_2(R_1+R_2) \rightarrow \frac1{\omega_o Q}$

Equating these factors of $s^1$ from expressions:
$$C_2(R_1+R_2) = \frac1{\omega_o Q}$$
Solving for $C_2$ and substituting in the values:
$$
\begin{align}
	C_2 &= \frac{1}{(R_1+R_2) \cdot \omega_o Q}
	= \frac1{(R_1+R_2) \cdot 2\pi f_o Q} \\ \\
	
	&= \frac1{
		(10000+10000) \cdot 2\pi \cdot 4000 \cdot \frac1{\sqrt{2}}
	} \\ \\
	
	&= 2.814 \times 10^9 \text{ F} \\
	&= 2.8 \text{nF}
\end{align}
$$

For $C_1$, equate the values of $s^2$ from both transfer functions and solve for $C_1$:
$$
\begin{align}
	\frac1{\omega_o^2} &= R_1 R_2 C_1 C_2 \\
	\Rightarrow C_1 &= \frac1{R_1 R_2 C_2 (2\pi f_o)^2} \\ \\
	&= 5.6 \times 10^{-9} \text{ F} \\
	&= 5.6 \text{ nF}
\end{align}
$$