const pandoc = require("./pandoc");
const fs = require("fs");

const VOCAB = require("../package.json").name;
const REPO = process.argv[process.argv.length - 1];

function file(dir, title, filename) {
  console.log(`${dir}/${filename}`);
  pandoc(
    {
      stdin: fs.createReadStream(`${__dirname}/../${dir}/${filename}`),
      stdout: fs.createWriteStream(
        `_site/${dir}/${filename === "README.md" ? "index.html" : filename.replace(/\.md$/, ".html")}`,
      ),
    },
    {
      "-c": `/${VOCAB}/styles/style.css`,
      "-F": `${__dirname}/md2html.js`,
      "-M": `title=${REPO}${title ? " - " + title : ""}`,
      "--template": "assets/template",
    },
  );
}

function directory(dir, title) {
  if (fs.existsSync(`${__dirname}/../${dir}`)) {
    fs.cpSync(`${__dirname}/../${dir}`, `_site/${dir}`, {
      recursive: true,
    });
    fs.readdirSync(`${__dirname}/../${dir}`)
      .filter((fn) => fn.endsWith(".md"))
      .forEach(function (filename) {
        file(dir, title, filename);
      });
  }
}

fs.cpSync(`${__dirname}/../assets/styles`, `_site/styles`, {
  recursive: true,
});

file(".", "", "README.md");
directory("docs", "Documents");
directory("examples", "Examples");
directory("vocabularies", "Vocabularies");
