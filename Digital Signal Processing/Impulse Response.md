The impulse response is the time domain characterisation of an [[Linear Time Invariant Systems|LTI]]. If we know the impulse response and the input then we can determine the output.
- Analogy for a time domain characterisation is a bit like a CV for an LTI System. Human output is characterised by our CV, which describes how we will respond to input.

# What is an Impulse Response?
The impulse response is the response of an LTI system to an impulse function.
- "This is a bit of a circular definition but it'll make sense eventually"

An impulse function looks like this:
$$S[n] =
	\begin{cases}
      1 & \text{for $n=0$;} \\
      0 & \text{elsewhere}
    \end{cases}
$$

Suppose there's an impulse at sample $t=0$ and every other sample is 0. If the impulse function is the input to an LTI System then the output is just the impulse response.
$S[n] \rightarrow$ LTI System $h[n] \rightarrow h[n]$
- Where $S[n]$ is the Impulse Function, the LTI System uses the Impulse Response $h[n]$, the sample Impulse Response $h[n]$ is the output.

# Multiple functions
What happens if you put in *two* Impulse Functions? If we input another impulse function but shifted in time by 1 sample:
$$S[n-1] =
	\begin{cases}
      1 & \text{for $n-1=0$;} \\
      0 & \text{elsewhere}
    \end{cases}
$$
You'd have samples 0 and 1 equal to 1, and all other samples are still 0. You will get $h[n-1]$ as an output.

If the shifted impulse function is input to an LTI system, then
$S[n-1] \rightarrow$ LTI System $h[n] \rightarrow h[n-1]$
-  Where $S[n-1]$ is the shifted impulse function, $h[n]$ is the impulse response, and $h[n-1]$ is the shifted impulse response.
So what happens if our input is
1. $x[n] = S[n]+S[n-1]$
	- Answer is $y[n] = h[n]+h[n-1]$
2. $x[n]=aS[n]+bS[n-2]$
	- $a$ and $b$ are constants which multiply the inputs (see [[Linear Time Invariant Systems#Properties of LTI Systems|Properties of LTI Systems]])
	- Answer is $y[n]=ah[n]+bh[n-2]$
This is quite abstract, which can be difficult to think about.

# What is $h[n]$ ?
Example of a moving average filter, taking the mean average of 3 neighbouring samples:
$$y[n] = \frac{1}{3}x[n] + \frac{1}{3}x[n-1] + \frac{1}{3}x[n-2]$$
*TODO include picture of diagram he drew*
This will remove high-frequency noise from the input signal $x$, which is quite useful!
- Types of sensors with noise: Microphone, thermometer, vibration sensor
This example function is quite crude, you can implement this on a microcontroller like an Arduino very easily, but you can make much better filters. "That's the whole point of DSP."
## Determining the impulse response of this filter
In this case, you have to have an input, we look at different values, shift it along, and look at what the output is. This filter is relatively simple. If we run the filter, here's what happens. The rightmost column is the output, aka the impulse response at $h[n]$.

| $n$ | $x[n]$ | $x[n-1]$ | $x[n-2]$ | $\frac{1}{3}x[n] + \frac{1}{3}x[n-1] + \frac{1}{3}x[n-2]$ |
| --- | ------ | -------- | -------- | ----------------------------------------------------- |
| -2  | 0      | 0        | 0        | 0                                                     |
| -1  | 0      | 0        | 0        | 0                                                     |
| 0   | 1      | 0        | 0        | $\frac{1}{3}$                                         |
| 1   | 0      | 1        | 0        | $\frac{1}{3}$                                         |
| 2   | 0      | 0        | 1        | $\frac{1}{3}$                                         |
| 3   | 0      | 0        | 0        | 0                                                     |
| 4   | 0      | 0        | 0        | 0                                                     |
| 5   | 0      | 0        | 0        | 0                                                     |
# [[Discrete Convolution]]
This shows that we can determine the output of the system for a specific input. However, this can be a bit time consuming. Instead, we can use the impulse response in a mathematical operation called a *convolution*. (See [[Convolution Theorum]])
