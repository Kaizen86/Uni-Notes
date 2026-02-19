
# Chebyshev Type 1 (T1) Filter Recipe
These filters designs have a sharper slope immediately around the critical frequency. The trade-off here is having ripples in the passband. 
![[PXL_20260219_111842722~2.jpg]]
Notes:
- The filters in the lab are designed to have 0dB attenuation in the pass-band, but at the cost of the ripples causing amplification just before the critical frequency $f_0$.
- Even order filters behaves differently from odd order.

Chebyshev T1 filters are specified by the amount of ripple in the passband, the filter order, and the critical frequency. Even orders require additional attenuation equivalent to the passband ripple specification. Odd orders do not require this, but the 1st order stage requires frequency scaling, but quality factor (similar to Butterworth but without the frequency scaling factor)
- this is incomprehensible. TODO fix his poor grammar
## Example:
3rd order Chebyshev T1 with 1dB of passband ripple
$$
\begin{gather}
	&\text{1st order} &&\text{2nd order} \\
	\text{input} \rightarrow &\fbox{F=0.4942}& \rightarrow &\fbox{F=0.9971; Q=2.0177}& \rightarrow \text{output}
\end{gather}
$$

| Standard                                                                                                         | with frequency scaling factor                                                                                               |
| ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| 2nd order Low Pass<br>$H_{LP}(s) = \frac1{\frac{s^2}{{\omega_o}^2} + \frac{s}{\omega_o Q} + 1}$                  | <br>$H_{LP}(s) = \frac1{\left(\frac{s}{F\omega_o}\right)^2 + \frac{s}{F\omega_o Q} + 1}$                                    |
| High Pass<br>$H_{HP}(s) = \frac{\frac{s^2}{{\omega_o}^2}} {\frac{s^2}{{\omega_o}^2} + \frac{s}{\omega_o Q} + 1}$ | <br>$H_{HP}(s) = \frac{\left(\frac{Fs}{\omega_o}\right)^2}{\left(\frac{Fs}{\omega_o}\right)^2 + \frac{Fs}{\omega_o Q} + 1}$ |
| 1st order Low Pass<br>$H_{LP}(s) = \frac1{1+\frac{s}{\omega_o}}$                                                 | <br>$H_{LP}(s) = \frac1{1+\frac{s}{F\omega_o}}$                                                                             |
| 1st order High Pass<br>$H_{HP} = \frac{\frac{s}{\omega_o}} {1+\frac{s}{\omega_o}}$                               | <br>$H_{HP} = \frac{\frac{Fs}{\omega_o}} {1+\frac{Fs}{\omega_o}}$                                                           |
TODO increase size of fractions

# Low Pass Chebyshev T1 Example
Design a low-pass 2nd order Chebyshev T1 with 0.1dB of passband ripple and critical frequency of 60Hz. Use the [[Sallen-Key Unity Gain Active Filter|unity gain Sallen-Key]] topology for this.
$$
\begin{gather}
	\text{input} \rightarrow &\fbox{0.1dB attenuation}& \rightarrow &\fbox{2nd order Sallen Key circuit}& \rightarrow \text{output} \\
	&&&F=1.8204 \\
	&&&Q=0.7674 \\
	&&&\text{(from the 0.1dB table)}
\end{gather}
$$
![[PXL_20260219_114450611~2.jpg]]

Split the $R_1$ resistor into a voltage divider with an equivalent resistance of $R_1$.
Theoretical 2nd order response:
$$H(s) = \frac1{\left(\frac{s}{F\omega_0}\right)^2 + \frac{s}{F\omega_0 Q} + 1}$$
Circuit transfer function:
$$G(s) = \frac1{s^2 R_1R_2C_1C_2 + s C_2(R_1+R_2) + 1}$$

We now need to determine suitable component values to achieve the filter specification. Assume values for $R_1 \;\&\; R_2$. Match powers of $s$ factors.
$$
{\begin{gather}
	&C_2 (R_1+R_2) &\& 
	&R_1R_2C_1C_2 = \frac1{F^2 \cdot \omega_o} \\
	
	&\Rightarrow C_2 = \frac1{(R_1+R_2) F \omega_o Q}
	&&\Rightarrow C_1 = \frac1{F^2 \cdot \omega_o \cdot R_1R_2C_1C_2}
\end{gather}}
$$

John: "All the noisy people have left, haven't they?"
Someone: "I'm still here!! :D"
*classroom laughs*

To achieve the attenuation we can split the initial resistor as follows:
![[PXL_20260219_121512997~2.jpg]]
The equivalent resistance to $R_1$ and the required amount of attenuation can be achieved with the following:
$$R_a = \frac{R_1}{H_0} \;\&\; R_b = \frac{R_1}{1-H_0}$$
TODO i just realised it's been $*_0$ all this time, not $*_o\,$. Do a find-and-replace!
For 0.1dB attenuation we have:
TODO insert boxed red part
$$H_0 = 10^{\large\frac{-0.1}{20}} = 0.98855$$
Also, here $R_1 = 10k\Omega$, which means:
$$
	R_a = \frac{10000}{0.98855} = 10.116 k\Omega
	\quad\&\quad
	R_b = \frac{10000}{1-0.98855} = 873.6 k\Omega$$
Verify these provide the required properties.

# Practice Problem № 1
Repeat the design but modified for a 3rd order response with 3dB of passband ripple. (no attenuation required)
TODO copy from picture and insert diagram
$$
\begin{gather}
	\text{input} \rightarrow &\boxed{F=0.2986}& \rightarrow &\boxed{\begin{align} &F=0.9161 \\ &Q=3.0677\end{align}}& \rightarrow \text{output}
\end{gather}
$$
![[PXL_20260219_122914479~3.jpg]]
# Practice Problem № 2 
Repeat both but modified for high pass in both cases.
2nd order high-pass
TODO copy from picture and insert diagram
![[PXL_20260219_122914479~4.jpg]]

3rd order high-pass
![[PXL_20260219_122914479~5.jpg]]