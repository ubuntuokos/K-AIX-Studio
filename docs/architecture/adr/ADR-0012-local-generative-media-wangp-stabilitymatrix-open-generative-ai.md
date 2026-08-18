# ADR-0012 — Local Multimodal Generative Media Execution

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-neutral **Local Multimodal Generative Media Execution Fabric**.

Mandatory supported roles:

- **WanGP/Wan2GP** — primary reference provider for low-VRAM/headless local multimodal generation execution;
- **Stability Matrix** — mandatory local generative media package/model/runtime management and integration surface;
- **Open Generative AI** — mandatory Studio/control surface;
- **ComfyUI** — mandatory supported graph/workflow execution provider within the generative media domain.

A provider-neutral **Generative Media Gateway** is mandatory, including a native Python/API adapter path for WanGP-class runtimes.

## Mandatory runtime behavior

- dynamic capability/model discovery;
- headless/automation-first execution path;
- isolated runtime; Conda may be used but MUST NOT be required by architecture;
- versioned compatibility/runtime profiles;
- capability-aware acceleration and memory/offload selection;
- deterministic GPU/resource routing from the platform hardware manifest;
- shared governed artifact/model storage with scratch/cache separation;
- progress/event bridge to NATS JetStream;
- warm runtime reuse where policy/resource limits allow;
- readiness/health lifecycle under system service management;
- local-only/privacy modes and full execution observability.

## Authority boundary

Provider-local queues are permitted only as local execution details. They MUST NOT replace Temporal durable workflow state, NATS canonical events, Valkey canonical low-latency platform state or Goose agent authority.

Provider-local assistants/agents remain subordinate to Goose and the Central MCP/Capability Gateway.

## Consequences

Local generative media remains modular and hardware-aware. A UI or package manager is never elevated into platform orchestration authority.