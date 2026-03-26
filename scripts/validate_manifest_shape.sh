#!/usr/bin/env bash
set -euo pipefail

while IFS= read -r f; do
  grep -q '^apiVersion:' "${f}" || { echo "[validate_manifest_shape] missing apiVersion in ${f}"; exit 1; }
  grep -q '^kind:' "${f}" || { echo "[validate_manifest_shape] missing kind in ${f}"; exit 1; }
  if grep -q '^apiVersion: kind\.x-k8s\.io/' "${f}"; then
    continue
  fi
  if grep -q '^kind: Kustomization' "${f}"; then
    continue
  fi
  grep -q '^metadata:' "${f}" || { echo "[validate_manifest_shape] missing metadata in ${f}"; exit 1; }
done < <(git ls-files 'infra/**/*.yaml' 'infra/**/*.yml' 'docs/contracts/*.yaml')

echo "[validate_manifest_shape] manifest shape checks passed"
