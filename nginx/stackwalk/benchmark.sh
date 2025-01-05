#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo "[ERROR] Please run as root"
    exit 1
fi

if [[ ! -x "$(command -v nginx)" ]]; then
    echo "[ERROR] nginx not installed"
    exit 1
fi

if [[ ! -x "$(command -v wrk)" ]]; then
    echo "[ERROR] wrk not installed"
    exit 1
fi

if [[ ! -x "$(command -v syso)" ]]; then
    echo "[ERROR] syso not installed"
    exit 1
fi

echo "[INFO] Dependences OK!"

systemctl stop nginx

syso nginx -g "daemon-off;"
spid=$!

if [[ $? -ne 0 ]]; then
    echo "[ERROR] syso nginx failed to start"
fi;

echo "[INFO] Launched syso"
echo "[INFO] Waiting for wrk to start"

until curl http://localhost | grep nginx 2>/dev/null ; do
    sleep 0.01
done

echo "[INFO] Starting benchmark"

wrk -t12 -c400 -d30s http://localhost

kill $spid

systemctl start nginx

