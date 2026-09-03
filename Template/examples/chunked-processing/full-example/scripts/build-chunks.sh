#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Verwendung: $0 <temp/job> [chunk-size]" >&2
    exit 2
fi

job="${1%/}"
chunk_size="${2:-}"

if [[ ! -f "$job/source/page_count.txt" ]]; then
    echo "Kein vorbereiteter Job: $job" >&2
    exit 1
fi

if [[ -z "$chunk_size" ]]; then
    chunk_size=10
    if [[ -f config/workflow.env ]]; then
        # shellcheck disable=SC1091
        source config/workflow.env
        chunk_size="${CHUNK_SIZE:-10}"
    fi
fi

if [[ ! "$chunk_size" =~ ^[1-9][0-9]*$ ]]; then
    echo "Ungültige Chunk-Größe: $chunk_size" >&2
    exit 1
fi

page_count="$(cat "$job/source/page_count.txt")"
rm -f "$job/chunks"/chunk-*.md

chunk=0
for ((start=1; start<=page_count; start+=chunk_size)); do
    ((chunk+=1))
    end=$((start + chunk_size - 1))
    if (( end > page_count )); then end=$page_count; fi

    printf -v chunk_no '%03d' "$chunk"
    out="$job/chunks/chunk-${chunk_no}.md"

    {
        echo "# Extraktionschunk ${chunk_no}"
        echo
        echo "- Job: \`$job\`"
        echo "- Folien: **${start}–${end}**"
        echo "- Gesamtfolien: **${page_count}**"
        echo
        echo "> Dies ist nur der Basistextextrakt. Bei sichtbar unvollständigen Folien muss Render/OCR verwendet werden."
        echo
        echo "---"
        echo

        for ((page=start; page<=end; page++)); do
            printf -v page_no '%03d' "$page"
            echo "## Folie $page"
            echo
            echo '```text'
            cat "$job/pages/page-${page_no}.txt"
            echo '```'
            echo
        done
    } > "$out"
done

cat > "$job/chunks/manifest.txt" <<MANIFEST
PAGE_COUNT=$page_count
CHUNK_SIZE=$chunk_size
CHUNK_COUNT=$chunk
MANIFEST

printf 'Chunks erzeugt: %d\n' "$chunk"
printf 'Ordner: %s/chunks\n' "$job"
