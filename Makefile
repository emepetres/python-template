# Makefile for easy development workflows.
# See development.md for docs.
# Note GitHub Actions call uv directly, not this Makefile.

ifeq ($(OS),Windows_NT)
SHELL := powershell.exe
.SHELLFLAGS := -NoProfile -Command
endif
.DEFAULT_GOAL := default

.PHONY: default install lint test upgrade build clean

default: install lint test

install:
	uv sync --all-extras

lint:
	uv run python devtools/lint.py

test:
	uv run coverage run -m pytest
	uv run coverage report --fail-under=80

upgrade:
	uv sync --upgrade --all-extras --dev

build:
	uv build

clean:
ifeq ($(OS),Windows_NT)
	pwsh -NoProfile -File devtools/clean.ps1
else
	sh devtools/clean.sh
endif
