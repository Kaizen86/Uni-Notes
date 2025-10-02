Lecturer is Dr John Chiverton (Office at A3.06)
- john.chiverton@port.ac.uk

Ground rules:
- Must arrive to lectures by 0910 at latest
	- He dodged the question of what happens if you're late, lol
- No chatting
- Put hands up to ask questions
- He seems like a No Nonsense kind of person

Coursework 50%
- Weekly Matlab exercises and quizzes
- 6 laboratories
	- Start in 3rd week
	- Additional time as a backup on Friday morning 0900-1100  in A0.07 Digital Electronics Lab in Anglesea (but which I probably can't attend)
	- Each lab has a mini-quiz
		- Participation is in person
		- Can also submit video presentations (2 minutes) for any lab we've missed (not yet approved)
	- Log books
End of Teaching Block 1 Exam 50%
- 90 minutes, open book, calculator allowed
Will mostly be using MATLAB

Topics (Undergrad DSP)
- Digital signals
- Frequency domain(s)
	- Discrete Fourier Transform
	- Z-Domain
- Windows
- Filters
- Applications

Weekly format
- Weekly 2 hour lecture
- Weekly 1 hour tutorial
- Some weeks: Labs (Bring own laptops)
Consolidation week when Teaching Block 1 ends (in January)

Moodle has a lot of resources and material we can use, and videos are on the university's video server which he'd like us to watch.
- "Panopto" server

This week (2/10/2025) we're doing Linear Time Invariant Systems
Next week is Discrete Fourier Analysis
Then FIR Filters after that

MATLAB can be downloaded and installed:
- Apps Anywhere, on a university workstation or a personal one by installing a VPN)
- mathworks.com login using university email
Can also use GNU Octave for some aspects

# Introduction to DSP
Brainstorm:
- Square waves
- 0's and 1's
- Analogue to Digital Converters (ADCs)
- Filters
	- Can be analogue or digital
	- Example of analogue is RC low-pass filter
	- Example of digital is operations on discrete samples
		- Could be filtered like ```y[n] = x[n] + weight*x[n-1]```
- Radio transmission
	- Modulation (Not going to cover)
- Digital communications

Discrete samples have discrete time, measured in natural numbers
Suppose we got samples occurring every 25 ms:

| Continuous time (ms) | Discrete time |
| -------------------- | ------------- |
| 0                    | 0             |
| 25                   | 1             |
| 50                   | 2             |
| 75                   | 3             |
| 100                  | 4             |
| 125                  | 5             |
| 150                  | 6             |
| $\ldots$             | $\ldots$      |
$$Fs = \frac{1}{Ts} = \frac{1}{25ms} = \frac{1}{25\times10^-3} = 40$$
Equation for sine wave, where $A$ is amplitude, $f$ is frequency (which can be calculated as  $\frac{1}{cycle\ time}$), $t$ is time:
$$y(t) = A \cdot sin(2\pi \cdot f \cdot t)$$
To make this discrete, $t$ has fixed time intervals instead of being continuous, so $t$ becomes $n \cdot Ts$. Note that $y$ is now indexed with
$$y[t] = A \cdot sin(2\pi \cdot f \cdot n \cdot Ts)$$
Nyquist's sampling frequency $Fs$ states that your sampling rate must be at least twice as the highest frequency you want to capture, otherwise you will observe aliasing distortion.
https://chivertj.github.io/dspworksheets/dsp_introduction/Ex_ContVsSampledSignal.html
Formally, this is written as: $f_s > 2\times f_{max}$ where $fs=\frac{1}{Ts}$ and $f_{max}$ is the maximum frequency being sampled.

The highest frequency humans can hear is approximately 20kHz. Nyquist says the sampling rate must be above twice this maximum frequency. 44.1kHz is a common sampling rate for this reason. Above 20kHz you will find the folding frequency, beyond which you find mirror images of the original spectrum due to aliasing. It is therefore important to filter the incoming signal before it gets sampled. When the sampling frequency is too low, the folding frequency overlaps the spectrum, introducing interference and aliasing frequencies.
https://chivertj.github.io/dspworksheets/dsp_introduction/Ex_SamplingAliasing.html

![[spectrum-folding.jpg]]
