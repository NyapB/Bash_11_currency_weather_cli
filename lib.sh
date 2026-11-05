#!/bin/bash

die() {
    local msg="$1"
    local code="${2:-}"
    echo "Error: $msg">&2
    exit "$code"
}

fetch_json() {
    local url="$1"
    curl -fsS --max-time 10 "$url" || die "Network connection failed or timed out" 1
}