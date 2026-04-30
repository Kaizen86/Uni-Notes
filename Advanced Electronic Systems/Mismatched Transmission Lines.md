When a line is matched, the load impedance $Z_L$ matches the characteristic impedance $Z_0\,$. Today we're looking at when they are not matched. 
- When an incident wave coming from the line interacts with the load, there will be no reflection if the impedances match.
- When they are not matched, there will be some power reflected back to the source
	- This represents an inefficiency as not all the power is going into the load.
	- The reflected wave may cause problems with the transmission line equipment.
	- Even worse, the reflection wave amplitude increases *factorially* with increasingly mismatched loads.


1.
$$
\begin{align}
	L=2.5mH \quad C=1\micro F \\
	Z_0 = \sqrt{\frac{R+j\omega L}{?+j\omega L}} \\
	\therefore
	Z_0 = \sqrt{\frac{L}{C}} = \sqrt{\frac
		{2.5\times10^{-3}}
		{1\times10^{-6}} }
	= 50 \Omega
\end{align}
$$
2.
$$
\begin{align}
	f &= 120 \text{MHz} \\
	
	V &= \sqrt{(R+j\omega L)(G?+j\omega C)} 
		= \alpha+j\beta \\
	
	\alpha &= 0 \text{ (because the line is lossless)}
		= R = G = 0 \\ \\
	
	\therefore \alpha+j\beta 
		&= \sqrt{j^2 \omega^2 LC} 
		= j\omega \cdot \sqrt{LC} \\
	
	&= j\beta
		= j 2\pi \cdot 120 \times 10^6 \cdot \sqrt{
			2.5\times10^{-3} \times 1\times10^{-6}}
\end{align}
$$
3?
$$
\begin{align}
	\boxed{\lambda=\frac{V_P}{f}} \quad
	\cdots
\end{align}
$$
