Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Run in Windows PowerShell as Administrator.

$WanSwitchName = "vSwitch-sophos-wan-nat"
$LanSwitchName = "vSwitch-sophos-lan"
$DmzSwitchName = "vSwitch-sophos-dmz"
$NatName       = "nat-sophos-wan-lab"

$WanHostIp     = "172.30.10.1"
$WanPrefix     = 24
$WanNatPrefix  = "172.30.10.0/24"

$LanHostIp     = "10.10.10.254"
$LanPrefix     = 24

$DmzHostIp     = "10.10.20.254"
$DmzPrefix     = 24

$IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $IsAdmin) {
  throw "Please run this script in Windows PowerShell as Administrator."
}

Write-Host "Creating Hyper-V switches for Sophos lab" -ForegroundColor Cyan

if (-not (Get-VMSwitch -Name $WanSwitchName -ErrorAction SilentlyContinue)) {
  New-VMSwitch -Name $WanSwitchName -SwitchType Internal | Out-Null
}

if (-not (Get-VMSwitch -Name $LanSwitchName -ErrorAction SilentlyContinue)) {
  New-VMSwitch -Name $LanSwitchName -SwitchType Internal | Out-Null
}

if (-not (Get-VMSwitch -Name $DmzSwitchName -ErrorAction SilentlyContinue)) {
  New-VMSwitch -Name $DmzSwitchName -SwitchType Internal | Out-Null
}

$WanAlias = "vEthernet ($WanSwitchName)"
$LanAlias = "vEthernet ($LanSwitchName)"
$DmzAlias = "vEthernet ($DmzSwitchName)"

if (-not (Get-NetIPAddress -InterfaceAlias $WanAlias -IPAddress $WanHostIp -ErrorAction SilentlyContinue)) {
  New-NetIPAddress -InterfaceAlias $WanAlias -IPAddress $WanHostIp -PrefixLength $WanPrefix | Out-Null
}

if (-not (Get-NetIPAddress -InterfaceAlias $LanAlias -IPAddress $LanHostIp -ErrorAction SilentlyContinue)) {
  New-NetIPAddress -InterfaceAlias $LanAlias -IPAddress $LanHostIp -PrefixLength $LanPrefix | Out-Null
}

if (-not (Get-NetIPAddress -InterfaceAlias $DmzAlias -IPAddress $DmzHostIp -ErrorAction SilentlyContinue)) {
  New-NetIPAddress -InterfaceAlias $DmzAlias -IPAddress $DmzHostIp -PrefixLength $DmzPrefix | Out-Null
}

if (-not (Get-NetNat -Name $NatName -ErrorAction SilentlyContinue)) {
  New-NetNat -Name $NatName -InternalIPInterfaceAddressPrefix $WanNatPrefix | Out-Null
}

Write-Host "Hyper-V switches and WinNAT are ready." -ForegroundColor Green
Get-VMSwitch | Where-Object { $_.Name -like "vSwitch-sophos-*" } | Format-Table Name, SwitchType, NetAdapterInterfaceDescription -AutoSize
Get-NetNat -Name $NatName | Format-Table Name, InternalIPInterfaceAddressPrefix -AutoSize
