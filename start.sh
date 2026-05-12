#!/bin/bash
warp-svc &
sleep 5
warp-cli --accept-tos connector new $TOKEN
warp-cli --accept-tos connect
tail -f /dev/null
