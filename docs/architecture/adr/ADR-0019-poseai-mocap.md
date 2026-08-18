# ADR-0019 — Motion Capture Integration with PoseAI

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST support a provider-independent **Motion Capture & Human Pose Acquisition** boundary with PoseAI as a mandatory supported reference provider.

## Required capability boundary

- live/captured human pose acquisition;
- timestamped skeleton/joint streams;
- calibration and actor/session identity;
- confidence/quality metadata;
- recording and replay;
- retarget/export adapters to Blender, Unreal and character-animation pipelines;
- policy-bound agent/tool access where automation is required.

## Separation from generated motion

Captured motion and generated motion are distinct canonical sources. PoseAI/MoCap represents observed/captured human movement. HY-Motion and other text-to-motion providers generate synthetic motion plans. Both may feed a common retarget/animation pipeline but MUST preserve source/provenance.

## Authority boundary

PoseAI MUST NOT become character authoring authority, global workflow engine, agent runtime, canonical event bus or storage authority.

## Consequences

MoCap can coexist cleanly with generative motion and DCC/game-engine animation workflows without losing lineage or source semantics.