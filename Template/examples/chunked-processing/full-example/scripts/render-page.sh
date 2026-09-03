#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Verwendung: $0 <temp/job> <seite>" >&2
    exit 2
fi

job="${1%/}"
page="$2"
pdf="$job/source/document.pdf"

if [[ ! -f "$pdf" ]]; then
    echo "PDF nicht gefunden: $pdf" >&2
    exit 1
fi

if [[ ! "$page" =~ ^[1-9][0-9]*$ ]]; then
    echo "Ungültige Seitennummer: $page" >&2
    exit 1
fi

render_dpi=200
if [[ -f config/workflow.env ]]; then
    # shellcheck disable=SC1091
    source config/workflow.env
    render_dpi="${RENDER_DPI:-200}"
fi

printf -v page_no '%03d' "$page"
prefix="$job/rendered/page-${page_no}"
pdftoppm -png -singlefile -r "$render_dpi" -f "$page" -l "$page" "$pdf" "$prefix" >/dev/null

printf '%s.png\n' "$prefix"
