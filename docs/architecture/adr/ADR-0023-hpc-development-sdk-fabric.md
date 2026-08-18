# ADR-0023 — HPC Development Fabric

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST support a provider-independent **HPC Development Fabric** with NVIDIA HPC SDK and Intel oneAPI as mandatory supported reference toolchains.

## Mandatory capability profile

- architecture/toolchain discovery;
- isolated/versioned compiler and runtime profiles;
- CPU/GPU build targets selected by hardware capability;
- reproducible build metadata and dependency provenance;
- integration with NUMA/PCIe locality and worker-placement policies;
- observability for build/test/runtime performance;
- compatibility with platform supply-chain signing/SBOM/attestation gates.

## Authority boundary

HPC SDKs/toolchains are development providers. They MUST NOT become global runtime orchestrator, package/security policy authority, GPU scheduler, canonical storage layer or general model-serving authority.

## Consequences

CUDA/NVIDIA and Intel CPU/HPC development remain first-class without coupling architecture compliance to a single compiler/runtime stack.