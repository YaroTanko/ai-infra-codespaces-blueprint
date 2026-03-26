# ADR-0001: All Tools in Core Scope

## Status
Accepted

## Decision
All tools in `DESIGN.md` are in mandatory core scope and require first-class artifacts,
contracts, and acceptance criteria in this repository.

## Ownership and Boundaries
- Stream A owns `.devcontainer` and `infra/bootstrap`.
- Stream B owns `infra/gateway`.
- Stream C owns `infra/agents`, `infra/mcp`, `scripts/mcp-inspector`.
- Stream D owns `infra/security` and security CI workflows.
- Stream E owns `infra/memory`.
- Stream F owns `infra/observability` and benchmark workflows.

## Consequences
- Higher initial setup scope, but lower integration drift.
- Contract-first interfaces become merge requirements.
