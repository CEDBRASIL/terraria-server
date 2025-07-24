#!/bin/sh
set -e

DATA_DIR="/root/.local/share/Terraria"
WORLD_DIR="$DATA_DIR/Worlds"
WORLD_NAME="${WORLD_NAME:-TerrariaWorld}"
WORLD_FILE="$WORLD_DIR/${WORLD_NAME}.wld"

mkdir -p "$WORLD_DIR"

PORT="${PORT:-7777}"
PLAYERS="${PLAYERS:-16}"

exec mono --server --gc=sgen -O=all TerrariaServer.exe \
    -configpath "$DATA_DIR" \
    -worldpath "$WORLD_DIR" \
    -logpath "$DATA_DIR" \
    -world "$WORLD_FILE" \
    -autocreate 3 \
    -seed banana \
    -worldname "$WORLD_NAME" \
    -worldevil crimson \
    -difficulty 3 \
    -port "$PORT" \
    -players "$PLAYERS" \
    -pass ""
