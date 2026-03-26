#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="ai-core"
if command -v kind >/dev/null 2>&1 && kind get clusters | grep -E "^${CLUSTER_NAME}$" >/dev/null 2>&1; then
  kind delete cluster --name "${CLUSTER_NAME}"
  echo "[cleanup] deleted ${CLUSTER_NAME}"
else
  echo "[cleanup] cluster ${CLUSTER_NAME} not present"
fi
