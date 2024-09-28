#!/bin/bash


# Run the main entrypoint script

/usr/local/bin/start-coro.sh

sleep 3 

/usr/local/bin/start-pace.sh
/usr/local/bin/create-html.sh
/usr/local/bin/configure-apache.sh

tail -f /dev/null