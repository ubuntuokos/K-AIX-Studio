# ADR-0004 — Generative 3D Asset & Geometry Lifecycle with Meshy

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Generative 3D Asset & Geometry Lifecycle Fabric** spanning 3D/Spatial, Media Production, AI Runtime, Agent & Tool Execution, Integration/API Gateway, DCC/Game Engine Integration, Security/Governance and Observability.

Meshy is a mandatory supported primary remote reference provider.

## Required capability boundary

The fabric covers:

- text/image/multi-image to 3D;
- topology/remesh;
- UV generation and repair;
- PBR texturing and retexturing;
- rigging and animation preparation;
- conversion/resize;
- validation and printability checks;
- export/import;
- asset lineage and provenance.

## Authority boundary

The fabric and Meshy MUST NOT replace:

- Blender/Unreal/Krita authoring surfaces;
- Temporal orchestration;
- NATS JetStream event transport;
- Valkey state/cache/queue;
- central identity/secrets;
- general asset storage authority.

Meshy MUST NOT be a global hard dependency or exclusive 3D provider.

## Provider contract

Adapters must expose canonical capability descriptors, version/model identity, asynchronous job state, artifact lineage, resource/usage metadata, policy context, failure classification and export mappings to canonical 3D asset objects.

## Consequences

Local and remote 3D generators may coexist. Provider choice is policy/resource driven and remains replaceable.