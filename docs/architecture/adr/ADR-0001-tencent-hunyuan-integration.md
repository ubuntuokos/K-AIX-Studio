# ADR-0001 — Tencent-Hunyuan integration profile

- Status: **Accepted for FINAL ARCHITECTURE v2.0 working baseline**
- Date: 2026-08-18
- Decision type: Capability-provider integration

## Context

Tencent-Hunyuan contains multiple independent model and runtime families spanning image/video generation, 3D asset generation, 3D world reconstruction, OCR/document intelligence, motion generation, embodied/physical AI and inference acceleration.

Treating the organization as a single platform dependency would create authority conflicts, hardware coupling and unnecessary provider lock-in.

## Decision

Tencent-Hunyuan SHALL be integrated through provider-independent capability fabrics and canonical adapters. No Tencent-Hunyuan repository becomes a global platform dependency by virtue of being mandatory supported.

### Mandatory supported providers

#### Video and multimodal media

- `Tencent-Hunyuan/HunyuanVideo-1.5`
- `Tencent-Hunyuan/OmniWeaving`
- `Tencent-Hunyuan/HunyuanCustom`
- `Tencent-Hunyuan/HunyuanVideo-Avatar`
- `Tencent-Hunyuan/HunyuanVideo-Foley`

#### Generative 3D

- `Tencent-Hunyuan/Hunyuan3D-2.1`
- `Tencent-Hunyuan/Hunyuan3D-Omni`
- `Tencent-Hunyuan/Hunyuan3D-Part`
- `Tencent-Hunyuan/FlashVDM`

#### New mandatory fabrics introduced by this decision

1. **Generative 3D World & Spatial Reconstruction Fabric**
   - primary reference provider: `Tencent-Hunyuan/HY-World-2.0`
2. **Document Perception, OCR & Structured Visual Extraction Fabric**
   - primary reference provider: `Tencent-Hunyuan/HunyuanOCR` / HunyuanOCR-1.5
3. **3D Motion Generation & Character Animation Planning Fabric**
   - primary reference provider: `Tencent-Hunyuan/HY-Motion-1.0`

#### Physical AI / embodied

- `Tencent-Hunyuan/HY-Embodied`
- HY-VLA family

These are mandatory supported alternatives inside the Physical AI fabric and do not replace the NVIDIA Cosmos 3 baseline.

#### Image generation

- `Tencent-Hunyuan/HunyuanImage-3.0` — mandatory supported provider, deployment optional and remote/distributed-capable.

### Optional / watch

- `Tencent-Hunyuan/Hy3` — optional general LLM provider through the canonical LLM gateway; not a mandatory local runtime.
- `Tencent-Hunyuan/HunyuanVision` — WATCH.
- `Tencent-Hunyuan/Hunyuan3D-Buffalo1.0` — WATCH.
- `Tencent-Hunyuan/Hunyuan3D-WorldClaw` — WATCH.

## Authority boundaries

Tencent-Hunyuan providers MUST NOT become authorities for:

- Global durable orchestration — Temporal remains authoritative.
- Event/message transport — NATS JetStream remains authoritative.
- Low-latency state/queue/cache — Valkey remains authoritative.
- Tool/capability mediation — Central MCP/Capability Gateway remains authoritative.
- Interactive agent runtime — Goose remains the reference provider.
- Human 3D/raster/video authoring — canonical DCC/NLE/creative surfaces remain authoritative in their domains.
- Infrastructure engineering digital twins — iTwin fabric remains separate.
- Classical photogrammetry/reconstruction — COLMAP/AliceVision paths remain separate.

## Runtime policy

Every Hunyuan adapter must advertise model/version identity, VRAM/RAM and GPU architecture requirements, local/remote/distributed eligibility, license/usage constraints, provenance, security context, observability hooks, failure classification and fallback eligibility.

Acceleration must be hardware-aware. Few-step/distilled execution, caching, quantization/offload and speculative decoding are preferred where supported. Sparse-attention backends are capability-gated; unsupported GPU architectures require a compatible fallback.

## Consequences

### Positive

- Adds strong Hunyuan capabilities without creating a monolithic dependency.
- Keeps orchestration, messaging, state, authoring and security authorities stable.
- Allows local, remote and distributed routing per model rather than forcing one deployment profile.
- Makes new 3D world, OCR/document and generated-motion capabilities first-class architecture elements.

### Costs

- Requires a canonical provider-adapter contract and capability registry.
- Requires hardware/resource detection and deterministic routing.
- Requires validation as upstream model versions and licenses evolve.

## Supersession rule

Older HunyuanVideo, Hunyuan3D and general Hunyuan LLM generations remain compatibility/fallback providers unless a future ADR explicitly promotes them.
