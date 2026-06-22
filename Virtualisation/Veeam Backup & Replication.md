# Veeam Backup & Replication

## Troubleshooting:

### Unable to connect to ADMIN$ on Host in Workgroup

1. Open Registry Editor: Click the Start menu, type ```regedit```, and press Enter.

2. Navigate to the Policies System Key:

```registry
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
```

3. Create the UAC Policy:
- Right-click in the empty space on the right side and choose New > ```DWORD (32-bit) Value```.
- Name it exactly: ```LocalAccountTokenFilterPolicy```

4. Modify the Value: Double-click the newly created key, change the Value data to ```1```, and click OK.

5. Restart: Reboot your Windows 11 machine so the changes take effect.

Once the policy is applied, Veeam will be able to authenticate and push components to the ADMIN$ share using standard administrator credentials.

Reference:

- https://community.veeam.com/discussion%2Dboards%2D66/adding%2Dhyper%2Dv%2Dhost%2Dfails%2Dwith%2Dinvalid%2Dcredentials%2Dor%2Dspedified%2Dhost%2Dis%2Dnot%2Da%2Dhyper%2Dv%2Dserver%2D6537
- https://community.veeam.com/discussion-boards-66/failed-to-connect-to-admin-on-local-server-8190

