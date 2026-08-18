# ADR-0014 — Agentic Video Production Pipeline

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST support an **Agentic Video Production** integration path composed from governed, replaceable providers.

Mandatory integration path:

- OpenMontage — agentic video production/planning integration;
- Goose — interactive agent/tool runtime;
- Ollama — supported local model execution path;
- OpenWebUI — supported human/operator interaction surface;
- ComfyUI — generative media workflow execution;
- Blender — 3D/compositing/authoring handoff;
- Kdenlive — human video editing/finishing handoff.

## Architecture rule

This is an integration pipeline, not a new monolithic authority. Each component retains only its domain role.

## Mandatory behavior

- production plans represented as versioned workflow/job artifacts;
- durable multi-step lifecycle delegated to Temporal;
- tool actions mediated through Goose/Central MCP/Capability Gateway;
- canonical events emitted to NATS JetStream;
- generated media and project artifacts carry provenance/lineage;
- human review/approval points may be inserted before destructive or publishing actions;
- interchange between generation, 3D/compositing and NLE surfaces must use explicit artifact contracts.

## Authority boundary

The pipeline MUST NOT replace Temporal, NATS, Valkey, the Central MCP/Capability Gateway, canonical storage, Blender authoring authority or human NLE finishing authority.

## Consequences

Agentic production can automate planning and execution while preserving deterministic platform control and human finishing surfaces.