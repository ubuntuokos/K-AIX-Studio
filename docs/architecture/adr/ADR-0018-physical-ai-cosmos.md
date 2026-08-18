# ADR-0018 — Physical AI Fabric with NVIDIA Cosmos

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Physical AI Fabric** with NVIDIA Cosmos 3 as the mandatory supported primary baseline provider family.

Alternative embodied/world-model providers, including Tencent-Hunyuan HY-Embodied/HY-VLA, may be mandatory supported without displacing the Cosmos baseline.

## Mandatory capability boundary

- physical-world multimodal understanding and prediction;
- world/scene representations suitable for embodied agents and simulation;
- policy-bound model inference for robotics/physical-AI workflows;
- simulation/world-model adapter integration;
- large-model remote/distributed routing when local capacity is insufficient;
- provenance, model/version identity and reproducible runtime profiles.

## Authority boundary

The Physical AI Fabric MUST NOT replace:

- Temporal durable orchestration;
- Goose agent/tool authority;
- iTwin engineering digital-twin authority;
- COLMAP/AliceVision classical reconstruction authority;
- Blender/Unreal authoring;
- canonical event, state, identity, secret or storage authorities.

## Consequences

Physical AI models are capability providers behind platform contracts. World modeling, classical reconstruction, digital twins and embodied reasoning remain interoperable but architecturally distinct.