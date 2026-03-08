# AGENTS.md

## Project overview
- This repository provides a Copier template for Python 3.12+ projects.
- Copier configuration is in `copier.yml`, and rendered project files are in `template/`.
- Root code is maintainer-only (template checks), not an application package.

## Project structure
- `copier.yml`: Copier questions/settings.
- `template/`: generated project source tree with Jinja templates.
- `tests/template_copy_tests.py`: smoke test that runs `copier copy` against this template.
- `pyproject.toml`: template-maintainer dependencies and test/lint settings.
- `Makefile`: maintainer workflows.

## Setup and development commands
- Install dependencies: `uv sync --all-extras`
- Run lint checks: `uv run ruff check tests`
- Run tests: `uv run pytest`
- Run template copy smoke check: `uv run copier copy --defaults . .tmp-generated`
- Run full default workflow: `make` (runs install, lint, test)

## Code style and conventions
- Keep code compatible with Python `>=3.12`.
- Use type hints for maintainer test code.
- Follow Ruff formatting/linting conventions for root `tests/`.
- Keep generated-project conventions in `template/` aligned with the current design.

## Testing guidance
- Use `pytest`; test discovery is configured in `pyproject.toml`.
- Add or update tests for template behavior changes.
- Prefer real Copier renders in tests instead of mocks.
- Keep tests short and behavior-focused.

## Configuration and secrets
- Do not commit real secrets; keep only non-sensitive defaults/examples in template files.
- Be careful not to introduce generated values with secrets in tracked files.

## Change expectations for agents
- Keep changes focused and minimal.
- Prefer modifying existing patterns over introducing new frameworks/tools.
- Before finishing, run lint/type checks and tests, then fix failures.
