# E2E Scenario: prompt -> tool -> model response

1. Send prompt to Agent Gateway `/v1/chat`.
2. Agent runtime selects tool from KMCP registry based on `ToolSpec`.
3. Tool execution result is persisted via `MemoryContract` adapter.
4. Agent invokes model provider according to `ModelRoutePolicy`.
5. Response and OTEL trace emitted with `TraceSchema` attributes.
