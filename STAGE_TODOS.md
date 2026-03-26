# Stage-by-Stage Implementation Plan (All Tools in Core, Parallel)

## Stage 0 — Architecture Lock and Team Contracts (1-2 days)
### To-Do
- [x] Approve all-tools-core ADR with boundaries for six parallel streams.
- [x] Freeze interface contracts: `RouteSpec`, `ToolSpec`, `MemoryContract`, `TraceSchema`, `PolicySet`.
- [x] Define branch ownership by stream to avoid file conflicts.
- [x] Define acceptance criteria for each core tool integration.

## Stage 1 — Platform Bootstrap in Codespaces (Stream A, 2-3 days)
### To-Do
- [x] Build deterministic `.devcontainer` with `kind`, `kubectl`, `helm`, `flux`, `k9s`.
- [x] Implement idempotent `make dev` for 3-node kind cluster.
- [x] Add baseline ingress, storage class, DNS, and smoke checks.
- [x] Add reset/cleanup scripts for repeatable parallel testing.

### Parallelizable with
- Stage 2 security scaffolding and Stage 3 gateway manifests.

## Stage 2 — Gitless Ops and Supply Chain (Stream D + Platform, 2-3 days)
### To-Do
- [x] Install Flux controllers with Git/OCI source support.
- [x] Add CycloneDX SBOM generation in CI for every service/image.
- [x] Add Cosign sign/verify workflow and block unsigned artifacts.
- [x] Add Terraform Controller CRDs/manifests for infra dependencies.
- [x] Add policy checks (kustomize build, schema validation, policy tests).

### Parallelizable with
- Stage 3, 4, 5.

## Stage 3 — AI Gateway and Inference Core (Stream B, 3-5 days)
### To-Do
- [x] Deploy Kgateway as control plane for AI routes.
- [x] Deploy Agent Gateway as data plane for L8 traffic and MCP protocol.
- [x] Integrate LLMD for local/CPU inference workloads.
- [x] Integrate vLLM for high-throughput model serving workloads.
- [x] Implement direct provider routing policies in Agent Gateway.
- [x] Add provider health and latency probes.

### Parallelizable with
- Stage 4 and Stage 6.

## Stage 4 — Agent Runtime and MCP (Stream C, 3-5 days)
### To-Do
- [x] Deploy Kagent controllers and baseline agent templates.
- [x] Add KMCP pipeline for creating/deploying MCP servers.
- [x] Add MCP Inspector workflow for local and CI MCP validation.
- [x] Integrate Temporal for durable long-running agent workflows.
- [x] Integrate LangGraph/LangChain runtime for agent logic orchestration.
- [x] Validate end-to-end `prompt -> tool call -> model response`.

### Parallelizable with
- Stage 3, 5, 6.

## Stage 5 — Security Guard Rails and Governance (Stream D, 3-4 days)
### To-Do
- [x] Deploy Kyverno policies for admission, image constraints, and security controls.
- [x] Deploy MCPG for discovery and security scoring of MCP servers.
- [x] Enforce signature/SBOM policy in admission and CI.
- [x] Add network policies and namespace segmentation by stream.
- [x] Add fail-closed policy behavior for critical violations.

### Parallelizable with
- Stage 3, 4, 6.

## Stage 6 — Memory and Context Layer (Stream E, 2-4 days)
### To-Do
- [x] Deploy Qdrant for incident memory and vector retrieval.
- [x] Deploy Redis for short-term memory/cache and vector operations.
- [x] Deploy Neo4j for service graph and relationship-aware reasoning.
- [x] Implement unified memory adapter contract for agents.
- [x] Add data retention and backup policies for memory stores.

### Parallelizable with
- Stage 3, 4, 5, 7.

## Stage 7 — Observability and Continuous Evaluation (Stream F, 3-4 days)
### To-Do
- [x] Instrument all core services with OpenTelemetry.
- [x] Deploy Arize Phoenix and connect traces/eval datasets.
- [x] Deploy LangFuse and connect agent-level traces.
- [x] Add Terminal Bench / Terminal Bench Pro evaluation jobs.
- [x] Define score thresholds and regression fail conditions.

## Stage 8 — Release, Scale, and Reliability (All streams, ongoing)
### To-Do
- [x] Configure KEDA scaling triggers for gateway, agent workers, and MCP workloads.
- [x] Add progressive rollout and rollback runbooks.
- [x] Add SLO dashboards for latency, correctness, and cost-per-task.
- [x] Run disaster-recovery drills and incident simulations.
- [x] Add model update playbook using arXiv-based evaluation criteria.

---

## Cross-Stream Merge Rules
- No merge without passing interface contract checks.
- No merge without security gates (Kyverno/MCPG/Cosign/SBOM).
- No release without eval pass (Phoenix/LangFuse metrics + Terminal Bench thresholds).
- Stream leads publish daily integration status and blockers.

## Suggested Parallel Agent Prompts

### Prompt 1 — PlatformBootstrapAgent
"You own only `.devcontainer`, `infra/bootstrap`, and cluster readiness scripts. Build deterministic Codespaces bootstrap with idempotent `make dev` for 3-node kind. Return reproducibility checklist and failure recovery steps."

### Prompt 2 — GatewayInferenceAgent
"You own only `infra/gateway`. Deliver Kgateway + Agent Gateway with LLMD and vLLM routing profiles, provider health checks, and fallback policies. Return route contracts and load test notes."

### Prompt 3 — AgentMCPAgent
"You own only `infra/agents` and `infra/mcp`. Deliver Kagent, KMCP workflows, MCP Inspector tests, Temporal integration, and LangGraph/LangChain runtime wiring. Return end-to-end test plan and tool compatibility matrix."

### Prompt 4 — SecurityGovernanceAgent
"You own only `infra/security` and security CI workflows. Deliver Kyverno policies, MCPG scoring integration, Cosign verify gates, and fail-closed rules for critical risks. Return policy catalog and exception process."

### Prompt 5 — MemoryLayerAgent
"You own only `infra/memory`. Deliver Qdrant, Redis, Neo4j deployment and a unified memory adapter contract for agents. Return schema/versioning strategy, backup plan, and performance baseline."

### Prompt 6 — ObservabilityEvalAgent
"You own only `infra/observability` and eval workflows. Deliver OTEL instrumentation, Arize Phoenix + LangFuse integration, and Terminal Bench pipelines with regression thresholds. Return dashboard links, KPIs, and evaluation SOP."

### Prompt 7 — ReleaseOrchestratorAgent
"You coordinate all parallel agents. Enforce ownership boundaries, interface contract tests, merge order, and release gates. Publish daily dependency graph, integration health, and risk register with mitigation owners."
