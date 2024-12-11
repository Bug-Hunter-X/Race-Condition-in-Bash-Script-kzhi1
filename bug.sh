#!/bin/bash

# This script demonstrates a race condition bug.

count=0

# Function to increment the counter
increment_counter() {
  local val=$count
  sleep 0.1  # Simulate some work
  count=$((val + 1))
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