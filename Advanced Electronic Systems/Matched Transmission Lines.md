This session is being taught by Abdul, not John. This is new, and looks like I will be able to keep up more easily than usual :)

This module purportedly has a very high pass rate, so this should be relatively easy.


Consider an open-loop circuit with some voltage $V_S$ and a resistance $R_s$. You can measure $V_S$ across the output. That's obvious lol. If you add an inductive load $Z_L\,$, you can define it as $Z_L = R + jx$.

Ohm's Law says $V = I \times Z\,$, where $I$ is the current through $Z_L\,$, which is the same as $R_S$. To find the current, rearrange Ohm's Law:
$$
\begin{align}
	 I &= \frac{V_S}{R_S + Z_L} \\
	 V_L &= \frac{V_s}{R_S + Z_L} + Z_L \\
	 V_L &= V_s \times \frac{Z_L}{R_S + Z_L} \\
	 \\
	 V_c &= V_S \cdots
\end{align}
$$
oh fuck. he's going just as fast, but without the pauses John gives us to process the difficult concepts.

# Voltage Divider Method
$$
\begin{align}
	\text{Power} &= V \times I \\
	\text{Power Load} &= V_L \times I \\
	\text{Power} &= \frac{V^2 \text{(RMS)}}{Z} \\
	\text{Power} &= I^2 \text{(RMS)} \times Z \\
\end{align}
$$

$$
\begin{align}
	V_{\text{rms}} &= \frac{V_P}{\sqrt2} \text{is only for sinusoids!} \\
	&\text{The full definition is:} \\
	\text{RMS} &= \sqrt{
		\frac{1}{T} 
		\int^T_0
		f(t)^2 dt
	} \\
	\text{Power} &= V_{rms} \times I_{rms} \times \cos\phi
\end{align}
$$

$$
\begin{align}
	Le &= \frac{LP}\lambda \\
	\lambda &= 
\end{align}
$$


........


# Example 1
A cable is 35km long and has the following distributed constants all per loop:
- Frequency ($F$) is 1MHz
- $R=55\Omega$
- $L=440 \micro\text{H}$
- $C=0.085\micro\text{F}$
- $G=2200\micro\text{S}$
Find the propagation something in Neples/cm?[^1], and then the attenuation coefficient.

$$
\begin{align}
	\Omega = 2\pi F = 2\pi \cdot 1000{,}000
\end{align}
$$
TODO I looked up at the board and it has been replaced with fucking mystical runes.




[^1]: `s/([nN])eples/\1ipples/g`
