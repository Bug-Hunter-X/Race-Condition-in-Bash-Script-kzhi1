# Race Condition in Bash Script

This repository demonstrates a common race condition bug in bash scripting and provides a solution.

## Bug Description
The `bug.sh` script demonstrates a race condition where two processes attempt to increment a shared counter concurrently. Because of the lack of proper synchronization, this can lead to an inaccurate final counter value.

## Solution
The `bugSolution.sh` script demonstrates how to solve this race condition using a mutex (or lock) to ensure that only one process can modify the shared counter at a time.