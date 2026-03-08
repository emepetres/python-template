# python-template Copier template

Copier template for bootstrapping Python projects with:

- `uv` dependency management
- `ruff` + `basedpyright` + `codespell` lint/type checks (in generated projects)
- `pytest` and coverage gate (in generated projects)
- `pydantic-settings` configuration loading from `dev.env`

## Create a new project

```shell
uv tool install copier
copier copy . ../my-new-project
```

Or from GitHub:

```shell
copier copy gh:jcarnero/python-template ../my-new-project
```

## Template layout

- `copier.yml`: Copier questions and template settings.
- `template/`: Files rendered into generated projects.
- `tests/template_copy_tests.py`: Maintainer smoke test for `copier copy`.

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
copier update
```
