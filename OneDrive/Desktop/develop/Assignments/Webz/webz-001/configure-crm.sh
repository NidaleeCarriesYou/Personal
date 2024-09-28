#!/bin/bash

crm configure property stonith-enabled=false

crm configure primitive FloatingIP ocf:heartbeat:IPaddr2 \
  ip=172.18.0.100 cidr_netmask=16 nic=eth0 \
  op monitor interval=30s

crm configure location FloatingIP-prefers-webz001 FloatingIP 100: webz-001 ### Set preference for webz-001
crm configure location FloatingIP-prefers-webz002 FloatingIP 50: webz-002 ### Set failover option 1 to be webz-002
crm configure location FloatingIP-prefers-webz003 FloatingIP 49: webz-003 ### Set failover option 2 to be webz-003
crm configure property no-quorum-policy=ignore ### Make sure FloatingIP exists even if only one node is alive

crm configure rsc_defaults resource-stickiness=100 ### This ensures that the floating IP will not move back to webz-001 immediately once it's back online unless forced.