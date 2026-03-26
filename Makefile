.PHONY: dev reset cleanup smoke validate mcp-inspect

dev:
	./infra/bootstrap/scripts/create-kind-cluster.sh

reset:
	./infra/bootstrap/scripts/reset.sh

cleanup:
	./infra/bootstrap/scripts/cleanup.sh

smoke:
	./infra/bootstrap/scripts/smoke.sh

validate:
	./scripts/validate_repo.sh
	./scripts/validate_contracts.sh
	./scripts/check_stage_markers.sh
	./scripts/policy_tests.sh

mcp-inspect:
	./scripts/mcp-inspector/run.sh
