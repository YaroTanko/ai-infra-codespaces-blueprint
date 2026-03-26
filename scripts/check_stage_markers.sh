#!/usr/bin/env bash
set -euo pipefail

for s in 0 1 2 3 4 5 6 7 8; do
  rg -n "\[x\] stage-${s}-complete" docs/stage_completion.md >/dev/null || {
    echo "[check_stage_markers] stage-${s} marker missing"
    exit 1
  }
done

echo "[check_stage_markers] all stage markers complete"
