curl -v --include --no-buffer \
--header "Connection: Upgrade" \
--header "Upgrade: websocket" \
--header "Sec-WebSocket-Version: 13" \
--header "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" \
--header "Host: localhost:8080" \
--header "Origin: http://localhost:8080" \
http://localhost:8080
