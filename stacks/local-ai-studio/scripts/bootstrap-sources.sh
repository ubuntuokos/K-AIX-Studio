#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
STACK_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
# shellcheck disable=SC1091
source "${STACK_DIR}/source-lock.env"

AI_SRC_ROOT="${AI_SRC_ROOT:-/opt/ai-src}"

die() { printf 'ERROR: %s\n' "$*" >&2; exit 1; }
note() { printf '==> %s\n' "$*"; }

command -v git >/dev/null 2>&1 || die "git is required"
mkdir -p "${AI_SRC_ROOT}" 2>/dev/null || die "${AI_SRC_ROOT} is not writable; create it and grant your user write access"

sync_repo() {
  local name="$1" repo="$2" ref="$3"
  local dst="${AI_SRC_ROOT}/${name}"

  if [[ -e "${dst}" && ! -d "${dst}/.git" ]]; then
    die "${dst} exists but is not a Git repository"
  fi

  if [[ ! -d "${dst}/.git" ]]; then
    note "Cloning ${name}"
    git clone --filter=blob:none "${repo}" "${dst}"
  fi

  if [[ -n "$(git -C "${dst}" status --porcelain)" ]]; then
    die "${dst} has local changes; refusing to overwrite them"
  fi

  note "Pinning ${name} to ${ref}"
  git -C "${dst}" fetch --tags --prune origin
  git -C "${dst}" fetch origin "${ref}"
  git -C "${dst}" checkout --detach "${ref}"
}

sync_repo openhuman "${OPENHUMAN_REPO}" "${OPENHUMAN_REF}"
sync_repo voicebox "${VOICEBOX_REPO}" "${VOICEBOX_REF}"

note "Pinned source checkout complete."
