# ADR-0006 — 3D Reconstruction, Photogrammetry & Scene Capture with AliceVision/Meshroom

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **3D Reconstruction, Photogrammetry & Scene Capture Fabric**.

AliceVision is a mandatory supported primary reference provider for photogrammetry, SfM/MVS and camera reconstruction. Meshroom is a mandatory supported visual reconstruction workbench/provider.

A provider-independent **Reconstruction Gateway** is mandatory.

## Canonical objects

- `CaptureSet`
- `CameraDescriptor`
- `CameraCalibration`
- `CameraPose`
- `ReconstructionRequest`
- `ReconstructionProfile`
- `ReconstructionJob`
- `SfMScene`
- `DepthMapSet`
- `PointCloudAsset`
- `MeshAsset`
- `TextureAsset`
- `CameraTrack`
- `SpatialScene`
- `GaussianSplatAsset`
- `ReconstructionMetrics`
- `ReconstructionArtifact`

## Mandatory integration capabilities

- CLI/headless execution and Python/API integration path;
- GPU-aware execution and topology-aware worker placement;
- feature/matching abstraction, including PopSift-capable paths;
- optional CCTag/AprilTag, AI segmentation, monocular depth, RoMa, Gaussian Splatting and LiDAR adapters through the gateway;
- Blender handoff for authoring/cleanup/finishing;
- Temporal durable lifecycle, NATS execution events and Valkey ephemeral state;
- scratch/cache separation, observability and versioned runtime profiles.

## Authority boundary

Temporal remains global durable orchestration; Goose remains agent/tool execution; NATS remains event fabric; Valkey remains runtime state/cache/queue; AliceVision is a reconstruction engine; Meshroom owns only visual workbench/subworkflow state; Blender remains authoring/finishing authority.

AliceVision/Meshroom MUST NOT become global orchestrator, event bus, agent runtime, canonical asset store or GPU scheduler. Gaussian Splatting adapters remain provider-neutral; no project-specific gsplat fork becomes canonical by default.