#!/bin/bash

# Docker Container Action - Entrypoint Script
# This script receives arguments passed from action.yml

NAME=$1
STYLE=$2

case "$STYLE" in
  formal)
    MESSAGE="Good day, $NAME. It is a pleasure to make your acquaintance."
    ;;
  casual)
    MESSAGE="Hey $NAME! Nice to meet you!"
    ;;
  excited)
    MESSAGE="🎉 OMG $NAME!!! SO EXCITED TO SEE YOU!!! 🎉"
    ;;
  *)
    MESSAGE="Hello, $NAME!"
    ;;
esac

# Print output
echo "Greeting generated: $MESSAGE"

# Set output variable for use in workflow
echo "greeting-message=$MESSAGE" >> $GITHUB_OUTPUT

# Example: simulate some work
echo "Processing..."
sleep 1
echo "✅ Greeting action completed!"
