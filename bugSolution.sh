#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

count=0
lock_file="counter.lock"

# Function to increment the counter
increment_counter() {
  # Acquire the lock
  flock -x "$lock_file"

  local val=$count
  sleep 0.1  # Simulate some work
  count=$((val + 1))

  # Release the lock
  flock -u "$lock_file"
}

# Function to print the counter
print_counter() {
  echo "Counter value: $count"
}

# Create two processes to increment the counter simultaneously
increment_counter &
increment_counter &

# Wait for the processes to finish
wait

# Print the final counter value
print_counter

# Cleanup - remove the lock file
rm -f "$lock_file"