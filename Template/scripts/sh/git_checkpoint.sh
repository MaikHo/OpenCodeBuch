#!/usr/bin/env sh
set -eu
printf '%s\n' '== Git status =='
git status --short
printf '\n%s\n' '== Diff check =='
git diff --check
printf '\n%s\n' '== Diff stat =='
git diff --stat
