#!/usr/bin/env bash
# usage: commit.sh COUNT [YYYY-MM-DD]
set -euo pipefail
count="${1:-30}"
day="${2:-$(date -u +%F)}"
for i in $(seq 1 "$count"); do
  ts=$(printf '%sT%02d:%02d:%02dZ' "$day" $((9 + i % 12)) $((i * 7 % 60)) $((i * 13 % 60)))
  GIT_AUTHOR_DATE="$ts" GIT_COMMITTER_DATE="$ts" git commit --allow-empty -q -m "log $day #$i"
done
