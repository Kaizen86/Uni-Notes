---
aliases:
  - LTI
---
There are some [helpful calculators](https://chivertj.github.io/dspworksheets) made by the lecturer so we can check our workings

# Linear Time Invariant (LTI) (causal) Systems
Now what the hell do all those words mean?
- Linear: straight line
	- Example of a linear equation is $y = mx+c$
- Invariant: Does not change with respect to something
	- In this case it does not change with respect to linear and time
	- But mostly it's about the 'time' part
- Time invariant: Does not change or vary with respect to time
- Causal: Does not depend on the future inputs
	- Not to be confused with "Casual". ***Looking at you, Martin***

$$
	\text{input (time-based }x[n]\text{)} \rightarrow
	\fbox{LTI System (digital)} \rightarrow
	\text{output } (y[n])
$$
	Where n indicates discrete time samples (whole numbers: 0,1,2,...)

## Examples of LTI Systems
1. Filters
	- Low Pass
	- Band Pass
	- High Pass
	- ![[Filter types.png]]
	- An ideal filter would have completely vertical edges (where the transition band has no width), but that never happens in real life. The picture shows non-ideal realistic filters.

## Mathematical definition of an LTI
For a linear system $y[n] = F(x[n])$
$$f(ax_1[n]+bx_2[n]) = aF(x_1[n])+bF(x_2[n])$$
## Properties of LTI Systems
$x_1[n] \text{ and } x_2[n] \rightarrow \boxed{\text{LTI System }(h[n])} \rightarrow y[n]$
x and y could be multiplied separately, producing e.g. by $ax_1[n]$, then the two products can be added, e.g. $ax_1[n]+bx_2[n]$, then fed into an LTI System $g[n]$ to result in $y[n]$.

Here's the kicker: for an LTI System we can place the LTI System before the multiplication & sum to get an equivalent result.
	$x_1[n] \rightarrow \boxed{\text{LTI System } g[n]} \rightarrow \text{multiply by } xa$
	$x_2[n] \rightarrow \boxed{\text{LTI System } g[n]} \rightarrow \text{multiply by } xb$
	Then add products of $xa$ and $xb$ to create $y[n]$
$g[n]$ is called an [[Impulse Response]]!


