const http = require("http");
const server = http.createServer((err, res, body) => {});
const PORT = 4000;
server.on("request", (req, res) => {
  res.end(JSON.parse({ hello: "njn", bbhjbjhbhjbhbhj: "iui" }));
});
server.listen(PORT, () => {});

function hhbbvh() {
  console.log("Hello People");
}
