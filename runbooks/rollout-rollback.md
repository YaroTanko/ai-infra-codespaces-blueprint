# Progressive Rollout and Rollback Runbook

1. Deploy canary (10%) via Flux overlay.
2. Observe latency/error/SLO for a fixed soak window.
3. Increase to 50% then 100% only if gates pass.
4. Roll back by pinning previous image digest and reconciling Flux.
