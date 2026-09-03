#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Verwendung: $0 <temp/job> <seite>" >&2
    exit 2
fi

job="${1%/}"
page="$2"
printf -v page_no '%03d' "$page"
image="$job/rendered/page-${page_no}.png"
out="$job/ocr/page-${page_no}.txt"

if [[ ! -f "$image" ]]; then
    ./scripts/render-page.sh "$job" "$page" >/dev/null
fi

ocr_lang=deu
ocr_psm=3
if [[ -f config/workflow.env ]]; then
    # shellcheck disable=SC1091
    source config/workflow.env
    ocr_lang="${OCR_LANG:-deu}"
    ocr_psm="${OCR_PSM:-3}"
fi

tesseract "$image" stdout -l "$ocr_lang" --psm "$ocr_psm" > "$out" 2>/dev/null
printf '%s\n' "$out"
