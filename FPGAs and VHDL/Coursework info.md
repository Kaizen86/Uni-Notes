# Coursework
Create a wave and display it on the 7 segment display. The switches select which waveform is generated.
Phase 1 is becoming familiar with VHDL code, then Phase 2 is creating the Wave Generator. Phase 2 should not be written from scratch; use Phase 1 as a starting point.
Groups are pre-decided. Good luck, Martin!

## Phase 1
Create a counter that counts from 0000 to 9999
- Divide 100MHz clock to a slower frequency
- Increment a counter
- Display driver to control 7 segments
	- Multiplex each segment as I've done before

## Phase 2
Takes a 50MHz clock, clock enable, and reset line.
Generate square wave, etc.
Show on 7 segment display (as in value 0-9 per segment?)
- Example was 1010 for square wave

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
