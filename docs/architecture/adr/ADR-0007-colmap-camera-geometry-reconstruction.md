# ADR-0007 — Photogrammetry, Camera Geometry & Multi-View Reconstruction with COLMAP

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Photogrammetry, Camera Geometry & Multi-View Reconstruction Fabric** with `colmap/colmap` as a mandatory supported primary reference provider.

COLMAP is authoritative within this provider role for camera geometry/calibration, structure-from-motion, bundle adjustment, multi-view stereo, sparse/dense reconstruction and supported meshing/texturing stages.

## Mandatory capability profile

- camera model/calibration handling;
- incremental/global/hierarchical and pose-prior SfM paths where supported;
- feature extraction/matching and geometric verification;
- bundle adjustment;
- sparse and dense reconstruction;
- multi-view stereo;
- camera-pose and reconstruction export through the canonical Reconstruction Gateway;
- reproducible headless/CLI automation;
- hardware-aware GPU execution where supported;
- canonical artifact/provenance mapping shared with the broader reconstruction fabric.

## Coexistence with AliceVision/Meshroom

COLMAP and AliceVision are independent reconstruction providers behind provider-neutral platform contracts. Meshroom remains a visual workbench for AliceVision-oriented reconstruction. Provider selection may be dataset/profile driven; neither provider is globally exclusive.

## Authority boundary

COLMAP MUST NOT become global orchestrator, workflow authority, canonical asset store, Blender replacement, neural-rendering/world-model authority or general AI runtime. Temporal, Goose, NATS JetStream, Valkey, Blender and the Reconstruction Gateway retain their declared authorities.