#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Verwendung: $0 <knowledge/NNN-slug>" >&2
    exit 2
fi

dir="${1%/}"
required=(README.md metadata.yaml slides.md sources.md)
failed=0

for file in "${required[@]}"; do
    if [[ -s "$dir/$file" ]]; then
        printf 'OK    %s\n' "$dir/$file"
    else
        printf 'FEHLT %s\n' "$dir/$file"
        failed=1
    fi
done

if [[ -f "$dir/metadata.yaml" ]]; then
    page_count="$(awk -F: '/^page_count:/ {gsub(/[[:space:]]/,"",$2); print $2}' "$dir/metadata.yaml" | head -1)"
    if [[ -n "$page_count" && "$page_count" =~ ^[0-9]+$ && "$page_count" -gt 0 ]]; then
        echo "INFO  Erwartete Folien laut metadata.yaml: $page_count"
    else
        echo "WARN  page_count in metadata.yaml fehlt oder ist ungültig"
        failed=1
    fi
fi

exit "$failed"
