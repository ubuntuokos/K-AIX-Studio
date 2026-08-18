# ADR-0024 — Canonical Event and Low-Latency State Authorities

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 fixes two separate canonical infrastructure authorities:

- **NATS JetStream** — canonical event/message fabric;
- **Valkey** — canonical low-latency state/queue/cache fabric.

Both are mandatory baseline capabilities.

## Separation rule

NATS is used for normalized events/messages, durable messaging semantics where configured, fan-out and cross-domain event transport. Valkey is used for low-latency ephemeral state, cache, coordination data and queue patterns that do not belong to durable workflow lifecycle.

Neither substitutes for Temporal durable workflow state.

## Mandatory behavior

- versioned event schemas and correlation IDs;
- explicit delivery/idempotency semantics;
- namespace/key ownership for Valkey;
- TTL/lifecycle policy for ephemeral state;
- backpressure/queue limits;
- observability for lag, retries, memory and failure state;
- security/ACL policy and least-privilege clients;
- no provider-local queue may silently become the cross-platform canonical bus.

## Authority boundary

NATS MUST NOT become Global Durable Orchestration authority or application database. Valkey MUST NOT become durable workflow source of truth, permanent artifact store or event-bus replacement.

## Consequences

Event transport, low-latency state and durable orchestration are explicitly separated, reducing hidden coupling across providers.