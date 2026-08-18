# Architecture Decision Records

This directory stores architecture decisions for FINAL ARCHITECTURE v2.0.

## ADR lifecycle

1. **Proposed** — candidate decision under evaluation.
2. **Accepted** — part of the working architecture baseline.
3. **Superseded** — replaced by a later ADR.
4. **Rejected** — evaluated but intentionally not adopted.

## Accepted ADR index

| ADR | Decision |
|---|---|
| ADR-0001 | Tencent-Hunyuan capability integration |
| ADR-0002 | Global Durable Orchestration with Temporal |
| ADR-0003 | Visual Integration Automation & Human Workflow with n8n |
| ADR-0004 | Generative 3D Asset & Geometry Lifecycle with Meshy |
| ADR-0005 | Infrastructure Digital Twin & Engineering Data with iTwin |
| ADR-0006 | 3D Reconstruction, Photogrammetry & Scene Capture with AliceVision/Meshroom |
| ADR-0007 | Photogrammetry, Camera Geometry & Multi-View Reconstruction with COLMAP |
| ADR-0008 | AI-Assisted Raster Painting & Generative Image Editing with Krita AI Diffusion |
| ADR-0009 | AI-Assisted Interactive Video Editing & Creator NLE with Clypra |
| ADR-0010 | AI-Assisted DJ Performance & Music Mixing with Mixxx |
| ADR-0011 | Remote Generative Model API & Aggregation with MuAPI |
| ADR-0012 | Local Multimodal Generative Media Execution |
| ADR-0013 | Interactive Agent Runtime & Tool Execution with Goose |
| ADR-0014 | Agentic Video Production Pipeline |
| ADR-0015 | Distributed GPU Execution with Waverless/WaveSpeedAI |
| ADR-0016 | LLM Gateway Security with Trylon + LiteLLM |
| ADR-0017 | Remote AI Application, Tool & Hosted Execution with Hugging Face Spaces |
| ADR-0018 | Physical AI Fabric with NVIDIA Cosmos |
| ADR-0019 | Motion Capture Integration with PoseAI |
| ADR-0020 | Realtime and Local Voice I/O |
| ADR-0021 | Specialized Generative Media Providers |
| ADR-0022 | Developer Agent Workbench & Evaluation Harness |
| ADR-0023 | HPC Development Fabric |
| ADR-0024 | Canonical Event and Low-Latency State Authorities |
| ADR-0025 | Host Performance, Kernel/I/O and NUMA/PCIe Locality |
| ADR-0026 | Adaptive Workstation Optimizer & KDE6 Control Plane |
| ADR-0027 | Local Block Cache & GPU Data Path |
| ADR-0028 | Host Network Firewall & Traffic Policy with nftables/Foomuuri |
| ADR-0029 | Endpoint Malware & Behavioral Detection Fabric |
| ADR-0030 | Software/Model Supply Chain Security & Observability |
| ADR-0031 | DNS Privacy & Resolution Fabric |
| ADR-0032 | Work Memory & Human Knowledge Surfaces |

The machine-readable status/provider mapping is maintained in `../COMPONENT-REGISTRY.yaml`. The human-readable consolidated baseline is maintained in `../FINAL-ARCHITECTURE-v2.0.md`.

## Required ADR sections

Each ADR should contain:

- status and date;
- context/problem;
- decision;
- mandatory/optional/watch classification;
- capability boundary;
- provider role and replaceability;
- authority conflicts and explicit non-authorities;
- deployment/hardware constraints;
- security, provenance and observability requirements;
- fallback/routing policy;
- consequences/tradeoffs;
- supersession rule.

## Naming

Use:

`ADR-NNNN-short-decision-name.md`

## Promotion rule

A provider-specific project should normally be promoted as **MANDATORY SUPPORT**, while the provider-independent capability fabric receives **MANDATORY** status. A provider becomes a hard authority only through an explicit architecture decision that establishes that role.

## Template

```markdown
# ADR-NNNN — Decision title

- Status: Proposed
- Date: YYYY-MM-DD

## Context

## Decision

## Capability boundary

## Provider classification

## Authority boundaries

## Runtime/deployment policy

## Security and observability

## Consequences

## Supersession rule
```
