Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectRoot = "C:\secops-labs\sophos-sec-lab"

Write-Host "Creating project structure: $ProjectRoot" -ForegroundColor Cyan
New-Item -ItemType Directory -Path $ProjectRoot -Force | Out-Null
Set-Location $ProjectRoot

$Directories = @(
  "docs\architecture",
  "docs\security",
  "docs\operations",
  "runbooks",
  "scripts\powershell",
  "evidence\cli-outputs",
  "evidence\local-private"
)

foreach ($Directory in $Directories) {
  New-Item -ItemType Directory -Path $Directory -Force | Out-Null
}

if (-not (Test-Path ".git")) {
  git init
}

Write-Host "Project initialized. Review README and commit initial documentation." -ForegroundColor Green
