# ADR-0022 — Developer Agent Workbench & Evaluation Harness

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST support provider-independent developer/agent workbench and harness capabilities with these mandatory supported providers:

- OpenYak — desktop agent workbench;
- Terax AI — developer workspace;
- CAIRO Harness — agent/tool evaluation and harness capability.

## Mandatory behavior

- tools/capabilities exposed through governed adapters;
- project/workspace identity and reproducible configuration;
- auditable agent/tool execution;
- explicit policy boundaries for code, shell, desktop and network actions;
- evaluation/run artifacts with provenance and metrics;
- handoff of durable multi-step lifecycle to Temporal;
- normalized execution events to NATS JetStream;
- provider-specific state MUST NOT become global source of truth.

## Authority boundary

These workbenches/harnesses MUST NOT replace Goose interactive agent authority, Temporal orchestration, the Central MCP/Capability Gateway, canonical model gateway, NATS, Valkey, identity/secrets or source-control authority.

## Consequences

Multiple developer/agent UX and evaluation surfaces can coexist while tool invocation remains governed by platform contracts.