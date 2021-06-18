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
shfmt_output=()

# Call shfmt with any optional arguments in addition to the arguments to list
# any files that need changes, write changes to files, and process files starting
# in the current directory.
while read -r line
do
  shfmt_output+=("$line")
done < <(shfmt "$@" -l -w .)

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
