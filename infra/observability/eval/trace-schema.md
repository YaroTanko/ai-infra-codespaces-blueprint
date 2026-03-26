# Trace Schema Mapping

- `gateway.request` spans include route and provider metadata.
- `agent.run` spans include workflow id and tool selection attributes.
- `mcp.tool.call` spans include tool name, duration, and result status.
- Required attributes align with `docs/contracts/traceschema.yaml`.
