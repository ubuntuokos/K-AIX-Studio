# ADR-0016 — LLM Gateway Security with Trylon + LiteLLM

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **LLM/Model Gateway Security & Routing Fabric** with Trylon Gateway + LiteLLM as mandatory supported reference providers.

## Mandatory capability profile

- OpenAI-compatible and provider-neutral model routing interfaces;
- provider/model capability registry;
- authentication/authorization and policy-bound routing;
- secret indirection; provider credentials MUST NOT be embedded in workflows/agents;
- request/response metadata, cost/usage and latency observability;
- model allow/deny policy and explicit fallback eligibility;
- rate/concurrency controls;
- audit context and request correlation;
- local/remote endpoint routing without coupling callers to provider SDKs.

## Authority boundary

The gateway MUST NOT become Global Durable Orchestration authority, interactive agent authority, canonical event bus, low-latency state store or provider-specific model runtime authority.

Goose invokes models/tools through governed interfaces; Temporal owns durable workflow lifecycle; NATS and Valkey retain their canonical roles.

## Consequences

Model providers and serving engines such as vLLM, local runtimes or remote APIs remain replaceable behind a controlled gateway contract.