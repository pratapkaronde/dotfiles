#!/usr/bin/env bash
set -euo pipefail

config_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

nvim --headless -u "${config_dir}/init.lua" -i NONE \
	'+lua print("Neovim configuration loaded successfully")' \
	+qa
