# Sender Policy Framework
## Format
Type: TXT
Name: @
Value: v=spf1 ip4:1.1.1.1 ip4:2.2.2.2 -all

The `-all` qualifier represents a hard fail, meaning any mail server not explicitly authorized in your SPF record is considered unauthorized to send email on behalf of your domain.

The `~all` qualifier indicates a soft fail, where emails from unauthorized servers are usually accepted but flagged or penalized by the recipient’s mail server.

The `?all` qualifier represents a neutral policy, meaning the domain owner does not specify whether emails from unauthorized servers should be trusted.  As a result, ?all is generally not recommended for production domains.
## Common Minimal SPF Record Formats

### Single IP address (Hard Fail):
Authorizes only that specific IPv4 address and rejects everything else.
`v=spf1 ip4:192.0.2.1 -all`
### Google Workspace: 
Authorizes all servers listed by Google and rejects everything else.
`v=spf1 include:_spf.google.com -all`
### Microsoft 365: 
Authorizes Microsoft 365 mail servers and rejects everything else. 
`v=spf1 include:spf.protection.outlook.com -all`
