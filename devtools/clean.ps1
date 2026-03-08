$ErrorActionPreference = "SilentlyContinue"

$paths = @(".coverage", ".venv", ".pytest_cache", ".ruff_cache")
foreach ($path in $paths) {
    if (Test-Path $path) {
        Remove-Item -Recurse -Force $path
    }
}

Get-ChildItem -Force -Directory -Filter *.egg-info |
    ForEach-Object { Remove-Item -Recurse -Force $_.FullName }

Get-ChildItem -Path src, tests, devtools -Recurse -Directory -Filter __pycache__ |
    ForEach-Object { Remove-Item -Recurse -Force $_.FullName }
