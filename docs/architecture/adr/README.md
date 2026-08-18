# Architecture Decision Records

This directory stores architecture decisions for FINAL ARCHITECTURE v2.0.

## ADR lifecycle

1. **Proposed** — candidate decision under evaluation.
2. **Accepted** — part of the working architecture baseline.
3. **Superseded** — replaced by a later ADR.
4. **Rejected** — evaluated but intentionally not adopted.

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
