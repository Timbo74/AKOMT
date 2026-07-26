# Remote Desktop Services

## Troubleshooting

### Remove Missing RDS Hosts


Install SSMS

Connect to the database (This is the Internal Database of the RDCB).
```
\.\pipe\MICROSOFT##WID\tsql\query
```

First, view the RD Session host servers that RDCB has in the database.

```SQL
Select Top 10 [ServerID], [RdcbConfigId],[poolId] From [RDCms].[rds].[RoleRdsh]
```

This should give the Server ID, name, and the Roles that they are playing.

Delete the unnecessary server with this command.

```SQL
use RDCms
delete from rds.RoleRdsh where ServerId = ‘ServerIDHere ’
```

That should get rid of the server from the roles list.

After that, execute this to delete the server for good from the database

```SQL
DELETE [RDCms].[rds].[Server] WHERE ID = ServerIDHere;
```
