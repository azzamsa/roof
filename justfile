#!/usr/bin/env -S just --justfile

alias f := fmt
alias l := lint

# List available commands.
_default:
    just --list --unsorted

# Setup the repository
setup:

# Tasks to make the code-base comply with the rules. Mostly used in git hooks.
comply: fmt lint

# Check if the repository comply with the rules and ready to be pushed.
check: fmt-check lint

# Format the codebase.
fmt:
    dprint fmt --config configs/dprint.json
    stylua --config-path configs/stylua.toml --glob '*.lua' --glob '!target' --allow-hidden .

# Check is the codebase properly formatted.
fmt-check:
    dprint check --config configs/dprint.json
    stylua --config-path configs/stylua.toml --glob '*.lua' --glob '!target' --allow-hidden --check .

# Lint the codebase.
lint:
    typos --config configs/typos.toml

# Create a release. Example `just release 0.1.0`
release version start_sha:
    python scripts/release.py {{ version }}
