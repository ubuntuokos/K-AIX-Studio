# ADR-0009 — AI-Assisted Interactive Video Editing & Creator NLE with Clypra

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **AI-Assisted Interactive Video Editing & Creator NLE Fabric** across Media Production, Desktop Control, Agent & Tool Execution, AI Runtime, Storage, Security/Governance and Observability.

`AIEraDev/Clypra` is a mandatory supported primary reference provider for the creator/social-video and AI-assisted timeline workbench role.

## Mandatory capability profile

- frame-accurate multi-track timeline;
- trim/split/move and undo/redo;
- markers and transitions;
- text/visual compositing;
- keyframing;
- waveform and A/V sync;
- multi-track audio mixing;
- color/LUT/chroma-key workflows;
- recording/import, PiP, preview and export;
- agent-assisted editing through governed tool adapters.

## Authority boundary

Clypra is a creator/AI-assisted editing workbench. It MUST NOT replace the broader Human Finishing/NLE authority, global orchestration, event bus, canonical state store, general AI inference runtime or asset-storage authority.

## Consequences

Creator-speed AI editing and formal finishing workflows can coexist. The platform may route final mastering to other NLE surfaces without invalidating Clypra support.