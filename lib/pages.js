const pandoc = require("./pandoc");
const fs = require("fs");

const PKG = require("../package.json");
const GITHUB_REPO = PKG.repository.url.match(/^git\+(.*?)\.git$/)[1];
const REPO = process.argv[process.argv.length - 1];

function file(dir, title, filename) {
  console.log(`${dir}/${filename}`);
  pandoc(
    {
      stdin: fs.createReadStream(`${dir}/${filename}`),
      stdout: fs.createWriteStream(
        `_site/${dir}/${filename === "README.md" ? "index.html" : filename.replace(/\.md$/, ".html")}`,
      ),
    },
    {
      "-c": `/${PKG.name}/styles/style.css`,
      "-F": `${__dirname}/md2html.js`,
      "-M": `title=${REPO}${title ? " - " + title : ""}`,
      "-V": [`github-repo=${GITHUB_REPO}`, `github-path=${dir}/${filename}`],
      "--template": "assets/template",
    },
  );
}

function directory(dir, title) {
  if (fs.existsSync(dir)) {
    if (dir !== ".")
      fs.cpSync(`${dir}`, `_site/${dir}`, {
        recursive: true,
      });
    fs.readdirSync(dir)
      .filter((fn) => fn.endsWith(".md"))
      .forEach(function (filename) {
        file(dir, title, filename);
      });
  }
}

fs.cpSync(`${__dirname}/../assets/styles`, `_site/styles`, {
  recursive: true,
});

directory(".", "");
directory("docs", "Documents");
directory("examples", "Examples");
directory("vocabularies", "Vocabularies");
