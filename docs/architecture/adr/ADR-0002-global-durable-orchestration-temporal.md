# ADR-0002 — Global Durable Orchestration with Temporal

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Global Durable Orchestration & Workflow Lifecycle Fabric**.

Temporal is the mandatory supported primary reference provider for durable workflow state, retries, timeouts, timers, compensation/saga patterns, human approval gates, workflow recovery and cross-domain execution lifecycle.

## Authority boundary

Temporal owns high-level durable workflow/lifecycle authority only. It MUST NOT replace:

- Goose as Interactive Agent Runtime & Tool Execution reference provider;
- NATS JetStream as canonical event/message fabric;
- Valkey as canonical low-latency state/queue/cache;
- domain runtimes such as ComfyUI/WanGP, Blender, NLEs, reconstruction engines or GPU workers;
- central identity, secrets, policy or storage authorities.

## Required integration contract

- deterministic workflow and activity identity;
- versioned workflow definitions and compatibility policy;
- idempotent activities and explicit retry/timeout policy;
- compensation and recovery semantics;
- human approval gates where policy requires;
- NATS event emission for lifecycle observability;
- Valkey only for low-latency ephemeral state, never as durable workflow source of truth;
- capability invocation through the Central MCP/Capability Gateway where applicable.

## Consequences

Temporal is mandatory support but not a global hard dependency on every execution node. Specialized local subworkflow engines remain valid inside their domain boundaries.