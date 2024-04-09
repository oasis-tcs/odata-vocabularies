const pandoc = require("./pandoc");
const fs = require("fs");

const VOCAB = require("../package.json").name;

function file(dir, source, target) {
  console.log(`${dir}/${source}`);
  pandoc(
    {
      stdin: fs.createReadStream(`${__dirname}/../${dir}/${source}`),
      stdout: fs.createWriteStream(`${__dirname}/../_site/${dir}/${target}`),
    },
    {
      "-c": `${VOCAB}/styles/style.css`,
      "--shift-heading-level-by": "-1",
    },
  );
}

function directory(dir) {
  if (fs.existsSync(`${__dirname}/../${dir}`)) {
    fs.cpSync(`${__dirname}/../${dir}`, `${__dirname}/../_site/${dir}`, {
      recursive: true,
    });
    fs.readdirSync(`${__dirname}/../${dir}`)
      .filter((fn) => fn.endsWith(".md"))
      .forEach(function (filename) {
        file(dir, filename, filename.replace(/\.md$/, ".html"));
      });
  }
}

fs.cpSync(`${__dirname}/../styles`, `${__dirname}/../_site/styles`, {
  recursive: true,
});

file(".", "README.md", "index.html");
directory("docs");
directory("examples");
directory("vocabularies");
