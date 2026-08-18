# ADR-0010 — AI-Assisted DJ Performance & Music Mixing with Mixxx

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **AI-Assisted DJ Performance & Music Mixing Fabric** across Media Production, Audio & Music, AI Runtime, Agent & Tool Execution, Desktop Control, Security/Governance and Observability.

Mixxx is the mandatory supported primary local-first reference provider.

## Canonical objects

- `DJCommand`
- `DeckState`
- `DJTrackDescriptor`
- `TrackAnalysis`
- `SetPlan`
- `TransitionPlan`
- `PerformanceEvent`

## Mandatory capability profile

- deck playback/control;
- BPM/key/beatgrid/sync;
- cue/hotcue/loop;
- effects;
- Auto DJ;
- recording and broadcast workflows;
- adapter path to Mixxx control interfaces and JavaScript controller logic;
- agent-assisted planning and control through policy-bound commands.

## Authority boundary

Mixxx MUST NOT become the global AI orchestrator, canonical inference runtime, exclusive music-analysis engine or general agent runtime. Temporal, Goose, NATS JetStream, Valkey and the capability gateway retain those roles.

## Consequences

Local-first DJ performance remains deterministic and human-controllable while AI planning/analysis can be added through provider-neutral platform interfaces.