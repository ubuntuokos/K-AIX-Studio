# FINAL ARCHITECTURE v2.0

Status: **canonical working baseline**  
Branch: `agent/final-architecture-v2`  
Last baseline update: 2026-08-18

## 1. Architectural rule set

FINAL ARCHITECTURE v2.0 is capability-first and provider-independent. A named project may be a mandatory supported reference provider without becoming a global hard dependency or authority outside its declared capability boundary.

### Status vocabulary

- **MANDATORY** — capability/fabric is part of the baseline and must be implemented.
- **MANDATORY SUPPORT** — provider/adapter must be supported, but the provider is replaceable.
- **OPTIONAL** — useful provider or backend that is not required for a compliant deployment.
- **WATCH** — promising project that is not mature/reproducible enough for runtime baseline status.
- **EXCLUDED AS AUTHORITY** — may be integrated, but must not assume the named authority role.

## 2. Global authority map

| Authority | Canonical role |
|---|---|
| Temporal | Global Durable Orchestration & Workflow Lifecycle |
| NATS JetStream | Canonical event/message fabric |
| Valkey | Canonical low-latency state/queue/cache |
| Goose | Interactive Agent Runtime & Tool Execution reference provider |
| Central MCP/Capability Gateway | Capability discovery, tool/provider mediation and policy-bound invocation |
| nftables | Kernel network enforcement provider |
| Blender / Unreal / Krita / NLE surfaces | Human authoring and finishing surfaces in their own domains |

No provider-specific AI model family may silently replace these authorities.

## 3. Mandatory capability fabrics

The following fabrics are baseline elements of FINAL ARCHITECTURE v2.0.

### Core orchestration, execution and integration

- **Global Durable Orchestration & Workflow Lifecycle Fabric** — MANDATORY; Temporal is the primary reference provider.
- **Visual Integration Automation & Human Workflow Fabric** — MANDATORY; n8n is a mandatory supported primary reference provider.
- **Interactive Agent Runtime & Tool Execution** — Goose mandatory supported reference provider.
- **Canonical event/message fabric** — NATS JetStream.
- **Canonical low-latency state/queue/cache** — Valkey.
- **Central MCP/Capability Gateway** — provider mediation and capability routing.

### Media and generative AI

- **Stability Matrix Local Generative Media Fabric** — MANDATORY.
- **AI-Assisted Raster Painting & Generative Image Editing Fabric** — MANDATORY; Krita + `krita-ai-diffusion` primary local workbench.
- **AI-Assisted Interactive Video Editing & Creator NLE Fabric** — MANDATORY; Clypra mandatory supported reference provider.
- **AI-Assisted DJ Performance & Music Mixing Fabric** — MANDATORY; Mixxx mandatory supported reference provider.
- **Remote Generative Model API & Aggregation Fabric** — MANDATORY; MuAPI mandatory supported reference provider.
- **Realtime Voice** — ElevenLabs mandatory supported provider.
- **Local Voice I/O** — Voicebox mandatory.
- **Agentic Video Production pipeline** — OpenMontage + Goose + Ollama + OpenWebUI + ComfyUI + Blender + Kdenlive mandatory integration path.
- **Open Generative AI Studio** — MANDATORY.
- **FLUX Visual Generation & Editing** — MANDATORY.
- **HyperFrames Web-to-Video** — MANDATORY.
- **Kits AI Vocal** — MANDATORY.
- **Shorts clipping workflow** — MANDATORY.

### 3D, spatial and digital twin

- **Generative 3D Asset & Geometry Lifecycle Fabric** — MANDATORY; provider-independent.
- **Infrastructure Digital Twin & Engineering Data Fabric** — MANDATORY; iTwin/iTwin.js primary reference provider.
- **Generative 3D World & Spatial Reconstruction Fabric** — MANDATORY.
- **3D Motion Generation & Character Animation Planning Fabric** — MANDATORY.
- **MoCap integration** — PoseAI mandatory supported provider.

### Physical AI and simulation

- **Physical AI Fabric** — MANDATORY; NVIDIA Cosmos 3 remains the primary baseline provider family.
- **Simulation / world modeling integration** — MiroFish and domain world-model adapters supported without replacing orchestration authority.

### Document and knowledge perception

- **Document Perception, OCR & Structured Visual Extraction Fabric** — MANDATORY.
- **Pieces OS Work Memory** — MANDATORY supported work-memory component.
- **Obsidian integration** — human knowledge/workbench surface; not global workflow authority.

### Runtime, acceleration and distributed execution

- **Adaptive Inference Acceleration Profile** — MANDATORY capability: quantization, offload, few-step/distilled execution, cache acceleration, speculative decoding and hardware-aware sparse-attention fallback.
- **DiT inference optimization** — MANDATORY.
- **WaveSpeedAI/Waverless Distributed GPU Fabric** — MANDATORY supported distributed execution path.
- **GDRCopy** — MANDATORY.
- **GPUDirect Storage** — MANDATORY where hardware/software path is supported.
- **NUMA + GPU auto-discovery** — MANDATORY.
- **NUMA/PCIe Locality & IRQ Placement Fabric** — MANDATORY.
- **NVIDIA HPC SDK + Intel oneAPI** — MANDATORY supported HPC development fabric.

### Host, storage, desktop and security

- **Host Performance / Kernel & I/O Policy Fabric** — MANDATORY.
- **AI Workstation Adaptive Optimizer / KDE6 KCM control plane** — MANDATORY.
- **Local Block Cache / LVM-cache** — MANDATORY.
- **DNS/Privacy stack** — AdGuard Home + dnscrypt-proxy + Unbound mandatory baseline.
- **Endpoint Detection** — Falco + Wazuh + ClamAV mandatory baseline.
- **Supply Chain Security** — Harbor + Cosign + Syft + OPA/Conftest + Loki mandatory baseline.
- **nftables** — sole canonical kernel enforcement authority; Foomuuri may be supported as management layer.

## 4. Tencent-Hunyuan mandatory integration profile

Tencent-Hunyuan is integrated as a **capability provider family**, not as a monolithic global dependency.

### 4.1 Generative video — MANDATORY SUPPORT

- `Tencent-Hunyuan/HunyuanVideo-1.5` — primary Hunyuan T2V/I2V provider.
- `Tencent-Hunyuan/OmniWeaving` — advanced free-form multimodal video composition, reference, key-frame and V2V provider.
- `Tencent-Hunyuan/HunyuanCustom` — identity/subject-preserving and multimodal controllable video provider.
- `Tencent-Hunyuan/HunyuanVideo-Avatar` — audio-driven single/multi-character avatar animation provider.
- `Tencent-Hunyuan/HunyuanVideo-Foley` — video/text-to-audio Foley/SFX provider.

These providers do not own global video orchestration or NLE authority.

### 4.2 Generative 3D asset — MANDATORY SUPPORT

- `Tencent-Hunyuan/Hunyuan3D-2.1` — image-to-shape + PBR texture provider.
- `Tencent-Hunyuan/Hunyuan3D-Omni` — controllable 3D generation using point cloud, voxel, bbox and skeleton/pose controls.
- `Tencent-Hunyuan/Hunyuan3D-Part` — semantic part segmentation/decomposition provider.
- `Tencent-Hunyuan/FlashVDM` — mandatory supported 3D diffusion acceleration capability.

These providers extend, but do not replace, Meshy remote generation, Blender/Unreal authoring, classical photogrammetry, or the canonical asset-lifecycle authority.

### 4.3 Generative 3D world & spatial reconstruction — MANDATORY

Primary reference provider: `Tencent-Hunyuan/HY-World-2.0`.

Required capability boundary:

- text/single-image to navigable 3D world;
- multi-view/video to 3D reconstruction;
- mesh / Gaussian Splatting / point-cloud outputs;
- panorama generation, trajectory planning, world expansion and composition;
- export/adaptation to Blender, Unity, Unreal and simulation/robotics stacks.

Must not replace iTwin engineering digital-twin authority, COLMAP/AliceVision classical reconstruction, Blender/Unreal authoring or Temporal orchestration.

### 4.4 Document perception / OCR — MANDATORY

Primary reference provider: `Tencent-Hunyuan/HunyuanOCR` / HunyuanOCR-1.5.

Canonical objects:

- `DocumentInput`
- `DocumentRegion`
- `OCRSpan`
- `LayoutElement`
- `TableStructure`
- `FormulaStructure`
- `DocumentEntity`
- `StructuredExtraction`
- `DocumentTranslation`
- `OCRConfidence`

Supported runtime adapters should include vLLM, Transformers and llama.cpp/OpenAI-compatible serving where available. This fabric is not the general LLM/VLM authority.

### 4.5 3D motion generation — MANDATORY

Primary reference provider: `Tencent-Hunyuan/HY-Motion-1.0`.

Required boundary:

- text-to-skeleton 3D human motion generation;
- retarget/export path to DCC and game-engine pipelines;
- SMPL/SMPLH, FBX/BVH and Blender/Unreal adapter strategy.

Generated motion remains distinct from PoseAI/MoCap captured motion.

### 4.6 Physical AI / embodied intelligence — MANDATORY SUPPORT

`Tencent-Hunyuan/HY-Embodied` and HY-VLA are mandatory supported alternative providers for physical-world perception, action-state understanding, action-transition reasoning and VLA/robotics workflows.

They do not replace the NVIDIA Cosmos 3 baseline. Large variants are routed through remote/distributed execution rather than becoming a local workstation hard dependency.

### 4.7 Image generation — MANDATORY SUPPORT, deployment optional

`Tencent-Hunyuan/HunyuanImage-3.0` is a mandatory supported Hunyuan image provider for native multimodal T2I/I2I, reasoning-aware editing and multi-image fusion.

It does not replace FLUX/Krita as the primary local visual-generation/editing path and must remain remote/distributed-capable.

### 4.8 Hunyuan general LLMs — OPTIONAL provider path

`Tencent-Hunyuan/Hy3` and older Hunyuan LLM generations may be exposed through the canonical LLM gateway and remote/distributed runtime. They are not mandatory local models and must not replace LiteLLM/Trylon, vLLM serving policy, Goose or global orchestration authority.

### 4.9 Hardware-aware acceleration — MANDATORY POLICY

For applicable Hunyuan and other model runtimes, the integration layer must select compatible acceleration methods automatically:

- few-step / step-distilled inference;
- DeepCache / TeaCache / TaylorCache-class caching where supported;
- FP8 / INT4 / quantization where supported;
- model/CPU/GPU offload;
- speculative decoding / MTP / DFlash where supported;
- sparse-attention backend selected from hardware capabilities.

`flex-block-attn` is hardware-gated and must not be enabled on unsupported GPU architectures. A compatible attention backend must remain available as fallback.

### 4.10 WATCH list

The following remain WATCH rather than runtime baseline until reproducible open weights/inference are available and validated:

- `Tencent-Hunyuan/HunyuanVision`
- `Tencent-Hunyuan/Hunyuan3D-Buffalo1.0`
- `Tencent-Hunyuan/Hunyuan3D-WorldClaw`

Superseded HunyuanVideo/Hunyuan3D/general-LLM generations are compatibility/fallback targets only unless an ADR promotes them.

## 5. Provider integration contract

Every mandatory supported provider adapter must expose, at minimum:

1. capability descriptor and model/version identity;
2. input/output schema and canonical object mapping;
3. deterministic provider selection constraints;
4. license/usage-rights gate;
5. checksum/provenance/lineage metadata;
6. VRAM/RAM/GPU-architecture requirements;
7. local, remote and distributed execution eligibility;
8. health/readiness information;
9. observability hooks and execution metrics;
10. security/policy decision context;
11. failure classification and fallback eligibility;
12. explicit declaration of authorities it must not assume.

## 6. Change control

Architecture changes are documented through ADRs under `docs/architecture/adr/`.

A component may be promoted to **MANDATORY** only when:

- its capability boundary is explicit;
- authority conflicts are resolved;
- provider lock-in is avoided or justified;
- deployment/resource constraints are documented;
- security, observability and fallback behavior are defined;
- a reproducible integration path exists, or the mandatory item is explicitly a fabric rather than one runtime implementation.

The `main` branch becomes the canonical published baseline only after the corresponding architecture PR is reviewed and merged.
