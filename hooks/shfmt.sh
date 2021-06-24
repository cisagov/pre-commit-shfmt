#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

if [ -z "$(command -v shfmt)" ]
then
  echo "shfmt is required"
  exit 1
fi

files_modified=0
# Default options to list files changed and write changes to files
base_options=("-l" "-w")

# Combine the base options with what is passed in from pre-commit
shfmt_options=("${base_options[@]}" "$@")
shfmt_output=()

while read -r line
do
  shfmt_output+=("$line")
done < <(shfmt "${shfmt_options[@]}")

files_modified=${#shfmt_output[@]}

if [[ $files_modified -ne 0 ]]
then
  for file in "${shfmt_output[@]}"
  do
    echo "$file"
  done

  echo "$files_modified file(s) modified"
  exit 1
fi
