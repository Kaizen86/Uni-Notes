HDL is concurrent; all processes happen simultaneously. It is not like writing sequential computer code.

VHDL lets you organise functionality by modules. In a hierarchy, functionality is split into smaller modules, and there is one top-level module which ultimately binds IO to modules. There is one source file per module.

# Overview of VHDL code
## Libraries and packages
Different versions of the VHDL Standard called a library. Libraries contain packages such as `IEEE.std_logic_1164` for logic level functionality or `IEEE.numeric_std` for integers and basic mathematic operations. Import a package with:
```vhdl
library IEEE;
use IEEE.std_logic_1164;
```

## Entity and Architecture
Entity is where inputs and outputs are defined. Architecture contains Behavioural implementations, which define the logic of the circuit. Vivado takes care of writing the Entity section for you by asking for all the inputs/outputs when creating a source file.
## Signals
For internal connections within the circuit, use a signal. These do not go in the Entity section because that's only for exposing inputs/outputs. Signals are not case sensitive.
## Extended Identifiers
These allow using unusual names for signals/pins which would otherwise be rejected. There is generally no good reason to use this, stick to basic identifiers! It's a neat trick though.
```vhdl
23_mySignal -- Invalid; starts with number
open, register -- Invalid; reserved keywords

\23_mySignal\ -- Valid
\open, register\ -- Valid
```

## Example: Half Adder
```vhdl
entity HalfAdder is
	-- Declaritive part, created automatically by Vivado
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Carry : out STD_LOGIC);
end HalfAdder;

-- You can call the architecture whatever you damn well please lol
-- The default is Behavioural but I chose GateLevel
architecture GateLevel of HalfAdder is
begin
	-- Statement part, where circuit logic goes
	
	--   Half Adder truth table
	-- | A   | B   | Sum | Carry |
	-- | --- | --- | --- | ----- |
	-- | 0   | 0   | 0   | 0     |
	-- | 0   | 1   | 1   | 0     |
	-- | 1   | 0   | 1   | 0     |
	-- | 1   | 1   | 0   | 1     |
	
    -- S=A^B
    Sum <= A XOR B;
    -- C=A&B
    Carry <= A AND B;

end GateLevel;
```

## Datatypes
```vhdl
integer -- natural number
std_logic -- has 9 values :O
```
