# ADR-0021 — Specialized Generative Media Providers

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST support the following specialized media capabilities through provider-independent adapters:

- **FLUX Visual Generation & Editing** — MANDATORY;
- **HyperFrames Web-to-Video** — MANDATORY;
- **Kits AI Vocal** — MANDATORY;
- **Shorts clipping workflow** — MANDATORY.

These capabilities attach to the broader Local/Remote Generative Media and Media Production fabrics rather than becoming new platform-wide authorities.

## Mandatory integration behavior

- capability/model/version descriptors;
- normalized request/job/artifact metadata;
- local/remote execution eligibility where applicable;
- provenance and content lineage;
- explicit handoff to Krita, ComfyUI, NLE/audio workbenches and storage;
- policy/security checks for remote services;
- observability and failure classification;
- deterministic fallback only when explicitly allowed.

## Authority boundary

Specialized providers MUST NOT replace the Central MCP/Capability Gateway, global orchestration, canonical event/state fabrics, human authoring/finishing surfaces or general model gateway.

## Consequences

High-value specialized capabilities remain mandatory without turning any one vendor/model into an architectural monopoly.