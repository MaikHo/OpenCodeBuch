#!/usr/bin/env bash
set -euo pipefail

required=(pdfinfo pdftotext pdftoppm tesseract)
optional=(libreoffice)
missing=0

for tool in "${required[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        printf 'OK       %s -> %s\n' "$tool" "$(command -v "$tool")"
    else
        printf 'FEHLT    %s\n' "$tool"
        missing=1
    fi
done

for tool in "${optional[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        printf 'OK       %s -> %s\n' "$tool" "$(command -v "$tool")"
    else
        printf 'OPTIONAL %s fehlt (nur für PPT/PPTX erforderlich)\n' "$tool"
    fi
done

if ! tesseract --list-langs 2>/dev/null | grep -qx 'deu'; then
    echo 'FEHLT    Tesseract-Sprachpaket deu'
    missing=1
else
    echo 'OK       Tesseract Sprache deu'
fi

exit "$missing"
