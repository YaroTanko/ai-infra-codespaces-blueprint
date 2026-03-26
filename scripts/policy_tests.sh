#!/usr/bin/env bash
set -euo pipefail

rg -n "validationFailureAction: Enforce" infra/security/kyverno >/dev/null
rg -n "requireCosignSignature|requireCycloneDXSbom" infra/security/admission >/dev/null
rg -n "action: deny" infra/security/fail-closed >/dev/null

echo "[policy_tests] policy checks passed"
