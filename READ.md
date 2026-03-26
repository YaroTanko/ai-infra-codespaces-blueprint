# Development Environment Setup

## GitHub Codespaces

1. Open this repository in GitHub Codespaces and create a new Codespace.
2. Wait for container initialization to finish.
3. Verify toolchain:
   - `git --version`
   - `make --version`
4. Bootstrap and validate:
   - `make dev`
   - `make smoke`
   - `make validate`
5. Optional MCP contract check:
   - `make mcp-inspect`
6. Keep secrets out of Git:
   - copy `.env.example` to `.env` only if `.env.example` exists
   - never commit `.env`

## Local Setup

1. Install required tools:
   - Git
   - Docker
   - `kubectl`
   - `kind`
   - `helm`
   - `kustomize`
2. Clone and enter repository:
   - `git clone <repository-url>`
   - `cd ai-infra-codespaces-blueprint`
3. Run validation locally:
   - `make validate`

## CI Expectations

- Policy checks must pass `make validate` (contract checks, stage markers, policy checks, kustomize builds, and manifest shape checks).
- Signature verify workflow only performs cosign verification when `SIGN_VERIFY_IMAGE_REF` repository variable is configured.
- SBOM workflow always uploads a CycloneDX artifact; it generates a Node SBOM when `package.json` exists, otherwise a minimal scaffold SBOM.
