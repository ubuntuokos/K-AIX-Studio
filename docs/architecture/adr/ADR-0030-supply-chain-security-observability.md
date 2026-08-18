# ADR-0030 — Software/Model Supply Chain Security & Observability

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Supply Chain Security & Artifact Trust Fabric**.

Mandatory supported baseline components:

- Harbor — governed artifact/container registry role;
- Cosign — signing/verification/attestation;
- Syft — SBOM generation;
- OPA/Conftest — policy evaluation for configuration/artifact admission;
- Loki — security/operations log aggregation within the observability stack.

## Mandatory behavior

- artifact digest identity;
- SBOM generation and retention;
- signatures/attestations and provenance verification;
- policy gate before promotion/execution where required;
- immutable or append-audited trust metadata;
- model/container/package origin and version lineage;
- quarantine/rejection path for failed policy;
- reproducible verification independent of UI/tooling;
- correlation with endpoint/runtime security findings.

## Authority boundary

No individual registry, scanner or policy CLI becomes global workflow, identity, secret or runtime authority. Harbor is not a replacement for canonical general data storage. OPA/Conftest evaluates policy but enforcement remains with the appropriate domain control plane.

## Consequences

Models, containers and software artifacts are admitted based on verifiable identity, provenance and policy rather than filename/location trust.