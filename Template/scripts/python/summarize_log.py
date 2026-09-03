#!/usr/bin/env python3
"""Reduziert große Logs auf relevante Zeilen, ohne ein LLM dafür zu benötigen."""

from __future__ import annotations

import argparse
import re
from pathlib import Path

DEFAULT_PATTERN = r"error|exception|failed|warning|fatal|critical"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Filtert relevante Zeilen aus einer Logdatei."
    )
    parser.add_argument("logfile", type=Path, help="Pfad zur Logdatei")
    parser.add_argument(
        "--pattern",
        default=DEFAULT_PATTERN,
        help=f"Regulärer Ausdruck, Standard: {DEFAULT_PATTERN}",
    )
    parser.add_argument(
        "--context",
        type=int,
        default=2,
        help="Anzahl Kontextzeilen vor und nach einem Treffer",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()

    if not args.logfile.is_file():
        raise SystemExit(f"Datei nicht gefunden: {args.logfile}")

    lines = args.logfile.read_text(encoding="utf-8", errors="replace").splitlines()
    regex = re.compile(args.pattern, re.IGNORECASE)

    selected: set[int] = set()
    for index, line in enumerate(lines):
        if regex.search(line):
            start = max(0, index - args.context)
            end = min(len(lines), index + args.context + 1)
            selected.update(range(start, end))

    previous = -2
    for index in sorted(selected):
        if index > previous + 1:
            print("---")
        print(f"{index + 1:>7}: {lines[index]}")
        previous = index

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
