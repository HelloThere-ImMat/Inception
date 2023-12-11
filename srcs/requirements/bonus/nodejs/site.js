const http = require('http')
const fs = require('fs')
const axios = require('axios');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'content-type': 'text/html' })
  fs.createReadStream('index.html').pipe(res)
})


server.listen(process.env.PORT || 8000)
