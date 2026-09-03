#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Verwendung: $0 <Dateiname aus input/>" >&2
    exit 2
fi

source_file="$1"
source_path="input/$source_file"

if [[ ! -f "$source_path" ]]; then
    echo "Datei nicht gefunden: $source_path" >&2
    exit 1
fi

./scripts/check-tools.sh >/dev/null

job="$(./scripts/new-extraction.sh "$source_file")"
ext="${source_file##*.}"
ext="${ext,,}"
pdf="$job/source/document.pdf"

case "$ext" in
    ppt|pptx)
        if ! command -v libreoffice >/dev/null 2>&1; then
            echo "LibreOffice fehlt; PPT/PPTX kann nicht konvertiert werden." >&2
            exit 1
        fi
        libreoffice --headless --convert-to pdf --outdir "$job/source" "$source_path" >/dev/null
        converted="$job/source/${source_file%.*}.pdf"
        if [[ ! -f "$converted" ]]; then
            echo "PDF-Konvertierung fehlgeschlagen." >&2
            exit 1
        fi
        mv "$converted" "$pdf"
        ;;
    pdf)
        cp -p "$source_path" "$pdf"
        ;;
    *)
        echo "Nicht unterstütztes Format: .$ext" >&2
        exit 1
        ;;
esac

page_count="$(pdfinfo "$pdf" | awk -F: '/^Pages:/ {gsub(/[[:space:]]/,"",$2); print $2}')"
if [[ -z "$page_count" || ! "$page_count" =~ ^[0-9]+$ ]]; then
    echo "Seitenzahl konnte nicht bestimmt werden." >&2
    exit 1
fi

printf '%s\n' "$page_count" > "$job/source/page_count.txt"
pdftotext -layout "$pdf" "$job/source/document.txt"

width="${#page_count}"
if (( width < 3 )); then width=3; fi

for ((page=1; page<=page_count; page++)); do
    printf -v n "%0${width}d" "$page"
    pdftotext -layout -f "$page" -l "$page" "$pdf" "$job/pages/page-${n}.txt"
done

cat >> "$job/job.env" <<ENV
PAGE_COUNT=$page_count
PDF=$pdf
ENV

cat <<OUT
Vorbereitung abgeschlossen.

JOB=$job
SOURCE=$source_path
PDF=$pdf
PAGES=$page_count

Nächster Schritt:
  ./scripts/build-chunks.sh $job
OUT
