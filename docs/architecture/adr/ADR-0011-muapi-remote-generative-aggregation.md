# ADR-0011 — Remote Generative Model API & Aggregation with MuAPI

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Remote Generative Model API & Aggregation Fabric** across AI Runtime, Media Production, Integration/API Gateway, Agent & Tool Execution, Security/Governance and Observability.

MuAPI is a mandatory supported primary reference provider for multimodal cloud generative-model aggregation across image, video, audio/music/speech, enhancement, 3D and other remote generative capabilities.

A provider-independent **Remote Generative Gateway/Adapter** is mandatory.

## Required boundary

The fabric is distinct from:

- Hugging Face Spaces-style hosted application/tool execution;
- the canonical LLM/inference gateway;
- local generative media runtimes.

MuAPI MUST NOT become a global hard dependency, canonical inference runtime, global orchestrator, exclusive workflow engine or automatic fallback target.

## Mandatory provider contract

Adapters must normalize at least provider/model descriptors, capability discovery, generation requests/jobs, artifacts, usage/cost metadata, provenance, safety/policy context, asynchronous state, failure classification and explicit fallback eligibility.

## Consequences

Remote generative services become replaceable governed providers. Local execution and alternative remote aggregators remain first-class routes.