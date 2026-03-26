#!/usr/bin/env bash
set -euo pipefail

for k in RouteSpec ToolSpec MemoryContract TraceSchema PolicySet ModelRoutePolicy; do
  rg -n "kind: ${k}" docs/contracts >/dev/null || {
    echo "[validate_contracts] missing contract kind: ${k}"
    exit 1
  }
done

echo "[validate_contracts] all contracts are present"
