#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
STACK_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"

mkdir -p "${HOME}/.config/goose" "${HOME}/.config/systemd/user"

if [[ ! -f "${HOME}/.config/goose/studio.env" ]]; then
  install -m 600 "${STACK_DIR}/goose/studio.env.example" "${HOME}/.config/goose/studio.env"
  printf 'Created %s. Replace REPLACE_* values before starting the service.\n' "${HOME}/.config/goose/studio.env"
fi

install -m 644 "${STACK_DIR}/goose/goose-studio.service" "${HOME}/.config/systemd/user/goose-studio.service"

systemctl --user daemon-reload
systemctl --user enable goose-studio.service

printf '%s\n' "Installed and enabled goose-studio.service."
printf '%s\n' "After editing ~/.config/goose/studio.env, start with:"
printf '%s\n' "  systemctl --user start goose-studio.service"
