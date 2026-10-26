# Start the local preview server, creating the venv on first run.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Test-Path ".venv")) {
    python -m venv .venv
    .\.venv\Scripts\python -m pip install zensical
}

.\.venv\Scripts\zensical serve @args
