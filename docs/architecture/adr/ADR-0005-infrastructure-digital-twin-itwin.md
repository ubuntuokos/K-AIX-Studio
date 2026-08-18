# ADR-0005 — Infrastructure Digital Twin & Engineering Data with iTwin

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Infrastructure Digital Twin & Engineering Data Fabric** spanning 3D/Spatial, Engineering Data, Digital Twin, Integration/API Gateway, Agent & Tool Execution, Security/Governance and Observability.

`iTwin/itwinjs-core` / iTwin is the mandatory supported primary reference provider.

## Required capability boundary

- semantic infrastructure and engineering digital-twin models;
- aggregation of engineering models, reality data, GIS and IoT context;
- 3D/4D visualization and engineering scene access;
- versioning, changesets and change tracking;
- model query, update and presentation through governed adapters;
- engineering lineage and identity mapping.

## Authority boundary

The fabric MUST NOT replace:

- Blender/Unreal interactive authoring;
- classical photogrammetry/reconstruction engines such as COLMAP or AliceVision;
- generative world-model providers;
- Temporal orchestration;
- NATS JetStream;
- Valkey;
- central identity/secrets or general storage authority.

## Consequences

iTwin is the primary engineering digital-twin reference provider, while visual reconstruction, generative 3D and human DCC authoring remain separate capability domains.