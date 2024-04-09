const pandoc = require("./pandoc");
const fs = require("fs");

const VOCAB = require("../package.json").name;

function file(dir, filename) {
  console.log(`${dir}/${filename}`);
  pandoc(
    {
      stdin: fs.createReadStream(`${__dirname}/../${dir}/${filename}`),
      stdout: fs.createWriteStream(
        `${__dirname}/../_site/${dir}/${filename === "README.md" ? "index.html" : filename.replace(/\.md$/, ".html")}`,
      ),
    },
    {
      "-c": `/${VOCAB}/styles/style.css`,
      "--shift-heading-level-by": "-1",
      "-F": `${__dirname}/md2html.js`,
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
        file(dir, filename);
      });
  }
}

fs.cpSync(`${__dirname}/../styles`, `${__dirname}/../_site/styles`, {
  recursive: true,
});

file(".", "README.md");
directory("docs");
directory("examples");
directory("vocabularies");
