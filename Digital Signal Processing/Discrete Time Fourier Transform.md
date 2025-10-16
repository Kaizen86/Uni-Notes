Used for aperiodic and sampled signals.
$$X(\Omega) = \sum^\infty_{n=-\infty} x[n] \; exp(-j \Omega n)$$
Where variable $X(\Omega)$ is the continuous frequency's ($\Omega$) radians/sample, $n$ is the discrete time sample, $exp$ is the exponential ($e$).

# Inverse DTFT
This gets us back to individual samples.
$$x[n] = \frac{1}{2\pi} \int_{2\pi} X(\Omega) \; exp(j \Omega n) \; d\Omega$$
The $2\pi$ limits the integral so it becomes periodic.
