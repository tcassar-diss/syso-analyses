#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo "[ERROR] Please run as root"
    exit 1
fi

if [[ ! -x "$(command -v redis-server)" ]]; then
    echo "[ERROR] redis-server not installed"
    exit 1
fi

if [[ ! -x "$(command -v redis-benchmark)" ]]; then
    echo "[ERROR] redis-benchmark not installed"
    exit 1
fi

if [[ ! -x "$(command -v syso)" ]]; then
    echo "[ERROR] syso not installed"
    exit 1
fi

echo "[INFO] Dependences OK!"

syso redis-server --protected-mode no &
spid=$!

if [[ $? -ne 0 ]]; then
    echo "[ERROR] syso redis-server failed to start"
fi;

echo "[INFO] Launched syso"
echo "[INFO] Waiting for redis-server to start"

until redis-cli ping; do
    sleep 0.01
done

echo "[INFO] Starting benchmark"

redis-benchmark

redis-cli shutdown

kill $spid
