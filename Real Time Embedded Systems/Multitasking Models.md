# Concurrency
This is when multiple tasks *appear* to run at the same time, but in reality the operating system is rapidly switching between tasks[^1] to share a single processor. Most microcontrollers are single-threaded, and this is what FreeRTOS is designed for.
# Parallelism
This is when the different tasks are truly running in parallel, as multiple instructions are executing simultaneously. This is only possible for systems with multiple processor cores. This can improve performance, at the cost of increased power usage.
![[Multitasking.png]]

[^1]: This is called Pre-emptive Multitasking, used by the vast majority of modern operating systems. Interesting historical aside: when the hardware did not have space for an operating system (such as the Apollo 11 Guidance System), the tasks themselves would have code sprinkled throughout to periodically hand control to other tasks. This is called Cooperative Multitasking.
