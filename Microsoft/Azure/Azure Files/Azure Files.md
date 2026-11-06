## Troubleshooting
Run `dsregcmd /status` the result should show `SSO State \ CloudTgt: YES`, if not then the `Cloud Kerberos Ticket Retrieval Enabled` setting must be enabled.

Drive drops out after VPN or sleep then a KDC proxy policy must be configured.
### Error 1327
A conditional access (CA) policy is blocking access to the Storage App Registration, it needs to be excluded in all CA policies that require MFA access.
## Reference
https://www.youtube.com/watch?v=eqzwxKPXUpg&t=24s