#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Verwendung: $0 <Dateiname aus input/>" >&2
    exit 2
fi

file="$1"
src="input/$file"
dst="archive/$file"

if [[ ! -f "$src" ]]; then
    echo "Datei nicht gefunden: $src" >&2
    exit 1
fi

if [[ -e "$dst" ]]; then
    echo "Zieldatei existiert bereits: $dst" >&2
    exit 1
fi

mv -- "$src" "$dst"
printf 'Archiviert: %s -> %s\n' "$src" "$dst"
