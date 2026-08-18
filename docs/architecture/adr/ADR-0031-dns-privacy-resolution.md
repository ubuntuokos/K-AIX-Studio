# ADR-0031 — DNS Privacy & Resolution Fabric

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **DNS/Privacy Resolution Fabric** with AdGuard Home + dnscrypt-proxy + Unbound as the mandatory supported baseline stack.

## Mandatory roles

- AdGuard Home — filtering/policy and user-facing DNS management layer;
- dnscrypt-proxy — privacy-preserving upstream transport/resolver selection layer;
- Unbound — validating recursive/cache resolver capability where deployed in the profile.

## Mandatory behavior

- explicit listen/forward topology with no accidental resolver loops;
- DNSSEC validation policy;
- encrypted upstream transport where configured;
- privacy/no-log provider policy where applicable;
- local filtering/policy controls;
- service readiness and failure observability;
- deterministic fallback/recovery behavior;
- host firewall rules aligned with the declared DNS topology.

## Authority boundary

The DNS stack is not a general network security policy authority, application egress controller, identity system or workflow engine. nftables remains kernel network enforcement; OpenSnitch remains application/process-aware egress control.

## Consequences

DNS privacy, filtering and validation are explicit platform capabilities with clear role separation from firewall and application-network policy.