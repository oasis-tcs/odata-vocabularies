const pandoc = require("./pandoc");
const fs = require("fs");

function directory(dir) {
  if (fs.existsSync(`${__dirname}/../${dir}`)) {
    fs.cpSync(`${__dirname}/../${dir}`, `${__dirname}/../_site/${dir}`, {
      recursive: true,
    });
    fs.readdirSync(`${__dirname}/../${dir}`)
      .filter((fn) => fn.endsWith(".md"))
      .forEach(function (filename) {
        console.log(`${dir}/${filename}`);
        pandoc(
          {
            stdin: fs.createReadStream(`${__dirname}/../${dir}/${filename}`),
            stdout: fs.createWriteStream(
              `${__dirname}/../_site/${dir}/${filename.replace(/\.md$/, ".html")}`,
            ),
            stderr: process.stderr,
          },
          {
            "-c": "../styles/style.css",
            "-M": "title=" + filename
          },
        );
      });
  }
}

fs.cpSync(`${__dirname}/../styles`, `${__dirname}/../_site/styles`, {
  recursive: true,
});
directory("docs");
directory("examples");
directory("vocabularies");
