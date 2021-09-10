#!/bin/sh

/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
until /app/tailscale up --authkey=${TS_AUTHKEY} --hostname=${SERVER_NAME} --accept-dns=false --advertise-routes "${JUMP_TARGET}" --reset
do
    sleep 0.1
done

sh
