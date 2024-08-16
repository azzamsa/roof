#!/usr/bin/env -S just --justfile

alias f := fmt
alias l := lint
alias c := comply
alias k := check

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
    dprint fmt
    stylua .

# Check is the codebase properly formatted.
fmt-check:
    dprint check
    stylua . --check

# Lint the codebase.
lint:
    typos
    selene . --quiet

# Create a release. Example `just release v0.1.0`
release version:
    ./release {{ version }}
