# ADR-0013 — Interactive Agent Runtime & Tool Execution with Goose

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST support a provider-independent **Interactive Agent Runtime & Tool Execution** boundary, with `block/goose` / Goose as a mandatory supported primary reference provider.

Goose is the reference runtime for interactive agent sessions, tool use, capability invocation and developer/operator-facing agent work.

## Required integration behavior

- tools/capabilities exposed through governed adapters and the Central MCP/Capability Gateway;
- explicit capability discovery and policy-bound invocation;
- auditable tool calls and execution results;
- handoff of long-running durable lifecycle to Temporal;
- normalized lifecycle/tool events to NATS JetStream;
- Valkey may hold low-latency ephemeral runtime state only;
- human approval/policy gates preserved for privileged actions;
- provider/model selection remains separate from agent authority.

## Authority boundary

Goose MUST NOT become:

- Global Durable Orchestration authority;
- canonical event/message fabric;
- canonical low-latency state/cache/queue;
- central secret/identity/policy authority;
- exclusive LLM/inference gateway;
- domain-specific media, 3D, reconstruction or desktop authoring authority.

## Consequences

Agent reasoning/tool execution and durable orchestration remain distinct. Other agent runtimes may be supported without changing the canonical capability contract.