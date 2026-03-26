#!/usr/bin/env bash
set -euo pipefail

if command -v kustomize >/dev/null 2>&1; then
  KUSTOMIZE_CMD='kustomize build'
elif command -v kubectl >/dev/null 2>&1; then
  KUSTOMIZE_CMD='kubectl kustomize'
else
  echo "[validate_kustomize] missing kustomize and kubectl"
  exit 1
fi

paths=(
  infra/bootstrap
  infra/flux/sources
  infra/flux/kustomizations
  infra/terraform-controller
  infra/gateway
  infra/agents
  infra/mcp
  infra/security
  infra/memory
  infra/observability
  infra/scaling/keda
)

for p in "${paths[@]}"; do
  ${KUSTOMIZE_CMD} "${p}" >/dev/null
  echo "[validate_kustomize] built ${p}"
done
