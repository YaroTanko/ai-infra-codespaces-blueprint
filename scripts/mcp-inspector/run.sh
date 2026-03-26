#!/usr/bin/env bash
set -euo pipefail

MCP_ENDPOINT="${MCP_ENDPOINT:-http://localhost:8090/healthz}"

echo "[mcp-inspector] checking endpoint ${MCP_ENDPOINT}"
if curl -fsS "${MCP_ENDPOINT}" >/dev/null 2>&1; then
  echo "[mcp-inspector] endpoint reachable"
else
  echo "[mcp-inspector] endpoint not reachable; static checks only"
fi

rg -n "kind: MCPServerTemplate|kind: ToolSpec" infra/mcp docs/contracts >/dev/null

echo "[mcp-inspector] templates and contracts found"
