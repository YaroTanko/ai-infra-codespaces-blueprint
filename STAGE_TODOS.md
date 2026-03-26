# Stage-by-Stage Implementation Plan (All Tools in Core, Parallel)

## Stage 0 — Architecture Lock and Team Contracts (1-2 days)
### To-Do
- [ ] Approve all-tools-core ADR with boundaries for six parallel streams.
- [ ] Freeze interface contracts: `RouteSpec`, `ToolSpec`, `MemoryContract`, `TraceSchema`, `PolicySet`.
- [ ] Define branch ownership by stream to avoid file conflicts.
- [ ] Define acceptance criteria for each core tool integration.

## Stage 1 — Platform Bootstrap in Codespaces (Stream A, 2-3 days)
### To-Do
- [ ] Build deterministic `.devcontainer` with `kind`, `kubectl`, `helm`, `flux`, `k9s`.
- [ ] Implement idempotent `make dev` for 3-node kind cluster.
- [ ] Add baseline ingress, storage class, DNS, and smoke checks.
- [ ] Add reset/cleanup scripts for repeatable parallel testing.

### Parallelizable with
- Stage 2 security scaffolding and Stage 3 gateway manifests.

## Stage 2 — Gitless Ops and Supply Chain (Stream D + Platform, 2-3 days)
### To-Do
- [ ] Install Flux controllers with Git/OCI source support.
- [ ] Add CycloneDX SBOM generation in CI for every service/image.
- [ ] Add Cosign sign/verify workflow and block unsigned artifacts.
- [ ] Add Terraform Controller CRDs/manifests for infra dependencies.
- [ ] Add policy checks (kustomize build, schema validation, policy tests).

### Parallelizable with
- Stage 3, 4, 5.

## Stage 3 — AI Gateway and Inference Core (Stream B, 3-5 days)
### To-Do
- [ ] Deploy Kgateway as control plane for AI routes.
- [ ] Deploy Agent Gateway as data plane for L8 traffic and MCP protocol.
- [ ] Integrate LLMD for local/CPU inference workloads.
- [ ] Integrate vLLM for high-throughput model serving workloads.
- [ ] Implement direct provider routing policies in Agent Gateway.
- [ ] Add provider health and latency probes.

### Parallelizable with
- Stage 4 and Stage 6.

## Stage 4 — Agent Runtime and MCP (Stream C, 3-5 days)
### To-Do
- [ ] Deploy Kagent controllers and baseline agent templates.
- [ ] Add KMCP pipeline for creating/deploying MCP servers.
- [ ] Add MCP Inspector workflow for local and CI MCP validation.
- [ ] Integrate Temporal for durable long-running agent workflows.
- [ ] Integrate LangGraph/LangChain runtime for agent logic orchestration.
- [ ] Validate end-to-end `prompt -> tool call -> model response`.

### Parallelizable with
- Stage 3, 5, 6.

## Stage 5 — Security Guard Rails and Governance (Stream D, 3-4 days)
### To-Do
- [ ] Deploy Kyverno policies for admission, image constraints, and security controls.
- [ ] Deploy MCPG for discovery and security scoring of MCP servers.
- [ ] Enforce signature/SBOM policy in admission and CI.
- [ ] Add network policies and namespace segmentation by stream.
- [ ] Add fail-closed policy behavior for critical violations.

### Parallelizable with
- Stage 3, 4, 6.

## Stage 6 — Memory and Context Layer (Stream E, 2-4 days)
### To-Do
- [ ] Deploy Qdrant for incident memory and vector retrieval.
- [ ] Deploy Redis for short-term memory/cache and vector operations.
- [ ] Deploy Neo4j for service graph and relationship-aware reasoning.
- [ ] Implement unified memory adapter contract for agents.
- [ ] Add data retention and backup policies for memory stores.

### Parallelizable with
- Stage 3, 4, 5, 7.

## Stage 7 — Observability and Continuous Evaluation (Stream F, 3-4 days)
### To-Do
- [ ] Instrument all core services with OpenTelemetry.
- [ ] Deploy Arize Phoenix and connect traces/eval datasets.
- [ ] Deploy LangFuse and connect agent-level traces.
- [ ] Add Terminal Bench / Terminal Bench Pro evaluation jobs.
- [ ] Define score thresholds and regression fail conditions.

## Stage 8 — Release, Scale, and Reliability (All streams, ongoing)
### To-Do
- [ ] Configure KEDA scaling triggers for gateway, agent workers, and MCP workloads.
- [ ] Add progressive rollout and rollback runbooks.
- [ ] Add SLO dashboards for latency, correctness, and cost-per-task.
- [ ] Run disaster-recovery drills and incident simulations.
- [ ] Add model update playbook using arXiv-based evaluation criteria.

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
