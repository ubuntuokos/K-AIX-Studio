# ADR-0027 — Local Block Cache & GPU Data Path

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include:

- **Local Block Cache / LVM-cache** as a mandatory storage acceleration capability;
- **GDRCopy** as a mandatory supported GPU data-movement capability;
- **GPUDirect Storage** as mandatory where the validated hardware/software path supports it.

## Mandatory architecture

- canonical model/artifact storage remains separate from cache/scratch layers;
- block cache is an acceleration layer, never storage authority;
- explicit cache health, metadata/data utilization and writeback risk observability;
- versioned mount/device identity and startup validation;
- scratch/cache lifecycle policies separated from durable artifacts;
- GPUDirect/GDRCopy paths enabled only after capability detection and validation;
- automatic fallback to standard CPU-mediated I/O when direct paths are unavailable;
- integrity/provenance verification remains independent of transport acceleration;
- failure MUST degrade performance rather than corrupt canonical artifacts.

## Authority boundary

LVM-cache, GDRCopy and GPUDirect Storage MUST NOT become canonical asset/model storage, global scheduler, workflow state or security policy authority.

## Consequences

High-throughput AI data paths are first-class capabilities while durability and correctness remain owned by canonical storage and integrity policies.