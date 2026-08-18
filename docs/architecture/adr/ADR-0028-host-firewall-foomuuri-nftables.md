# ADR-0028 — Host Network Firewall & Traffic Policy with nftables/Foomuuri

Status: ACCEPTED  
Date: 2026-08-18

## Decision

FINAL ARCHITECTURE v2.0 MUST include a provider-independent **Host Network Firewall & Traffic Policy Fabric**.

- nftables/Netfilter is the mandatory canonical Linux kernel enforcement provider.
- Foomuuri is a mandatory supported high-level policy/compiler and management-layer reference provider, but is not a global hard dependency.
- OpenSnitch remains the application/process-aware egress plane and MUST NOT own kernel firewall topology.

## Canonical object

`FirewallPolicy` / declarative `ServicePolicy` represents platform intent independently of the compiler/provider.

## Mandatory behavior

- management-plane/enforcement-plane separation;
- bidirectional zone policy and dynamic interface-to-zone mapping;
- unified IPv4/IPv6 handling;
- default-deny INPUT/FORWARD baseline with explicit service exposure;
- per-source rate limits and dynamic quarantine where policy requires;
- validate → compile → diff → snapshot → atomic apply → verify → rollback;
- shadow/dry-run and LEARN/AUDIT/ENFORCE rollout modes;
- single-writer rule for canonical nftables topology;
- explicit container firewall/NAT ownership;
- NetworkManager integration where applicable;
- least-privilege D-Bus/admin interfaces;
- native nftables recovery/fallback path independent of Foomuuri.

## Authority boundary

nftables is the sole kernel enforcement authority. Foomuuri compiles/manages policy but MUST NOT obscure recoverability or become policy decision authority. OpenSnitch, Fail2Ban and endpoint tools feed policy/enforcement through explicit adapters rather than independently rewriting canonical topology.

## Consequences

The host firewall remains deterministic, reversible and provider-independent while preserving a higher-level policy layer.