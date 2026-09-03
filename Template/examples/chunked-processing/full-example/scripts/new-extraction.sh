#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Verwendung: $0 <Dateiname>" >&2
    exit 2
fi

file="$1"
base="${file%.*}"
slug="$(printf '%s' "$base" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/ä/ae/g;s/ö/oe/g;s/ü/ue/g;s/ß/ss/g;s/[^a-z0-9]+/-/g;s/^-+|-+$//g')"

timestamp="$(date +%Y%m%d-%H%M%S)"
job="temp/${slug}-${timestamp}"

mkdir -p "$job"/{source,pages,rendered,ocr,chunks,result}

cat > "$job/job.env" <<ENV
SOURCE_FILE=$file
JOB_SLUG=$slug
CREATED_AT=$(date --iso-8601=seconds 2>/dev/null || date '+%Y-%m-%dT%H:%M:%S')
ENV

printf '%s\n' "$job"
