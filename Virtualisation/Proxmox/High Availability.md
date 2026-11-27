# High Availability
Common Usage and Syntax
# Enable Node Maintenance
```bash
ha-manager crm-command node-maintenance enable <node-name>
```
(Gracefully migrates or stops HA services off the specified node so you can perform updates or hardware work.)

## Disable Node Maintenance
```bash
ha-manager crm-command node-maintenance disable <node-name>
```
(Returns the node to normal operation, allowing HA resources to run on it again.)

## Disarm High Availability
```bash
ha-manager crm-command disarm-ha
```
(Temporarily stops the CRM from issuing fencing or recovery actions across the cluster.)

## Re-arm High Availability
```bash
ha-manager crm-command arm-ha
```
(Resumes standard cluster-wide HA supervision and automated recovery.)

