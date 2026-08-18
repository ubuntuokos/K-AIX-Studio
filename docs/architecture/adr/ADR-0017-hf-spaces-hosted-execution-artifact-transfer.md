# ADR-0017 — Remote AI Application, Tool & Hosted Execution with Hugging Face Spaces

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Remote AI Application, Tool & Hosted Execution Fabric** with Hugging Face Spaces as a mandatory supported reference provider and `hf_transfer` as a mandatory supported high-throughput artifact-transfer path where applicable.

## Capability boundary

This fabric covers remote hosted AI applications/tools, provider-hosted execution surfaces and associated artifact movement. It is distinct from:

- Remote Generative Model API & Aggregation (MuAPI-class APIs);
- canonical LLM/model gateway routing;
- local generative media execution;
- Global Durable Orchestration.

## Mandatory behavior

- capability descriptor for each hosted app/tool;
- explicit input/output/artifact schema;
- authentication/credential indirection;
- policy and data-classification gate before remote execution;
- transfer integrity/provenance verification;
- timeout/failure classification and explicit fallback eligibility;
- observability for invocation, transfer and provider state;
- artifact lineage retained when data crosses local/remote boundaries.

## Authority boundary

Hugging Face Spaces and `hf_transfer` MUST NOT become global workflow authority, canonical model gateway, canonical artifact store, event bus, state store or secret authority.

## Consequences

Hosted AI applications can be used as governed replaceable capabilities without conflating application hosting with model API aggregation or platform orchestration.