#!/bin/bash

set -x

curl -H "Content-Type: application/json" \
-d '{"jsonrpc": "2.0", "method": "add", "params": {"first": 13, "second": 7}, "id": 42 }' \
http://localhost:3000

printf '\n'
sleep 1

curl -H "Content-Type: application/json" \
-d '{"jsonrpc": "2.0", "method": "notExist", "params": {"first": 13, "second": 7}, "id": 42 }' \
http://localhost:3000

printf '\n'
sleep 1

curl -H "Content-Type: application/json" \
-d '{"jsonrpc": "2.0", "method": "add", "params": {"first": 1, "second": 2}}' \
http://localhost:3000
