#!/bin/bash

if [[ -f "./lib.sh" ]]; then
    . ./lib.sh
elif [[ -f "$(dirname "$0")/lib.sh" ]]; then
    . "$(dirname "$0")/lib.sh"
else
    echo "Error: lib.sh not found" >&2
    exit 1
fi

if [[ "$#" -ne 3 ]]; then
    die "Usage: $0 AMOUNT FROM TO" 2
fi

amount="$1"
from="${2^^}"
to="${3^^}"

if [[ ! "$amount" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    die "amount must be a valid positive number" 2
fi

if [[ ! "$from" =~ ^[A-Z]{3}$ ]] || [[ ! "$to" =~ ^[A-Z]{3}$ ]]; then
    die "Currency codes must be exactly 3 letters" 2
fi

echo "Valid inputs received: $amount $from to $to"