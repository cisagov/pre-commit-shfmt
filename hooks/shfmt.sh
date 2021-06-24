#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

if [ -z "$(command -v shfmt)" ]
then
  echo "shfmt is required"
  exit 1
fi

shfmt_output=()

while read -r line
do
  shfmt_output+=("$line")
done < <(shfmt "$@")

if [[ ${#shfmt_output[@]} -ne 0 ]]
then
  for file in "${shfmt_output[@]}"
  do
    echo "$file"
  done

  exit 1
fi
