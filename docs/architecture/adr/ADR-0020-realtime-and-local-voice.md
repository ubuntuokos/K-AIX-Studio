# ADR-0020 — Realtime and Local Voice I/O

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST support provider-independent **Realtime Voice** and **Local Voice I/O** capability boundaries.

Mandatory supported providers:

- ElevenLabs — realtime remote voice reference provider;
- Voicebox — local voice I/O reference provider.

## Mandatory behavior

- normalized speech/voice capability descriptors;
- streaming and non-streaming invocation paths as supported;
- explicit local-vs-remote routing policy;
- privacy/data-classification gate before remote audio transfer;
- voice/model identity and provenance metadata;
- latency, quality and failure observability;
- interruption/cancellation semantics for realtime interactions;
- artifact handoff to media production workflows.

## Authority boundary

Voice providers MUST NOT become general agent runtime, global orchestrator, canonical audio editor, canonical event bus, state store or secret authority.

## Consequences

Realtime cloud voice and local voice execution remain interchangeable capability routes selected by policy, latency, privacy and resource constraints.