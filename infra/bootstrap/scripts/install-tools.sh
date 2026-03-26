#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${HOME}/.local/bin"
mkdir -p "${BIN_DIR}"
export PATH="${BIN_DIR}:$PATH"

install_if_missing() {
  local cmd="$1"
  local installer="$2"
  if command -v "${cmd}" >/dev/null 2>&1; then
    echo "[tools] ${cmd} already installed"
    return
  fi
  echo "[tools] installing ${cmd}"
  eval "${installer}"
}

install_if_missing kubectl 'curl -fsSL -o /tmp/kubectl "https://dl.k8s.io/release/v1.30.2/bin/linux/amd64/kubectl" && chmod +x /tmp/kubectl && mv /tmp/kubectl "${BIN_DIR}/kubectl"'
install_if_missing kind 'curl -fsSL -o /tmp/kind "https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64" && chmod +x /tmp/kind && mv /tmp/kind "${BIN_DIR}/kind"'
install_if_missing helm 'curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash'
install_if_missing flux 'curl -fsSL https://fluxcd.io/install.sh | sudo bash'
install_if_missing k9s 'curl -fsSL -o /tmp/k9s.tar.gz "https://github.com/derailed/k9s/releases/download/v0.32.4/k9s_Linux_amd64.tar.gz" && tar -xzf /tmp/k9s.tar.gz -C /tmp && chmod +x /tmp/k9s && mv /tmp/k9s "${BIN_DIR}/k9s"'

echo "[tools] done"
