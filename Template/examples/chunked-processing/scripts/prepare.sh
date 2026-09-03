#!/usr/bin/env sh
set -eu

INPUT="${1:-input/source.txt}"
LINES_PER_CHUNK="${LINES_PER_CHUNK:-80}"

mkdir -p work/chunks work/results output
rm -f work/chunks/chunk-* 2>/dev/null || true

if [ ! -f "$INPUT" ]; then
  echo "Eingabedatei fehlt: $INPUT" >&2
  exit 1
fi

split -d -a 3 -l "$LINES_PER_CHUNK" "$INPUT" work/chunks/chunk-

echo "Chunks erstellt:"
find work/chunks -type f -maxdepth 1 -print | sort
