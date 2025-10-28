These files define how a simulation should run, to automatically verify a circuit works properly instead of driving things manually with Force Clock. In Vivado, this is called a Testbench.

The design being simulated is called a Design Under Test (DUT). The testbench creates inputs (stimulus) to drive the DUT and can look at its outputs (output checker).

## Testbench structure
- Library imports
- Entity section (Empty in a testbench because they're a standalone module, meaning they don't connect to the outside world. The section must still be included because VHDL requires it for individual parts. Removing it would turn the module into a dependent part)
- Architecture section
	- `signal` declarations (internal connections used within the testbench)
	- DUT declaration (the testbench needs to know what DUT to test, so declare the existence of the DUT using its `component` definition)
	- `begin` marks end of declarations.
	- DUT instantiation (create an instance of the DUT to use (giving it a name is optional), then connect the inputs/outputs to the testbench's signals with `port map`)
		- `<=` is signal assignment, `port map` uses `=>`
	- Stimulus Process (each process is a sequence of actions, completely independent from other processes)
		- `wait` and `wait for` behave differently. `wait` halts a process forever, `wait_for` halts it for a finite amount of time.

This structure can be simplified by using `entity work.foo`, which combines the DUT declaration and instantiation sections. `work` is a library you have to import.

`bit` can only be 0 or 1, while `std_logic` can have 9 total values (which includes 0 and 1).
