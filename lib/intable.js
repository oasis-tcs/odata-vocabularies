const { spawn } = require("child_process");
const { createInterface } = require("readline");
const escape = require("escape-html");

var html = "";
var pandoc = spawn("pandoc", [
  "-f",
  "gfm+tex_math_dollars",
  "-t",
  "html",
  "--mathjax",
]);
pandoc.stdout
  .on("data", function (chunk) {
    html += chunk.toString();
  })
  .on("end", function () {
    process.stdout.end(escape(html));
    process.exit(0);
  });
createInterface({ input: process.stdin }).on("line", function (line) {
  if (line === "\x1A") pandoc.stdin.end();
  else pandoc.stdin.write(line + "\n");
});
