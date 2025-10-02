Dr. Mahsa Mehrad

This module is reportedly difficult, try not to miss lessons
- Each class covers a concept, so missing a class can cause problems

Module contents:
- FPGA Architecture
- FPGA Design Flow
- Basys 3 FPGA board overview
- Vivado software

Each week:
- 2 hours of lectures
	- After 7 weeks, lectures end so we can focus on lab work
- 2 hours of lab work

2 Assessments: 
- Project Based Learning
- CW1 (50%)
	- January 12th?: Submit code
- CW2 (50%)
	- January 14th?: Submit report individually
	- Report templates available on Moodle
Group and individual parts
- Working on Project Based Learning task in teams of 2
- Group assessed
- Individually assessed

Moodle has lecture recordings and PDF guides for e.g. setting up Vivado.

VHDL stands for VHSIC Hardware Description Language, where VHSIC stands for Very High Speed Integrated Circuits. [IEEE Standard 1076-2019](https://www.0x04.net/~mwk/vstd/ieee-1076-2019.pdf)
Verilog is most used in America and Asia, not in Europe. Europe uses VHDL.

FPGA stands for Field Programmable Gate Array. They are reprogrammable after manufacture, after being deployed (i.e in the field), hence the name. We will be using Basys 3 development boards, commonly used in universities and for prototyping Xilinx Artix-7 chips.

There is a duopoly in the FPGA market; AMD owns Xilinx and Intel owns Altera, collectively owning 90-95% of the market share.

When creating a system, break it down into logical components, then combine their functionality.

# Lab sessions
1. Introduction
2. Testbench design
3. Top-Level VHDL Structure
4. Half Adder Design in VHDL
5. Designing D-Latch
6. Designing D-Flip-Flop
7. "Hello World" project


Configurable Logic Blocks contain a mixture of LookUp Tables (LUTs), sequential/combinational logic, and multiplexers (MUXs). The MUX chooses between connecting the LUT or logic to the output.
In older FPGAs the blocks were "Fine Grain", containing individual transistor pairs. Implementing logic from transistors used a lot of blocks, so now we use "Coarse Grain" blocks with common circuits already implemented.

Programming an FPGAs means powering transistors in the inter-block connection matrix. Each intersection has 6 transistors. When one of these transistors is powered, the wire is connected. This is also why FPGAs are volatile; when power is removed, the transistors discharge and the blocks become disconnected.

# Design flow
1. Functional Specification
2. HDL
	- We can do Behavioural simulation using Testbenches
3. Synthesis
	- Translating HDL to the optimised logic gates
4. Implementation
	- Figuring out how to put this into the FPGA hardware
	- 3 steps: Mapping, placement, and routing
		1. Mapping is putting gates into LUTs
		2. Placement is deciding which logic block should contain which LUT
		3. Routing connects all the logic blocks together
5. Bitstream file
	- Generating the hardware instructions from the implementation

