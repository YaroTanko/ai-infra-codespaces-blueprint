#!/usr/bin/env bash
set -euo pipefail

./infra/bootstrap/scripts/cleanup.sh
./infra/bootstrap/scripts/create-kind-cluster.sh
