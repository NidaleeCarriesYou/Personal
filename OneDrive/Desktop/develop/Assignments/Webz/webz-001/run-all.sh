#!/bin/bash

# Run the Corosync key setup script
/usr/local/bin/corosync-key-setup.sh
/usr/local/bin/create-html.sh

# Run the main entrypoint script

/usr/local/bin/start-coro.sh

sleep 3 

/usr/local/bin/start-pace.sh
sleep 10
/usr/local/bin/configure-crm.sh
/usr/local/bin/configure-apache.sh

tail -f /dev/null