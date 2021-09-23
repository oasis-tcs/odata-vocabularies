const assert = require("assert");
const { spawn } = require("child_process");
const fs = require("fs");

describe("Changelog", function () {
  it("Convert git log to changelog", function () {
    var markdown = "";
    var proc = spawn("node", ["lib/changelog"], { cwd: __dirname + "/.." });
    proc.stdout
      .on("data", function (chunk) {
        markdown += chunk;
      })
      .on("end", function () {
        assert.deepStrictEqual(markdown.split("\n"), [
          "# Thu Sep 16 17:19:02 2021 +0200",
          "- All terms were deprecated",
          "- 100 new terms were introduced",
          "# Thu Sep 16 17:19:01 2021 +0200",
          "New vocabulary",
          "",
        ]);
        process.exit(0);
      });
    fs.createReadStream("test/gitlog.txt").pipe(proc.stdin);
  });
});
