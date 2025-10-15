HDL is concurrent; all processes happen simultaneously. It is not like writing sequential computer code.

There are 3 main categories for VHDL code. In Vivado these are called Sources.
1. [[Design Sources]]
2. [[Constraint Files]]
3. [[Simulation Sources]]
# Syntax
## Extended Identifiers
These allow using unusual names for signals/pins which would otherwise be rejected. There is generally no good reason to use this, stick to basic identifiers! It's a neat trick though.
```vhdl
23_mySignal -- Invalid; starts with number
open, register -- Invalid; reserved keywords

\23_mySignal\ -- Valid
\open, register\ -- Valid
```

## Datatypes
```vhdl
integer -- natural number
std_logic -- has 9 values :O
```
