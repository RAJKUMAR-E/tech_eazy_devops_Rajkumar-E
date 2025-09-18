#!/bin/bash

# Ensure struct.txt exists
STRUCT_FILE="struct.txt"
if [[ ! -f "$STRUCT_FILE" ]]; then
  echo "Error: $STRUCT_FILE not found!"
  exit 1
fi

# Convert to Unix format in-place
sed -i 's/\r$//' "$STRUCT_FILE"

# Initialize path stack
current_path=""

# Read the file line by line
while IFS= read -r line; do
  # Remove leading dashes and whitespace
  clean_line=$(echo "$line" | sed 's/^-*//g' | sed 's/^[[:space:]]*//')

  # Count depth based on number of leading dashes
  depth=$(echo "$line" | sed 's/[^-].*//' | wc -c)
  depth=$((depth - 1))  # Adjust for wc output

  # Trim trailing slash to get name
  name=$(basename "$clean_line")

  # Build path
  IFS='/' read -ra path_parts <<< "$current_path"
  path_parts=("${path_parts[@]:0:$depth}")
  current_path=$(IFS='/'; echo "${path_parts[*]}")
  [[ -n "$current_path" ]] && current_path="$current_path/$name" || current_path="$name"

  # Create folder or file
  if [[ "$clean_line" == */ ]]; then
    mkdir -p "$current_path"
  else
    touch "$current_path"
  fi
done < "$STRUCT_FILE"

echo "✅ Structure created successfully."
