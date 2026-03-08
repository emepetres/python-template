# Makefile for maintaining the Copier template repository.

ifeq ($(OS),Windows_NT)
SHELL := powershell.exe
.SHELLFLAGS := -NoProfile -Command
endif
.DEFAULT_GOAL := default

.PHONY: default install lint test copy-check clean

default: install lint test

install:
	uv sync --all-extras

lint:
	uv run ruff check tests

test:
	uv run pytest

copy-check:
	uv run copier copy --defaults . .tmp-generated
ifeq ($(OS),Windows_NT)
	Remove-Item -Recurse -Force .tmp-generated
else
	rm -rf .tmp-generated
endif

clean:
ifeq ($(OS),Windows_NT)
	if (Test-Path .tmp-generated) { Remove-Item -Recurse -Force .tmp-generated }
	if (Test-Path .pytest_cache) { Remove-Item -Recurse -Force .pytest_cache }
	if (Test-Path .ruff_cache) { Remove-Item -Recurse -Force .ruff_cache }
	if (Test-Path .coverage) { Remove-Item -Force .coverage }
else
	rm -rf .tmp-generated .pytest_cache .ruff_cache .coverage
endif
