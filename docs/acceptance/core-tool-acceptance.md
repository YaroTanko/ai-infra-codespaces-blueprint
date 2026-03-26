# Core Tool Acceptance Criteria

This document mirrors `EXECUTION_BOARD.md` and defines binary acceptance checks.

- Gateway stack: Kgateway routes reconcile, Agent Gateway serves `/healthz`, provider probes are green.
- Inference stack: LLMD and vLLM services respond to synthetic model requests.
- Agent/MCP stack: Kagent template deploys, KMCP template renders, MCP Inspector script passes.
- Security stack: Kyverno policies validate, MCPG deployment healthy, unsigned image check fails.
- Memory stack: Qdrant/Redis/Neo4j manifests render and smoke probes configured.
- Observability stack: OTEL collector exports configured; Phoenix and LangFuse deployments expose services.
- Release stack: KEDA ScaledObjects exist and runbooks include rollback + DR procedures.
