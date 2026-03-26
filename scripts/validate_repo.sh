#!/usr/bin/env bash
set -euo pipefail

required=(
  ".devcontainer/devcontainer.json"
  "Makefile"
  "docs/contracts/routespec.yaml"
  "infra/flux/sources/gitrepository.yaml"
  "infra/gateway/agent-gateway/deployment.yaml"
  "infra/agents/kagent/agent-template.yaml"
  "infra/security/kyverno/require-signed-images.yaml"
  "infra/memory/contracts/memory-adapter.yaml"
  "infra/observability/otel/collector-config.yaml"
  "infra/scaling/keda/gateway-scaledobject.yaml"
  ".github/workflows/sbom.yml"
  ".github/workflows/sign-verify.yml"
  ".github/workflows/terminal-bench.yml"
)

for f in "${required[@]}"; do
  if [[ ! -f "${f}" ]]; then
    echo "[validate_repo] missing ${f}"
    exit 1
  fi
done

echo "[validate_repo] required artifacts present"
