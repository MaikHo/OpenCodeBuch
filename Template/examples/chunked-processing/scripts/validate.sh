#!/usr/bin/env sh
set -eu

missing=0
for chunk in work/chunks/chunk-*; do
  [ -e "$chunk" ] || continue
  name="$(basename "$chunk")"
  result="work/results/${name}.md"
  if [ ! -s "$result" ]; then
    echo "Fehlendes Ergebnis: $result" >&2
    missing=1
  fi
done

[ "$missing" -eq 0 ] || exit 1

cat work/results/chunk-*.md > output/final.md
printf 'Finalisierung erfolgreich: output/final.md\n'
