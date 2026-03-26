# Execution Board (All Core Tools, Parallel Delivery)

| Tool | Owner Agent | Stage | Key Artifacts | Acceptance Test |
|---|---|---|---|---|
| Agent Gateway | GatewayInferenceAgent | Stage 3 | `infra/gateway/agent-gateway/*` | AI route answers via gateway with telemetry emitted |
| Kgateway | GatewayInferenceAgent | Stage 3 | `infra/gateway/kgateway/*` | Gateway routes reconcile and serve target backends |
| LLMD | GatewayInferenceAgent | Stage 3 | `infra/gateway/providers/llmd/*` | CPU inference request returns expected payload |
| vLLM | GatewayInferenceAgent | Stage 3 | `infra/gateway/providers/vllm/*` | Throughput test meets baseline token/sec target |
| arXiv (research input) | ReleaseOrchestratorAgent | Stage 8 | `docs/research/model-update-criteria.md` | Model upgrade decision document is updated per release |
| MCPG | SecurityGovernanceAgent | Stage 5 | `infra/security/mcpg/*` | MCP services are discovered and scored automatically |
| Kyverno | SecurityGovernanceAgent | Stage 5 | `infra/security/kyverno/*` | Non-compliant manifest is denied by admission |
| Cosign | SecurityGovernanceAgent | Stage 2/5 | `.github/workflows/sign-verify.yml` | Unsigned image fails CI and is blocked from deploy |
| Flux | PlatformBootstrapAgent | Stage 2 | `infra/flux/*` | Reconciliation status is healthy for all kustomizations |
| CycloneDX | SecurityGovernanceAgent | Stage 2 | `.github/workflows/sbom.yml` | SBOM is generated and attached to each build |
| Terraform Controller | PlatformBootstrapAgent | Stage 2 | `infra/terraform-controller/*` | Terraform CR apply creates expected resource |
| KEDA | ReleaseOrchestratorAgent | Stage 8 | `infra/scaling/keda/*` | Scale-up and scale-down trigger on target metric |
| Kagent | AgentMCPAgent | Stage 4 | `infra/agents/kagent/*` | Declarative agent deploys and becomes ready |
| KMCP | AgentMCPAgent | Stage 4 | `infra/mcp/kmcp/*` | MCP server generated/deployed from template |
| MCP Inspector | AgentMCPAgent | Stage 4 | `scripts/mcp-inspector/*` | MCP endpoint passes inspector test suite |
| Temporal | AgentMCPAgent | Stage 4 | `infra/agents/temporal/*` | Long-running workflow resumes after interruption |
| LangGraph/LangChain | AgentMCPAgent | Stage 4 | `infra/agents/runtime/*` | Multi-step agent flow executes deterministic scenario |
| Qdrant | MemoryLayerAgent | Stage 6 | `infra/memory/qdrant/*` | Vector upsert and semantic search pass smoke test |
| Redis | MemoryLayerAgent | Stage 6 | `infra/memory/redis/*` | Memory cache read/write latency within baseline |
| Neo4j | MemoryLayerAgent | Stage 6 | `infra/memory/neo4j/*` | Graph query returns expected dependency path |
| Arize Phoenix | ObservabilityEvalAgent | Stage 7 | `infra/observability/phoenix/*` | Traces visible and eval dataset run succeeds |
| LangFuse | ObservabilityEvalAgent | Stage 7 | `infra/observability/langfuse/*` | Agent traces and spans visible end-to-end |
| OpenTelemetry | ObservabilityEvalAgent | Stage 7 | `infra/observability/otel/*` | Unified traces exported from gateway/agent/tool layers |
| Terminal Bench/Pro | ObservabilityEvalAgent | Stage 7 | `.github/workflows/terminal-bench.yml` | Benchmark score meets release threshold |

## Parallel Work Rules
- Each agent modifies only assigned directories in this board.
- Cross-stream changes require interface-contract PR and approval from ReleaseOrchestratorAgent.
- No merge if security gates, trace checks, or benchmark thresholds fail.

## Daily Orchestration Cadence
- 09:00 UTC: dependency sync and blockers.
- 13:00 UTC: integration test checkpoint.
- 17:00 UTC: merge window with release gate review.
