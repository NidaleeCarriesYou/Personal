#!/bin/bash

# Start Pacemaker
pacemakerd -f &

# Keep the container running (this is optional if pacemaker and corosync run in the foreground)
# tail -f /dev/null
