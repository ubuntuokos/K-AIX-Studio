# ADR-0026 — Adaptive Workstation Optimizer & KDE6 Control Plane

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Adaptive Workload Optimization & Workstation Control Fabric** with a native Plasma 6/KF6 KCM control surface.

## Mandatory architecture

- unprivileged telemetry/policy plane separated from privileged actuator;
- versioned Hardware Manifest with fail-closed device identity;
- PSI CPU/memory/I/O and GPU/resource telemetry as policy inputs;
- confidence/provenance classification for detected workload state;
- hysteresis and cooldown to prevent profile thrashing;
- static-vs-dynamic tuning separation;
- systemd/cgroup v2 reference control path;
- NUMA/GPU-local launch integration;
- per-application GPU exposure rather than global environment mutation;
- capacity-aware VRAM admission;
- lease/heartbeat/revert semantics for temporary tuning;
- boot-nonblocking retry/fail-safe behavior;
- schema-versioned configuration, audit, rollback and change control.

## Authority boundary

The optimizer controls performance policy only. It MUST NOT become security policy authority, global workflow scheduler, device identity source independent of the Hardware Manifest, or an application-specific inference engine.

## Consequences

The workstation can adapt to desktop and AI workloads while retaining explicit privilege separation, predictable GPU roles and reversible tuning.