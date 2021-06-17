#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

if [ -z "$(command -v shfmt)" ]
then
  echo "shfmt is required"
  exit 1
fi

error=1

while (( "$#" ))
do
  echo "$1"
  shift
done

exit "$error"
