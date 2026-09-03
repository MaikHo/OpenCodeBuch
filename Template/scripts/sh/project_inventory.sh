#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"

if [[ ! -d "$ROOT" ]]; then
  echo "Fehler: Verzeichnis '$ROOT' existiert nicht." >&2
  exit 1
fi

echo "# Projektinventur"
echo
echo "Root: $ROOT"
echo
echo "## Dateitypen"
find "$ROOT" -type f \
  -not -path '*/.git/*' \
  -not -path '*/bin/*' \
  -not -path '*/obj/*' \
  | awk '
    function ext(path, base,n,a) {
      n=split(path,a,"/"); base=a[n];
      if (base !~ /\./ || base ~ /^\.[^.]+$/) return "[ohne Endung]";
      sub(/^.*\./,"",base); return "." tolower(base)
    }
    { count[ext($0)]++ }
    END { for (e in count) printf "%s\t%d\n", e, count[e] }
  ' | sort

echo
echo "## Größte Dateien"
# wc -c funktioniert im Gegensatz zu GNU-find -printf auch auf macOS/BSD-Umgebungen.
find "$ROOT" -type f \
  -not -path '*/.git/*' \
  -not -path '*/bin/*' \
  -not -path '*/obj/*' \
  -print0 \
  | while IFS= read -r -d '' file; do
      size=$(wc -c < "$file" | tr -d ' ')
      printf '%s\t%s\n' "$size" "$file"
    done \
  | sort -nr \
  | head -20
