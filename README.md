# Python Project Copier template

[Copier](https://copier.readthedocs.io/en/stable/) template for bootstrapping Python projects with:

- `uv` dependency management
- `ruff` + `basedpyright` + `codespell` lint/type checks (in generated projects)
- `pytest` and coverage gate (in generated projects)
- `pydantic-settings` configuration loading from `dev.env`
- dynamic versioning from Git tags/commits via `uv-dynamic-versioning` + Hatchling
- generated project `Makefile` with automated workflows (`make`, `make lint`, `make test`, `make build`, `make clean`)
- GitHub Actions CI workflow for lint + tests on pushes/PRs
- CLI entrypoint wiring via `[project.scripts]` and a sample `src/` package layout
- configurable Python minimum/CI versions through Copier prompts

## Create a new project

From GitHub:

```shell
uv tool install copier
copier copy gh:emepetres/python-template ./my-new-project
```

Or from a local copy of this repository:

```shell
uv tool install copier
copier copy . ../my-new-project
```

## Template layout

- `copier.yml`: Copier questions and template settings.
- `template/`: Files rendered into generated projects.
- `tests/template_copy_tests.py`: Maintainer smoke test for `copier copy`.

## Add a new template feature

When adding a feature, treat this repository as a project generator:

1. Implement the feature in `template/` as if that folder were the real project.
2. If the feature should be configurable/optional, add a new question in `copier.yml`.
3. Use Jinja variables/conditionals in template files for optional files or sections.
4. Add or update tests in `tests/template_copy_tests.py` to verify rendered behavior.
5. Run maintainer checks (`make` or lint/test/copy-check commands) before finishing.

Quick mapping:
- In a normal project you would edit `src/...`; here you edit `template/src/...`.
- In a normal project you would add runtime config directly; here you add template questions in `copier.yml` and render logic in `template/`.

## Maintain this repository

```shell
uv sync --all-extras
make lint
make test
make copy-check
```

## Update an existing generated project

Inside the generated project directory:

```shell
uv tool install copier
copier update
```
