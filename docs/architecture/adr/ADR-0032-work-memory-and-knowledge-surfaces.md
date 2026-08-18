# ADR-0032 — Work Memory & Human Knowledge Surfaces

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST support provider-independent **Work Memory / Knowledge Workspace** integration.

Mandatory supported roles:

- Pieces OS — work-memory/context component;
- Obsidian — human knowledge, notes and linked-document workbench surface.

## Mandatory behavior

- explicit source/provenance for captured context;
- separation between human-authored notes, generated summaries, operational state and durable platform records;
- governed search/retrieval adapters;
- no implicit trust of retrieved memory/context as executable instruction;
- privacy/secret filtering before remote model exposure;
- artifact links rather than silent duplication where appropriate;
- versioned connector/capability interfaces;
- auditability for automated writes or transformations.

## Authority boundary

Pieces OS and Obsidian MUST NOT become Global Durable Orchestration authority, canonical event/state fabric, secret store, policy authority or universal system-of-record for all platform data.

Human knowledge management, agent memory/context and operational workflow state remain distinct domains even when cross-linked.

## Consequences

Knowledge and work context can enrich agents and workflows while preserving provenance and avoiding accidental promotion of notes/memory into platform authority.