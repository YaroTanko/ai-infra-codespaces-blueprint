#!/usr/bin/env bash
set -euo pipefail

grep -R -n "validationFailureAction: Enforce" infra/security/kyverno >/dev/null
grep -R -n -E "requireCosignSignature|requireCycloneDXSbom" infra/security/admission >/dev/null
grep -R -n "action: deny" infra/security/fail-closed >/dev/null

echo "[policy_tests] policy checks passed"
