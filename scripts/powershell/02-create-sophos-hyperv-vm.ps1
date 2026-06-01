param(
  [string]$VmName = "vm-sophos-fw-01",
  [string]$VmPath = "C:\Hyper-V\sophos-sec-lab",
  [string]$PrimaryDiskPath,
  [string]$AuxiliaryDiskPath,
  [string]$WanSwitchName = "vSwitch-sophos-wan-nat",
  [string]$LanSwitchName = "vSwitch-sophos-lan",
  [int64]$MemoryStartupBytes = 6GB,
  [int]$ProcessorCount = 2
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Run in Windows PowerShell as Administrator.
# PrimaryDiskPath should point to Sophos PRIMARY-DISK.vhd.
# AuxiliaryDiskPath should point to Sophos AUXILIARY-DISK.vhd.

$IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $IsAdmin) {
  throw "Please run this script in Windows PowerShell as Administrator."
}

if ([string]::IsNullOrWhiteSpace($PrimaryDiskPath)) {
  throw "PrimaryDiskPath is required."
}

if ([string]::IsNullOrWhiteSpace($AuxiliaryDiskPath)) {
  throw "AuxiliaryDiskPath is required."
}

if (-not (Test-Path $PrimaryDiskPath)) {
  throw "Primary disk not found: $PrimaryDiskPath"
}

if (-not (Test-Path $AuxiliaryDiskPath)) {
  throw "Auxiliary disk not found: $AuxiliaryDiskPath"
}

if (Get-VM -Name $VmName -ErrorAction SilentlyContinue) {
  throw "VM already exists: $VmName. Stop here and review before changing it."
}

New-Item -ItemType Directory -Path $VmPath -Force | Out-Null

New-VM `
  -Name $VmName `
  -Generation 1 `
  -MemoryStartupBytes $MemoryStartupBytes `
  -VHDPath $PrimaryDiskPath `
  -Path $VmPath `
  -SwitchName $WanSwitchName | Out-Null

Set-VMProcessor -VMName $VmName -Count $ProcessorCount
Set-VM -Name $VmName -AutomaticCheckpointsEnabled $false
Set-VMMemory -VMName $VmName -DynamicMemoryEnabled $false

$FirstNic = Get-VMNetworkAdapter -VMName $VmName | Select-Object -First 1
Rename-VMNetworkAdapter -VMName $VmName -Name $FirstNic.Name -NewName "WAN"

Add-VMNetworkAdapter -VMName $VmName -Name "LAN" -SwitchName $LanSwitchName
Add-VMHardDiskDrive -VMName $VmName -ControllerType SCSI -Path $AuxiliaryDiskPath

Write-Host "Sophos VM skeleton created. Start it only after reviewing network mapping." -ForegroundColor Green
Get-VM -Name $VmName | Format-Table Name, State, Generation, ProcessorCount, MemoryStartup -AutoSize
Get-VMNetworkAdapter -VMName $VmName | Format-Table Name, SwitchName, MacAddress -AutoSize
Get-VMHardDiskDrive -VMName $VmName | Format-Table VMName, ControllerType, Path -AutoSize
