There are 4 Fourier techniques:
1. [[Fourier Transform]]: continuous and aperiodic (CA)
2. [[Fourier Series]]: continuous and periodic (CP)
3. [[Discrete Time Fourier Transform]]: discrete and aperiodic (DA)
4. Discrete Time Fourier Series: discrete and periodic (DP)
	- Also called [[Discrete Fourier Transform]] (or DFT for short)
We are most concerned by the discrete versions.

# Digital Frequency Analysis
Why would we want to analyse the frequencies in a signal?
- Useful to see different combinations of signals
- Identify sources of interferences
	- Power-line interference at 50/60Hz is common
- WiFi access points and other communications signals
- Audio
	- High quality music (all human hearing range 100-20kHz)
	- Voice (3 or 4 kHz for most useful parts of the signal)

All of these can be processed in the digital domain and even analogue at certain points in the processing chain.


|                                  | Continuous (analogue)                            | Discrete (sampled)                                                                                           |
| -------------------------------- | ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------ |
| **Periodic**<br>(repeating)      | Sine wave<br>A/C power line<br>Fourier Transform | Digital preamble?<br>Any digitised analogue signal (obviously!)<br>Discrete Fourier Transform (DFT)          |
| **Aperiodic**<br>(not repeating) | Human speech<br>Thermal noise?<br>Fourier Series | Random sampled noise<br>Any aperiodic analogue signal (obviously!)<br>Discrete Time Fourier Transform (DTFT) |
Everything we're processing on a computer **must fall into the Periodic Discrete section,** because they have finite memory and discrete samples.