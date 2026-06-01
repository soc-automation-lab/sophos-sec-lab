Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectRoot = "C:\secops-labs\sophos-sec-lab"
$EvidenceDir = Join-Path $ProjectRoot "evidence\cli-outputs"
New-Item -ItemType Directory -Path $EvidenceDir -Force | Out-Null

Set-Location $ProjectRoot

Get-VMSwitch |
  Where-Object { $_.Name -like "vSwitch-sophos-*" } |
  Format-Table Name, SwitchType, NetAdapterInterfaceDescription -AutoSize |
  Out-String |
  Set-Content -Path (Join-Path $EvidenceDir "hyperv-switches.txt") -Encoding utf8

Get-NetNat |
  Where-Object { $_.Name -like "nat-sophos-*" } |
  Format-Table Name, InternalIPInterfaceAddressPrefix -AutoSize |
  Out-String |
  Set-Content -Path (Join-Path $EvidenceDir "hyperv-nat.txt") -Encoding utf8

Get-VM |
  Where-Object { $_.Name -like "vm-sophos*" -or $_.Name -like "vm-win*" -or $_.Name -like "vm-ubuntu*" } |
  Format-Table Name, State, CPUUsage, MemoryAssigned, Uptime -AutoSize |
  Out-String |
  Set-Content -Path (Join-Path $EvidenceDir "hyperv-vms.txt") -Encoding utf8

Write-Host "Evidence collected in $EvidenceDir" -ForegroundColor Green
