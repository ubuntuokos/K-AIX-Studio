# ADR-0015 — Distributed GPU Execution with Waverless/WaveSpeedAI

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Distributed GPU Execution Fabric** with WaveSpeedAI/Waverless as mandatory supported reference paths.

The fabric provides capacity-aware delegation of workloads that do not fit or should not execute on a single local worker.

## Mandatory behavior

- hardware/capability discovery and worker descriptors;
- resource admission based on GPU architecture, VRAM, RAM, locality and runtime compatibility;
- deterministic placement policy;
- artifact/model transfer through governed storage/transfer paths;
- execution lease, heartbeat, timeout and failure classification;
- observability for queue, placement, runtime, transfer and failure state;
- explicit local/remote/distributed eligibility in provider descriptors;
- secure credentials and network boundaries managed outside the worker provider.

## Authority boundary

Distributed GPU providers MUST NOT become Global Durable Orchestration authority, canonical event bus, canonical state store, central identity/secrets authority or general workflow engine.

Temporal owns durable lifecycle. NATS JetStream owns canonical events. Valkey owns low-latency state/queue/cache where applicable. The Central MCP/Capability Gateway mediates capabilities.

## Consequences

Large or hardware-incompatible workloads can be routed out while local execution remains the preferred path when it satisfies policy and capacity constraints.