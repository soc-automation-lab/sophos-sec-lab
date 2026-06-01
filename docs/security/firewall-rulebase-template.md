# Firewall Rulebase Template

| ID | Quelle | Ziel | Dienst | NAT | Aktion | Zweck | Log | Status |
|---:|--------|------|--------|-----|--------|-------|-----|--------|
| 10 | LAN | WAN | DNS, HTTP, HTTPS | MASQ | Allow | Basis-Internet | Yes | Draft |
| 20 | LAN | DMZ | HTTP/HTTPS | No | Allow | Webserver-Test | Yes | Optional |
| 30 | DMZ | LAN | Any | No | Deny | Segmentierung | Yes | Optional |
| 90 | Any | Any | Any | No | Deny | Default-Deny | Yes | Planned |

## Änderungslogik

Jede Regel erhält:

- fachlichen Zweck
- Quell-/Zielsegment
- Dienst/Port
- NAT-Entscheidung
- Logging-Entscheidung
- Testfall
- Rollback-Hinweis
