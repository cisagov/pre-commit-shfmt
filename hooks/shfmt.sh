#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

if [ -z "$(command -v shfmt)" ]; then
  echo "shfmt is required"
  exit 1
fi

shfmt_output=()

# Default options to list files changed and write changes to files are included in
# the call to shfmt.
while read -r line; do
  shfmt_output+=("$line")
done < <(shfmt -l -w "$@")

if [[ ${#shfmt_output[@]} -ne 0 ]]; then
  for file in "${shfmt_output[@]}"; do
    echo "$file"
  done

  exit 1
fi
