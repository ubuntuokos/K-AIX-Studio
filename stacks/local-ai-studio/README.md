# Kubuntu 26.04 Local AI Studio

Reference deployment for the FINAL ARCHITECTURE v2.0 workstation profile.

## Components

- Ollama — local inference
- OpenHuman Core — personal AI, memory and research workbench
- Goose — interactive agent runtime and ACP service
- Voicebox — local TTS/STT and MCP voice tools
- Blender + Blender MCP — native DCC integration
- ComfyUI — native Stability Matrix generative-media runtime
- Kdenlive — native human finishing/NLE

Global authority remains unchanged: Temporal owns durable workflow lifecycle; Goose owns interactive agent/tool execution; Central MCP/Capability Gateway is the production capability boundary; NATS JetStream is the event fabric; Valkey is low-latency state/queue/cache; nftables is host network enforcement.

## Local port contract

| Service | Endpoint |
|---|---|
| Ollama | `127.0.0.1:11434` |
| OpenHuman Core | `127.0.0.1:7788` |
| Voicebox native | `127.0.0.1:17493` |
| Voicebox container fallback | `127.0.0.1:17600` -> container `17493` |
| ComfyUI | `127.0.0.1:8188` |
| Blender MCP | `127.0.0.1:9876` |
| Goose ACP | `127.0.0.1:3284` |

The local control endpoints stay on loopback.

## GPU profile

Canonical device identity is GPU UUID + PCI BDF, never a persistent ordinal index.

- RTX 3090 24GB target: Ollama, ComfyUI, Blender Cycles, Kdenlive NVENC.
- RTX A1000 8GB: KDE/Wayland display/UI; Voicebox may use it when the selected engine fits and workload admission permits it.
- Until the RTX 3090 upgrade, use the current RTX 3080 UUID as `GPU_COMPUTE_UUID`.

Heavy compute workloads are admitted by the existing adaptive workload/VRAM policy rather than by relying on OOM behavior.

## OpenHuman

The containerized Core uses `OPENHUMAN_OLLAMA_BASE_URL=http://ollama:11434`. For strict local processing, use the OpenHuman local-only/Privacy Mode enforcement so loss of the local provider cannot silently move the workload to a remote inference route. For Memory Tree local embeddings, the reference model is `bge-m3` or another validated 1024-dimensional compatible replacement.

## Voicebox

Native desktop Voicebox is the primary workstation path for host audio and dictation. Its MCP endpoint is `http://127.0.0.1:17493/mcp`. `X-Voicebox-Client-Id` identifies the client for voice binding; it is not an authentication credential.

The optional container profile uses host port `17600` so it can coexist with the native `17493` service.

## Goose

Copy `goose/config.yaml.example` to `~/.config/goose/config.yaml` after replacing the model placeholder with a pinned model tag. The reference profile uses `GOOSE_MODE=approve`, `SECURITY_PROMPT_ENABLED=true`, `GOOSE_TELEMETRY_ENABLED=false`, a Goose ACP secret, Voicebox Streamable HTTP MCP, and commit-pinned Blender MCP over stdio.

## Installation

```bash
cp .env.example .env
chmod 600 .env
chmod +x scripts/*.sh

sudo mkdir -p /opt/ai-src
sudo chown "$USER:$USER" /opt/ai-src
./scripts/bootstrap-sources.sh

docker compose -f compose-core.yaml up -d --build
```

Optional headless Voicebox:

```bash
docker compose -f compose-voicebox.yaml up -d --build
```

Install the Goose user service:

```bash
./scripts/install-goose-user-service.sh
```

Run local acceptance diagnostics:

```bash
./scripts/doctor.sh
```

## Pinning

`source-lock.env` records the reviewed upstream commits. Runtime images and model artifacts also require explicit version/digest/checksum pinning. The template intentionally contains placeholders rather than floating production references.

The normative architecture decision is maintained separately in `ubuntuokos/Final-Architecture-v2.0` under `architecture/mandatory/local-ai-studio-voice-creative-fabric.md`.
