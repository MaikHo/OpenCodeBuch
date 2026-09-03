#!/usr/bin/env sh
set -eu
FILE="$1"
START="$2"
END="$3"
sed -n "${START},${END}p" "$FILE"
