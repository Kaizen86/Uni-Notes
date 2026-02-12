# Embedded System Boot Sequence
- Power-On Reset will wait until Vcc has stabilised
- Initialise Interrupt Vector table
	- This is a list of function pointers which get executed under certain conditions, such as when the processor has finished resetting, or when there's an external interrupt.
	- There is a limited number of entries in the table. For more complicated systems, an operating system can extend this behaviour.
- 

I'm not going to take notes on the syntax/behaviour of C because I'm very familiar with it. The lecturer is explaining where the compiler (linker?) will place constants/variables and the different types of memory (flash/ram/eeprom/unmapped). Also how functions *work*, as in how they allocate space on the stack to store local variables, while the machine code is stored in flash. 

He's explaining C pointers now. I refer you to this helpful diagram:
![[C Pointers.png]]
Pointers are incredibly powerful, but you can quite easily shoot yourself in the foot with them. They can greatly improve efficiency of a program (very important for embedded systems with not many resources), but can lead to inexplicable errors if improperly used. My advice is to be cautious when using them.

Dynamic memory allocation using the heap and `malloc()`, simple stuff
