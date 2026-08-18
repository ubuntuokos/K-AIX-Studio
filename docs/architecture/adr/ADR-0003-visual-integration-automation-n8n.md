# ADR-0003 — Visual Integration Automation & Human Workflow with n8n

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Visual Integration Automation & Human Workflow Fabric**.

`n8n-io/n8n` is a mandatory supported primary reference provider for visual low-code workflow composition, webhook/event ingress, SaaS/API connector automation, human-facing forms/approvals, notification/publishing and delegated integration execution.

## Authority boundary

n8n MUST NOT become:

- the Global Durable Orchestration & Workflow Lifecycle authority;
- the canonical event/message bus;
- the canonical low-latency queue/cache/state store;
- the central agent runtime;
- the secret, identity or policy authority.

Authority remains: Temporal = durable orchestration; Goose = interactive agent/tool runtime; NATS JetStream = canonical events/messages; Valkey = low-latency state/queue/cache; Central MCP/Capability Gateway = capability mediation.

## Required integration behavior

- expose n8n workflows as policy-bound capabilities;
- bridge webhooks/events to canonical ingress without bypassing gateway policy;
- hand long-running durable lifecycle ownership to Temporal;
- emit normalized execution events to NATS;
- reference centrally governed secrets rather than becoming secret authority;
- preserve human approval/audit context;
- support deterministic versioning/export of workflow definitions.

## Consequences

n8n is a mandatory visual automation and human workflow surface, not a replacement for the platform orchestration or agent control plane.