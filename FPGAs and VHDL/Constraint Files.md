VHDL describes logical connections in a design, but not which physical pins on the FPGA the design should use. Constraint files (`.xdc`) specify how to map the logical ports in the design to FPGA pins.
- XDC stands for Xilinx Design Constraints.

A line in a constraint file may look like this:
`set_property -dict { PACKAGE_PIN A1  IOSTANDARD LVCMOS33 } [get_ports{sw[0]}]`
- `PACKAGE_PIN` specifies which FPGA pin to use
	- In this case, pin A1.
- `IOSTANDARD` specifies what voltage and transistor technology should be used.
	- `LVCMOS` stands for Low-Voltage [CMOS](https://en.wikipedia.org/wiki/CMOS), and the `33` means 3.3 volts.
- `get_ports` is a function which locates a logical port somewhere in the design.
	- In this case, it's looking for `sw[0]`, which is a particular element in an array called `sw`.
