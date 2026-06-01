Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"

$SophosLanIp = "10.10.10.1"
$SophosWebAdminPort = 4444

Write-Host "Testing Sophos LAN reachability" -ForegroundColor Cyan
Test-NetConnection $SophosLanIp -Port $SophosWebAdminPort

Write-Host "Testing general internet DNS/HTTPS from host" -ForegroundColor Cyan
Resolve-DnsName sophos.com
Test-NetConnection sophos.com -Port 443
