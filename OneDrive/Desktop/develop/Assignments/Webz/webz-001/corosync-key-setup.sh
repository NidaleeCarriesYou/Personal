#!/bin/bash

Generate Corosync key if not already generated
if [ ! -f /etc/corosync/authkey ]; then
    echo "Generating Corosync authentication key..."
    corosync-keygen
else
    echo "Corosync key already exists, skipping generation."
fi

sleep 3
# Get the container IDs for webz-002 and webz-003
WEBZ002_ID=$(docker ps -qf "name=webz-002")
WEBZ003_ID=$(docker ps -qf "name=webz-003")

# Check if the containers are running and copy the key if they are
if [ -n "$WEBZ002_ID" ] && [ -n "$WEBZ003_ID" ]; then
    echo "Copying the Corosync key to webz-002 and webz-003..."
    
    docker cp /etc/corosync/authkey $WEBZ002_ID:/etc/corosync/authkey
    echo "Key copied to webz-002."
    
    docker cp /etc/corosync/authkey $WEBZ003_ID:/etc/corosync/authkey
    echo "Key copied to webz-003."
else
    echo "One or both containers (webz-002, webz-003) are not running."
fi

echo "Corosync key distribution complete."

