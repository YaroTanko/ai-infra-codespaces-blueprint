#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="ai-core"
KIND_CONFIG="infra/bootstrap/config/kind-3node.yaml"

if ! command -v kind >/dev/null 2>&1; then
  echo "kind is not installed. Run ./infra/bootstrap/scripts/install-tools.sh first."
  exit 1
fi

if kind get clusters | grep -E "^${CLUSTER_NAME}$" >/dev/null 2>&1; then
  echo "[kind] cluster ${CLUSTER_NAME} already exists"
else
  kind create cluster --name "${CLUSTER_NAME}" --config "${KIND_CONFIG}"
fi

kubectl apply -f infra/bootstrap/config/baseline-resources.yaml
kubectl cluster-info
