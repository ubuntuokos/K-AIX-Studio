#!/usr/bin/env bash
set -Eeuo pipefail

failures=0
warnings=0

ok()   { printf '[ OK ] %s\n' "$*"; }
warn() { printf '[WARN] %s\n' "$*"; warnings=$((warnings+1)); }
fail() { printf '[FAIL] %s\n' "$*"; failures=$((failures+1)); }

check_cmd() {
  if command -v "$1" >/dev/null 2>&1; then ok "command: $1"; else fail "missing command: $1"; fi
}

check_http() {
  local name="$1" url="$2"
  if curl -fsS --max-time 3 "$url" >/dev/null 2>&1; then
    ok "${name}: ${url}"
  else
    warn "${name} not reachable: ${url}"
  fi
}

check_tcp() {
  local name="$1" host="$2" port="$3"
  if command -v nc >/dev/null 2>&1 && nc -z -w2 "$host" "$port" >/dev/null 2>&1; then
    ok "${name}: ${host}:${port}"
  else
    warn "${name} not reachable: ${host}:${port}"
  fi
}

check_loopback_port() {
  local port="$1"
  if ss -H -ltn "sport = :${port}" 2>/dev/null | grep -Eq '(^|[[:space:]])(0\.0\.0\.0|\[::\]|\*):'"${port}"'([[:space:]]|$)'; then
    fail "port ${port} is exposed on a wildcard interface"
  elif ss -H -ltn "sport = :${port}" 2>/dev/null | grep -q .; then
    ok "port ${port} is not wildcard-bound"
  else
    warn "port ${port} is not currently listening"
  fi
}

for cmd in curl git docker ss nvidia-smi; do check_cmd "$cmd"; done

printf '\nGPU inventory (UUID + PCI bus):\n'
if command -v nvidia-smi >/dev/null 2>&1; then
  nvidia-smi --query-gpu=index,name,uuid,pci.bus_id,memory.total --format=csv,noheader || true
fi

printf '\nService probes:\n'
check_http "Ollama" "http://127.0.0.1:11434/api/tags"
check_http "OpenHuman Core" "http://127.0.0.1:7788/health"

if curl -fsS --max-time 2 "http://127.0.0.1:17493/health" >/dev/null 2>&1; then
  ok "Voicebox native: http://127.0.0.1:17493/health"
elif curl -fsS --max-time 2 "http://127.0.0.1:17600/health" >/dev/null 2>&1; then
  ok "Voicebox container: http://127.0.0.1:17600/health"
else
  warn "Voicebox not reachable on native 17493 or container 17600"
fi

check_http "ComfyUI" "http://127.0.0.1:8188/system_stats"
check_http "Goose ACP status" "http://127.0.0.1:3284/status"
check_tcp "Blender MCP socket" "127.0.0.1" "9876"

printf '\nLoopback policy:\n'
for port in 11434 7788 17493 17600 8188 9876 3284; do
  check_loopback_port "$port"
done

printf '\nSummary: %d failure(s), %d warning(s)\n' "$failures" "$warnings"
(( failures == 0 ))
