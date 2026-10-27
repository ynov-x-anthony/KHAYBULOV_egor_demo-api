const http = require('http');
const PORT = process.env.PORT || 3001;

const server = http.createServer((req, res) => {
    // Route de santé
    if (req.url === '/health' && req.method === 'GET') {
        res.writeHead(200, { 'Content-Type': 'application/json' });
        return res.end(JSON.stringify({ status: "UP" }));
    }

    // Route de notification
    if (req.url === '/notify' && req.method === 'POST') {
        let body = '';
        req.on('data', chunk => { body += chunk.toString(); });
        req.on('end', () => {
            console.log(`[NOTIFIER RECEIVE] Notification payload: ${body}`);
            res.writeHead(200, { 'Content-Type': 'application/json' });
            res.end(JSON.stringify({ message: "Notification logged" }));
        });
        return;
    }

    res.writeHead(404);
    res.end();
});

server.listen(PORT, () => {
    console.log(`Notifier service listening on port ${PORT}`);
});
