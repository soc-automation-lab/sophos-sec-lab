# Runbook - Connectivity Tests

## Host

```powershell
Test-NetConnection 10.10.10.1 -Port 4444
```

## Windows Client

```powershell
ipconfig /all
ping 10.10.10.1
Resolve-DnsName sophos.com
Test-NetConnection sophos.com -Port 443
```

## Ubuntu Server

```bash
ip a
ip route
ping -c 4 10.10.10.1
curl -I https://www.sophos.com
```
