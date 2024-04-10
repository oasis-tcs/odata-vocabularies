const assert = require("assert");
const fs = require("fs");
const pandoc = require("../lib/pandoc");
const { PassThrough } = require("stream");

describe("OASIS voc build", function () {
  it("Pandoc", function () {
    var html = "";
    pandoc(
      {
        stdin: fs.createReadStream(`${__dirname}/test-data/pandoc.md`),
        stdout: new PassThrough()
          .on("data", function (chunk) {
            html += chunk.toString();
          })
          .on("end", function () {
            assert.deepStrictEqual(
              html.split(/\r\n|\r|\n/),
              fs
                .readFileSync(`${__dirname}/test-data/pandoc.html`)
                .toString()
                .split(/\r\n|\r|\n/),
            );
          }),
      },
      {
        "-c": "style.css", 
        "-F": `${__dirname}/../lib/md2html.js`,
        "--template": "${__dirname}/../assets/template",
      },
    );
  });
});
