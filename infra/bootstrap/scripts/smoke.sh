#!/usr/bin/env bash
set -euo pipefail

if ! command -v kubectl >/dev/null 2>&1; then
  echo "kubectl not found"
  exit 1
fi

echo "[smoke] nodes"
kubectl get nodes

echo "[smoke] dns"
kubectl -n kube-system get pods -l k8s-app=kube-dns

echo "[smoke] storage classes"
kubectl get storageclass || true

echo "[smoke] baseline namespaces"
kubectl get ns platform-system ai-system
