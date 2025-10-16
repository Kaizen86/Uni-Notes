HDL is concurrent; all processes happen simultaneously. It is not like writing sequential computer code.

There are 3 main categories for VHDL code. In Vivado these are called Sources.
1. [[Design Sources]]
2. [[Constraint Files]]
3. [[Simulation Sources]]
# Syntax
## Libraries and packages
Different versions of the VHDL Standard called a library. Libraries contain packages such as `IEEE.std_logic_1164` for logic level functionality or `IEEE.numeric_std` for integers and basic mathematic operations. Import a package with:
```vhdl
library IEEE;
use IEEE.std_logic_1164;
```

## Extended Identifiers
These allow using unusual names for signals/pins which would otherwise be rejected. There is generally no good reason to use this, stick to basic identifiers! It's a neat trick though.
```vhdl
23_mySignal -- Invalid; starts with number
open, register -- Invalid; reserved keywords

\23_mySignal\ -- Valid
\open, register\ -- Valid
```

## Datatypes
### Scalar Types
- Enumerated: a list of values
- Integer
	- Uses [2's complement](https://en.wikipedia.org/wiki/Two%27s_complement). 
	- Default value is maximum signed negative
	- Can be configured as unsigned
- Floating Point (`real`)
- Physical (e.g. `ns` in `wait for 10 ns`)

### Composite types
- Array (all of same type)
	- ```vhdl
	  signal someSig : out std_logic_vector(7 downto 0)
	  ```
		- Strings are arrays too
		- ```vhdl
		  constant MESSAGE: string := "Hello, world!";
		  ```
- Record (can have different types)

Access type and File type are not covered in this module.

## Types of data object
### Constant
- Holds a single value of a given type and cannot change
```vhdl
constant max_value: integer := 255;
```
### Signal
- Holds a list of values of a given type.
	- Present value + set of possible future values
- New values can be assigned at some future time, not now
```vhdl
signal A, B, Y: bit;
```
### Variable
- Holds a single value of a given type
- New value of the same type can be 'assigned' instantly
```vhdl
process
	variable temp: integer := 0;
begin
	temp := temp + 1;
end process
```
### File
- Contains a sequence of values of one or more type
- "Very complicated", not covered in this module

## Enumerated types
- `character` (one of the ASCII set)
- `boolean` (TRUE or FALSE)
- `bit` (either `'0'` or `'1'`)
- `std_logic` (improved version of `bit`, has __9__ values)

| `std_logic` value | Meaning                                        |
| ----------------- | ---------------------------------------------- |
| U                 | Uninitialised (not set yet, the default)       |
| X                 | Unknown (impossible to determine value)        |
| 0                 | Off                                            |
| 1                 | On                                             |
| Z                 | High-impedance (disconnected)                  |
| W                 | Weak signal, can't tell if it should be 0 or 1 |
| L                 | Weak 0                                         |
| H                 | Weak 1                                         |
| -                 | Don't care                                     |
- Integer (signed 32 bit by default)
You can make your own enumerated types, similar behaviour to `enum` in C.
```vhdl
type MY_ENUM is (foo, bar, baz);
subtype MY_SUBTYPE ...
```

## Casting
You can casting functions to convert between data types. This example converts an `std_logic_vector` to a plain `integer` so arithmetic operations can be used on it.
```vhdl
signal some_data_bus: std_logic_vector (7 downto 0);
signal incremented_value: unsigned     (7 downto 0);
...
incremented_value <= unsigned(some_data_bus) + 1;
```
