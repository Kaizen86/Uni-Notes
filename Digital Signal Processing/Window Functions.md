As the lecturer puts it: *The [[Discrete Time Fourier Transform]] of a $sinc$ function is a brick-wall response in the frequency domain. Unfortunately, this is impossible to achieve in practice. Hence, you need to limit the time-domain $sinc$ function* (to a [[Finite Impulse Response]]) *so the [[Discrete Convolution]] operation can run in a practical amount of time. How much time is practical depends on the signal.*
- Audio signals shouldn't be delayed much more than 1ms or so. This is relatively low frequency
- Higher frequencies need even smaller delays

To get around this, you use a window function. There are a variety of window functions. The common first window function is a rectangular window:
## Rectangular window
- Rectangular window is defined as:
$$
w[n] =
\begin{cases}
	1 & \text{for } {-m} \leq n \leq m; \\
	0         & \text{elsewhere}
\end{cases}
$$
	- Example:
	- ![[rectangular-window.png]]
	- In this picture, $m$=10
	- The total length of the window is $2m+1 = 21$
You can't magically use this "as-is", you need to give it extra variables first.

Note: Normalised digital frequency is $\Omega_{cf}$
- What this means in practical terms (as far as I understand it) is that you always map the sample frequency $F_s$ to $2\pi$, and $\Omega_cf$ refers to a point on this remapped spectrum.
For the $sinc$ function, it needs to be formulated to enable us to design the filter:

$$
\begin{gather}
	s&[n] &= \frac{\Omega_{cf}}{\pi} sinc(&\frac{n \Omega_{cf}}{pi}) \\
	&\text{Discrete time} & &\text{Critical frequency(normalised digital)}
\end{gather}$$
**TODO: fix the spacing above**
The critical frequency is calculated similar before for digital frequencies:
$$\Omega_{cf} = \frac{2 \pi f_{cf} \text{}}{f_s}$$
- Where $f_{cf}$ is the analogue critical frequency, and $f_s$ is the sampling frequency

This will result in a [[LTI]] [[Impulse Response]] being windowed with a rectangular window function:
$$h[n] = w[n] \cdot s[n]$$
The frequency response will then no longer be a brick wall.
- **TODO: include photo of graph**
For rectangular window, the attenuation is $-21dB$. The attenuation depends on the type of window function used. This transition band width can be adjusted, but it's quite long; how can we improve it?

Note: half-power point is $-3db$, which divides total power by 2, but voltage is approximately:
```math
1/sqrt(2)
```


## Other windows
Hann windows have more of a "dome shape", giving more attenuation in the stop-band, at the cost of a larger transition width. Hamming window improves this further, with an even lower attenuation. You choose the window best suited for the signal you're filtering.
These are generally named after the people who discovered them
- Class snickers at the idea of a "John Rectangle" lol

| Window      | Transition Width   | Stopband Attenuation |
| ----------- | ------------------ | -------------------- |
| Rectangular | $2 \cdot 0.9\pi/N$ | 21dB                 |
| Hann        | $2 \cdot 3.1\pi/N$ | 44dB                 |
| Hamming     | $2 \cdot 3.3\pi/N$ | 53dB                 |
| Blackman    | $2 \cdot 5.5\pi/N$ | 74dB                 |
- where N is the length of the window

The rectangular window transition width between the passband and stopband can be calculated using a well-known formula:
$$\Delta\Omega_{TW} = \frac{2 \cdot 0.9 \pi}{N}$$
- Where ...
- TODO copy from photo
This is added with the critical frequency to determine the stopband frequency:
$$\Omega_{dB} = \Omega_{cf} + \Delta\Omega_{TW}$$
There are other window types, where each one has different properties. For instance:

| Window Type | k value | Stopband Attenuation |
| ----------- | ------- | -------------------- |
| Rectangular | 0.9     | 21dB                 |
| Hann        | 3.1     | 44dB                 |
| Hamming     | 3.3     | 53dB                 |
| Blackman    | 5.5     | 74dB                 |
- Where k is $\Delta\Omega_{TW} = \frac{2k\pi}{N}$
- TODO merge tables

### Example
A high-quality audio signal is sampled at 48kHz,  which needs to be prepared for a voice-only channel with a sampling frequency of 18kHz. Determine a suitable low-pass filter to help remove frequencies above half the sampling frequency.
$$f_{s1} = 48000 \;\; f_{s2} = 18000$$
The new folding frequency, $$f_n = \frac{f_{s2}}{2}=9000Hz$$
This is the frequency at which the frequency components need to be sufficiently attenuated. We might also assume the voice channel, which is high quality, to have a bandwidth of 8kHz. This means the transition width is going to need to be 1000Hz (9kHz-8kHz).
TODO: include photo

We will choose a Hamming window as it can achieve 8 bits of resolution in terms of ...
Note: Dynamic range is $20log_{10}(2^Q)$, where $Q$ is the number of bits.

For the Hamming Window, the transition width is given by:
$$\Delta\Omega_{cf} = \frac{2 \cdot 3.3\pi}{N}$$
This can be rearranged:
$$N = \frac{2 \cdot 3.3\pi}{\Delta\Omega_{cf}}$$
We need to determine:
$$\Delta\Omega_{cf} = \frac{2\pi f_TW}{f_s}$$
- where $f_s$ is the original sampling frequency.

1. Determine $\Delta\Omega_{TW}$
$$
\begin{align}
	\Delta\Omega_{TW} &= \frac{2 \cdot 0.9 \pi}{N} \\
	\Delta\Omega_{TW} &= \frac{2 \pi 1000}{48000} = \frac{2\pi}{48} = \frac{\pi}{24} \\
\end{align}
$$
TODO double-check that...
2. Determine $N$
$$
\begin{align}
	N &= \frac{2\pi \cdot 3.3}{ \left( \frac{2\pi}{48} \right) } \\
	&= 3.3 \cdot 48 \\
	&= 158.4  
\end{align}
$$
This needs to be rounded up to achieve the required specification.
