#!/usr/bin/env sh

set -eu

rm -rf ./*.egg-info/
rm -rf ./.pytest_cache ./.ruff_cache
rm -rf ./.coverage
rm -rf ./.venv/
find ./src ./tests ./devtools -type d -name "__pycache__" -exec rm -rf {} +
