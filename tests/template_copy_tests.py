from pathlib import Path

from copier import run_copy


def test_template_copy_with_defaults(tmp_path: Path) -> None:
    template_path = Path(__file__).resolve().parents[1]
    destination = tmp_path / "generated-project"

    run_copy(src_path=str(template_path), dst_path=destination, defaults=True)

    assert (destination / ".copier-answers.yml").exists()
    assert (destination / "pyproject.toml").exists()
    assert (destination / "copier.yml").exists() is False
    assert (destination / "src" / "my_python_project" / "__init__.py").exists()
    assert (destination / "tests" / "main_tests.py").exists()

    pyproject = (destination / "pyproject.toml").read_text(encoding="utf-8")
    assert 'name = "my-python-project"' in pyproject
