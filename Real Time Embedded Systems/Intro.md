oops i forgot to charge my laptop; battery is at 20% :(
luckily most of this information is unremarkable
# What does "Real-Time" mean?
The prime directive for real-time systems is that they keep up with events as they happen. If, for example, an embedded system is processing audio in groups of 1 second, it cannot take longer than 1 second per group. If it does take longer, it will lag behind.

A real-time system will typically juggle multiple moving parts. In our example, the audio processor may need to respond to an external condition, such as the user pressing a  start/stop button. In that moment, it must temporarily pause whatever it is doing and pay attention to the user. We call this an [[Interrupts|interrupt]].