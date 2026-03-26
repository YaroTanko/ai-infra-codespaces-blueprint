#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${HOME}/.local/bin"
mkdir -p "${BIN_DIR}"
export PATH="${BIN_DIR}:$PATH"

HELM_VERSION="v3.15.4"
FLUX_VERSION="2.3.0"

install_kubectl() {
  curl -fsSL -o /tmp/kubectl "https://dl.k8s.io/release/v1.30.2/bin/linux/amd64/kubectl"
  chmod +x /tmp/kubectl
  mv /tmp/kubectl "${BIN_DIR}/kubectl"
}

install_kind() {
  curl -fsSL -o /tmp/kind "https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64"
  chmod +x /tmp/kind
  mv /tmp/kind "${BIN_DIR}/kind"
}

install_helm() {
  curl -fsSL -o /tmp/helm.tgz "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz"
  tar -xzf /tmp/helm.tgz -C /tmp
  chmod +x /tmp/linux-amd64/helm
  mv /tmp/linux-amd64/helm "${BIN_DIR}/helm"
}

install_flux() {
  curl -fsSL -o /tmp/flux.tgz "https://github.com/fluxcd/flux2/releases/download/v${FLUX_VERSION}/flux_${FLUX_VERSION}_linux_amd64.tar.gz"
  tar -xzf /tmp/flux.tgz -C /tmp
  chmod +x /tmp/flux
  mv /tmp/flux "${BIN_DIR}/flux"
}

install_k9s() {
  curl -fsSL -o /tmp/k9s.tar.gz "https://github.com/derailed/k9s/releases/download/v0.32.4/k9s_Linux_amd64.tar.gz"
  tar -xzf /tmp/k9s.tar.gz -C /tmp
  chmod +x /tmp/k9s
  mv /tmp/k9s "${BIN_DIR}/k9s"
}

for cmd in kubectl kind helm flux k9s; do
  if command -v "${cmd}" >/dev/null 2>&1; then
    echo "[tools] ${cmd} already installed"
    continue
  fi
  echo "[tools] installing ${cmd}"
  "install_${cmd}"
done

echo "[tools] done"
