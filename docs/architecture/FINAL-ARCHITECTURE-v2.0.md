# FINAL ARCHITECTURE v2.0

Status: **canonical working baseline**  
Branch: `agent/final-architecture-v2`  
Last baseline update: 2026-08-18

> Implementation note: architecture compliance is defined by the synchronized human baseline, machine-readable component registry, and accepted ADR set. Provider names normally mean mandatory support through replaceable adapters unless an ADR explicitly assigns canonical authority.

## 1. Source-of-truth hierarchy

FINAL ARCHITECTURE v2.0 is capability-first and provider-independent.

The repository uses three synchronized architecture views:

1. **This document** — human-readable baseline and authority map.
2. **`COMPONENT-REGISTRY.yaml`** — machine-readable fabric/provider/status registry.
3. **`adr/ADR-NNNN-*.md`** — individual accepted architecture decisions and authority boundaries.

When a named project is mandatory, the default meaning is **mandatory support through a replaceable provider adapter**. A project becomes a global hard authority only when an ADR explicitly assigns that authority.

### Status vocabulary

- **MANDATORY** — capability/fabric is part of the baseline and must exist.
- **MANDATORY SUPPORT** — provider/adapter must be supported, but the provider remains replaceable.
- **OPTIONAL** — useful provider/backend not required for compliant deployment.
- **WATCH** — promising project not mature/reproducible enough for runtime baseline.
- **EXCLUDED AS AUTHORITY** — integration is allowed, but authority takeover is forbidden.

## 2. Global authority map

| Authority | Canonical role | ADR |
|---|---|---|
| Temporal | Global Durable Orchestration & Workflow Lifecycle | ADR-0002 |
| NATS JetStream | Canonical event/message fabric | ADR-0024 |
| Valkey | Canonical low-latency state/queue/cache | ADR-0024 |
| Goose | Interactive Agent Runtime & Tool Execution reference provider | ADR-0013 |
| Central MCP/Capability Gateway | Capability discovery, provider mediation and policy-bound invocation | baseline |
| nftables | Canonical Linux kernel network enforcement | ADR-0028 |
| Krita | Interactive raster/painting authoring surface | ADR-0008 |
| Blender / Unreal | 3D authoring/finishing surfaces | baseline |
| Human NLE surfaces | Human video finishing/mastering | baseline |

No provider-specific AI model, workbench, queue, cache, scanner or integration tool may silently replace these authorities.

## 3. Mandatory architecture fabrics

### 3.1 Orchestration, agents, integration and gateways

| Fabric | Baseline provider(s) | ADR |
|---|---|---|
| Global Durable Orchestration & Workflow Lifecycle | Temporal | ADR-0002 |
| Visual Integration Automation & Human Workflow | n8n | ADR-0003 |
| Interactive Agent Runtime & Tool Execution | Goose | ADR-0013 |
| Canonical Event/Message Fabric | NATS JetStream | ADR-0024 |
| Low-Latency State/Queue/Cache | Valkey | ADR-0024 |
| LLM/Model Gateway Security & Routing | Trylon Gateway + LiteLLM | ADR-0016 |
| Remote AI Application, Tool & Hosted Execution | Hugging Face Spaces + hf_transfer | ADR-0017 |
| Developer Agent Workbench & Evaluation Harness | OpenYak + Terax AI + CAIRO Harness | ADR-0022 |

### 3.2 Generative media and creative production

| Fabric/capability | Baseline provider(s) | ADR |
|---|---|---|
| Local Multimodal Generative Media Execution | WanGP/Wan2GP + Stability Matrix + Open Generative AI + ComfyUI | ADR-0012 |
| Agentic Video Production | OpenMontage + Goose + Ollama + OpenWebUI + ComfyUI + Blender + Kdenlive | ADR-0014 |
| AI-Assisted Raster Painting & Generative Image Editing | Krita + krita-ai-diffusion | ADR-0008 |
| AI-Assisted Interactive Video Editing & Creator NLE | Clypra | ADR-0009 |
| AI-Assisted DJ Performance & Music Mixing | Mixxx | ADR-0010 |
| Remote Generative Model API & Aggregation | MuAPI | ADR-0011 |
| Realtime Voice | ElevenLabs | ADR-0020 |
| Local Voice I/O | Voicebox | ADR-0020 |
| Visual Generation & Editing | FLUX | ADR-0021 |
| Web-to-Video | HyperFrames | ADR-0021 |
| Vocal AI | Kits AI | ADR-0021 |
| Shorts/Clipping | Shorts | ADR-0021 |

### 3.3 3D, reconstruction, spatial and digital twin

| Fabric | Baseline provider(s) | ADR |
|---|---|---|
| Generative 3D Asset & Geometry Lifecycle | Meshy + Hunyuan 3D providers | ADR-0004 / ADR-0001 |
| 3D Reconstruction, Photogrammetry & Scene Capture | AliceVision + Meshroom | ADR-0006 |
| Photogrammetry, Camera Geometry & Multi-View Reconstruction | COLMAP | ADR-0007 |
| Infrastructure Digital Twin & Engineering Data | iTwin/iTwin.js | ADR-0005 |
| Generative 3D World & Spatial Reconstruction | HY-World-2.0 | ADR-0001 |
| 3D Motion Generation & Character Animation Planning | HY-Motion-1.0 | ADR-0001 |
| Motion Capture & Human Pose Acquisition | PoseAI | ADR-0019 |

A provider-independent **Reconstruction Gateway** is mandatory for classical reconstruction integration. Canonical reconstruction objects are defined in the registry and ADR-0006.

### 3.4 Physical AI and simulation

- **Physical AI Fabric** — MANDATORY; NVIDIA Cosmos 3 is the primary baseline provider family. See ADR-0018.
- Tencent-Hunyuan HY-Embodied/HY-VLA are mandatory supported alternatives inside this fabric. See ADR-0001.
- MiroFish remains a mandatory supported simulation/world-model integration component without replacing orchestration or Physical-AI provider authority.

### 3.5 Document, work memory and knowledge

- **Document Perception, OCR & Structured Visual Extraction Fabric** — MANDATORY; HunyuanOCR-1.5 primary reference provider. See ADR-0001.
- **Work Memory / Knowledge Workspace Integration** — MANDATORY; Pieces OS work-memory role and Obsidian human knowledge-workbench role. See ADR-0032.

### 3.6 Distributed execution, acceleration and HPC

- **Distributed GPU Execution Fabric** — MANDATORY; WaveSpeedAI/Waverless mandatory supported reference path. ADR-0015.
- **Adaptive Inference Acceleration Profile** — MANDATORY: quantization, CPU/GPU offload, few-step/distilled execution, cache acceleration, speculative decoding, hardware-aware sparse-attention fallback and DiT optimization.
- Hardware-incompatible acceleration kernels MUST be capability-gated and have a compatible fallback.
- **HPC Development Fabric** — MANDATORY; NVIDIA HPC SDK + Intel oneAPI. ADR-0023.

### 3.7 Host, workstation and storage

- **Host Performance / Kernel & I/O Policy Fabric** — MANDATORY. ADR-0025.
- **NUMA/PCIe Locality & IRQ Placement Fabric** — MANDATORY, including NUMA+GPU auto-discovery and stable GPU UUID/PCI-BDF identity. ADR-0025.
- **Adaptive Workload Optimization & Workstation Control Fabric** — MANDATORY, with native Plasma 6/KF6 KCM control surface, privileged/unprivileged plane separation and systemd/cgroup-v2 reference actuation. ADR-0026.
- **Local Block Cache & GPU Data Path** — MANDATORY; LVM-cache, GDRCopy and capability-gated GPUDirect Storage. ADR-0027.

### 3.8 Network and security

- **Host Network Firewall & Traffic Policy Fabric** — MANDATORY; nftables is the canonical kernel enforcement provider, Foomuuri is the supported policy/compiler management layer and OpenSnitch is the process-aware egress plane. ADR-0028.
- **Endpoint Malware & Behavioral Detection Fabric** — MANDATORY; ClamAV + Wazuh + Falco + Fail2Ban + OpenSnitch, feeding a provider-independent policy/containment gate. ADR-0029.
- **Supply Chain Security & Artifact Trust Fabric** — MANDATORY; Harbor + Cosign + Syft + OPA/Conftest + Loki. ADR-0030.
- **DNS/Privacy Resolution Fabric** — MANDATORY; AdGuard Home + dnscrypt-proxy + Unbound. ADR-0031.

## 4. Tencent-Hunyuan provider family

Tencent-Hunyuan is integrated as a capability-provider family, never as a monolithic global dependency. See ADR-0001.

### Mandatory supported Hunyuan providers

- `HunyuanVideo-1.5` — T2V/I2V;
- `OmniWeaving` — free-form multimodal video composition/editing;
- `HunyuanCustom` — subject/identity-preserving controllable video;
- `HunyuanVideo-Avatar` — audio-driven avatar animation;
- `HunyuanVideo-Foley` — video/text-to-audio Foley/SFX;
- `HunyuanImage-3.0` — multimodal T2I/I2I/image editing, deployment optional/remote-distributed capable;
- `Hunyuan3D-2.1` — image-to-shape + PBR texture;
- `Hunyuan3D-Omni` — controlled 3D generation;
- `Hunyuan3D-Part` — semantic part segmentation/decomposition;
- `FlashVDM` — 3D diffusion acceleration;
- `HY-World-2.0` — generative 3D world/spatial reconstruction;
- `HunyuanOCR-1.5` — document OCR/structured visual extraction;
- `HY-Motion-1.0` — generated 3D human motion;
- `HY-Embodied` / HY-VLA — alternative Physical AI/embodied providers.

### Hunyuan WATCH

- `HunyuanVision`
- `Hunyuan3D-Buffalo1.0`
- `Hunyuan3D-WorldClaw`

### Hunyuan OPTIONAL

- `Hy3` and superseded general Hunyuan LLM families through the canonical model gateway.

## 5. Non-negotiable provider integration contract

Every mandatory supported provider adapter MUST expose or map, where relevant:

1. capability descriptor and provider/model/version identity;
2. canonical input/output schema;
3. deterministic selection constraints;
4. license/usage-rights gate;
5. checksum/provenance/lineage metadata;
6. RAM/VRAM/GPU-architecture/runtime requirements;
7. local/remote/distributed execution eligibility;
8. health/readiness state;
9. observability and correlation IDs;
10. security/policy decision context;
11. failure classification and explicit fallback eligibility;
12. authorities the provider is forbidden to assume.

## 6. Cross-cutting architecture rules

### 6.1 Durable lifecycle vs local execution

Temporal owns durable workflow lifecycle. Provider-local queues/subworkflows are implementation details only.

### 6.2 Events vs state

NATS JetStream is the canonical event/message fabric. Valkey is the canonical low-latency state/queue/cache. Neither replaces Temporal durable workflow state.

### 6.3 Human authoring

AI/provider adapters augment Krita, Blender, Unreal and NLE workbenches. They do not silently replace human authoring/finishing authority.

### 6.4 Storage vs acceleration

Cache, scratch, hf_transfer, GDRCopy and GPUDirect Storage accelerate movement/access. They do not become canonical artifact/model storage.

### 6.5 Security sensor vs enforcement

Detection/correlation components produce normalized findings/incidents and feed a policy gate. nftables remains kernel network enforcement authority; containment primitives remain explicit and auditable.

### 6.6 Hardware-aware routing

Incompatible acceleration backends MUST be disabled automatically. Every capability-gated optimization requires a compatible fallback path.

## 7. Change control

Architecture changes are recorded as ADRs under `docs/architecture/adr/` and synchronized into `COMPONENT-REGISTRY.yaml`.

A capability may be promoted to **MANDATORY** only when:

- capability boundary is explicit;
- authority conflicts are resolved;
- provider lock-in is avoided or explicitly justified;
- deployment/resource constraints are documented;
- security, provenance, observability and fallback behavior are defined;
- a reproducible integration path exists, or the mandatory element is explicitly a provider-independent fabric.

The `main` branch becomes the canonical published baseline only after the architecture PR is reviewed and merged.

## 8. ADR index

The authoritative ADR index is maintained in `docs/architecture/adr/README.md`. The current accepted series is ADR-0001 through ADR-0032.
