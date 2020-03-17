const WebSocket = require('ws');

const ws = new WebSocket('ws://localhost:8080/');

ws.on('open', async function open() {
  for (var i = 0; i < 3; i++) {
    ws.send('Hello from js client [' + i + ']');
    await new Promise(r => setTimeout(r, 1000));
  }
  ws.close(1000)
});

ws.on('message', function incoming(data) {
  console.log('recv: ' + data);
});
