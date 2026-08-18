# ADR-0025 — Host Performance, Kernel/I/O and NUMA/PCIe Locality

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include provider-independent **Host Performance / Kernel & I/O Policy** and **NUMA/PCIe Locality & IRQ Placement** fabrics, plus mandatory NUMA+GPU auto-discovery.

## Mandatory behavior

- discover CPU sockets, NUMA nodes, memory capacity, GPU identity, PCIe topology and relevant device locality;
- use stable hardware identity based on UUID/PCI BDF rather than display order;
- expose topology as a versioned Hardware Manifest;
- locality-aware worker placement and launch profiles;
- NUMA memory/CPU binding where workload policy requires;
- IRQ placement policy with safe fallback to system-managed balancing;
- separate static boot/kernel tuning from dynamic workload tuning;
- CPU, memory and I/O pressure metrics as policy inputs;
- reversible changes, audit trail and rollback;
- performance policies MUST fail safely without blocking boot.

## DiT inference

DiT inference optimization is a mandatory runtime capability and MUST consume the same hardware/capability descriptors for attention, precision, offload, cache and execution-profile selection.

## Authority boundary

Performance controllers MUST NOT override security enforcement, silently mutate global device identity, become model scheduler authority or bypass system service/resource controls.

## Consequences

Execution placement is topology-aware and reproducible, while platform safety and reversibility take precedence over fragile one-off tuning.