# Use Case UC-11: DNS Architecture with Internal Resolver

## Purpose

This conceptual-operational use case documents why enterprise clients typically use an internal DNS resolver instead of directly using public DNS resolvers.

## Operational Scenario

Clients must resolve both public internet names and internal names such as domain controllers, file servers, application servers and private service records.

## Recommended Enterprise Pattern

`	ext
Client
  -> Internal DNS resolver
      -> Internal zones and conditional forwarders
      -> Approved upstream resolver for public names
`",
  ",
  

| Requirement | Reason |
|---|---|
| Active Directory | Domain controllers, Kerberos, LDAP and GPO require internal DNS records |
| Internal applications | Private hostnames are not resolvable through public DNS |
| Split DNS | Same name can resolve differently internally and externally |
| Logging and control | DNS queries can be monitored and filtered centrally |
| VPN and branch access | Remote clients need consistent internal name resolution |
| Security policy | Direct public DNS can bypass internal controls |

## Lab Interpretation

The current lab uses the Sophos Firewall with public upstream DNS resolvers. This is acceptable for a small internet access lab, but an enterprise design would normally introduce an internal DNS server or resolver.

## Future Practical Implementation

A practical implementation could add a Windows Server or Linux DNS VM and configure clients to use the internal resolver while the resolver forwards public queries upstream.

## Result

The internal DNS architecture is documented as a realistic enterprise network design requirement.
