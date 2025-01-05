# Redis Traces

## PC

The `pc` directory stores stats and analysis that were creating by using the program counter.

On each syscall, the value of the PC was compared to /proc/PID/maps, and its corresponding library was reported.

This is in contrast to stacktrace.

## Stacktrace

In `stacktrace`, stats and analysis are created using stack data.

When assigning a library, the stack is walked and all libc return pointers are ignored*.

A library is assigned to the first non-libc return pointer.

The only exception is where libc pointers are identified but mapping anything after libc fails. In this case, the call site is identified as libc
