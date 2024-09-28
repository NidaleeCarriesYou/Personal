#!/bin/bash

sleep 5
# Start Corosync
corosync -f &

# Keep the container running (this is optional if pacemaker and corosync run in the foreground)

