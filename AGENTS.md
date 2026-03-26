# AGENTS.md

## Project overview

AI Reliability Engineering Infrastructure Blueprint for Codespaces + Kubernetes. Currently in the design/planning phase — the repo contains only markdown design documents (`DESIGN.md`, `EXECUTION_BOARD.md`, `STAGE_TODOS.md`). No application code or services exist yet.

## Cursor Cloud specific instructions

### Available tooling

The dev environment has these tools pre-installed:

- **Node.js** (v22) with npm — used for `markdownlint-cli` dev tooling
- **Docker** (v28) — required for kind cluster bootstrap
- **kind** (v0.27) — local Kubernetes cluster (3-node planned per DESIGN.md)
- **kubectl** (latest stable) — Kubernetes CLI
- **helm** (v3) — Kubernetes package manager

### Lint

Run `npm run lint` (or `npx markdownlint '**/*.md' --ignore node_modules`) to lint all markdown files. Config is in `.markdownlint.jsonc`.

### Starting Docker

Docker must be started manually in the Cloud Agent environment:

```sh
sudo dockerd >/tmp/dockerd.log 2>&1 &
sleep 3
```

### Creating a kind cluster (Codespaces / local only)

> **Note:** kind and k3d clusters do **not** work in the Cursor Cloud Agent VM (see Key caveats below). The following commands are for GitHub Codespaces or local development only.

Per DESIGN.md Stage 1, the project targets a 3-node kind cluster:

```sh
sudo kind create cluster --name ai-infra
```

Use `sudo` because Docker runs as root. After creation, copy the kubeconfig for non-root use:

```sh
mkdir -p ~/.kube
sudo kind get kubeconfig --name ai-infra > ~/.kube/config
```

### Key caveats

- Docker runs as root in the Cloud Agent VM; use `sudo` for `docker`, `kind`, and `k3d` commands.
- The Cloud Agent VM uses `fuse-overlayfs` as the Docker storage driver and `iptables-legacy` for networking compatibility.
- **Kubernetes clusters (kind/k3d) do not work** in the Cloud Agent VM due to cgroup delegation and ip6tables `raw` table limitations in the nested container (Firecracker VM) environment. kind fails with cgroup "Structure needs cleaning" errors; k3d's k3s process fails to start the API server. To test Kubernetes features, use GitHub Codespaces or a local machine per `DESIGN.md`.
- There is no application code to build or run yet — lint is the only automated check.
- The planned repo structure and tool inventory are in `DESIGN.md`; execution tracking is in `EXECUTION_BOARD.md`; staged TODO items are in `STAGE_TODOS.md`.
