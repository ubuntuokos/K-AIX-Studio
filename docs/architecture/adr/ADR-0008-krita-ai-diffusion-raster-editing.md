# ADR-0008 — AI-Assisted Raster Painting & Generative Image Editing with Krita AI Diffusion

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **AI-Assisted Raster Painting & Generative Image Editing Fabric**.

Krita remains the canonical interactive raster/painting creative surface. `Acly/krita-ai-diffusion` is a mandatory supported primary reference provider for the Krita-native AI workbench.

## Mandatory capability profile

- inpainting and outpainting;
- generative fill;
- live painting;
- upscaling;
- region/layer-aware prompting;
- ControlNet/IP-Adapter guidance;
- style/preset handling;
- generation queue/history;
- governed execution of custom ComfyUI workflows from Krita.

## Authority boundary

`krita-ai-diffusion` MUST NOT become:

- the canonical inference runtime;
- the global orchestrator;
- the exclusive image-generation backend;
- the platform workflow authority.

Krita owns interactive raster authoring. ComfyUI/Stability Matrix and other model runtimes remain execution providers behind platform contracts. Temporal, NATS, Valkey and the Central MCP/Capability Gateway retain their global roles.

## Consequences

Generative image editing is integrated directly into the human creative surface without coupling platform-wide inference or orchestration to the Krita plugin.