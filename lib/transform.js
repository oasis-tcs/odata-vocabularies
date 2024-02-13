#!/usr/bin/env node
"use strict";

const csdl = require("odata-csdl");
const lib = require("./csdl2markdown");
const fs = require("fs");
const colors = require("colors/safe");

const vocabFolder = "./vocabularies/";
const exampleFolder = "./examples/";

const vocabs = {};

fs.readdirSync(vocabFolder)
  .filter((fn) => fn.endsWith(".xml"))
  .forEach((filename) => {
    const vocab = filename.substring(0, filename.lastIndexOf("."));
    console.log(vocab + ".json");

    const xml = fs.readFileSync(vocabFolder + filename, "utf8");
    let json;
    try {
      json = csdl.xml2json(xml, { strict: true, lineNumbers: true });
    } catch (e) {
      console.error(
        colors.red(
          `${vocabFolder + filename}:${e.parser.line}:${e.parser.column}: ${
            e.message
          }`
        )
      );
      process.exitCode = 1;
      return;
    }

    vocabs[filename] = json;

    // swap URLs of latest-version and alternate links
    const links = json[vocab]["@Core.Links"];
    const latestVersion = links.findIndex((l) => l.rel == "latest-version");
    const alternate = links.findIndex((l) => l.rel == "alternate");
    if (latestVersion != -1 && alternate != -1) {
      links[latestVersion].rel = "alternate";
      links[alternate].rel = "latest-version";
    }
    fs.writeFileSync(
      vocabFolder + vocab + ".json",
      JSON.stringify(json, omitLineNumbers, 4)
    );
  });

console.log();

for (const [filename, csdl] of Object.entries(vocabs)) {
  const vocab = filename.substring(0, filename.lastIndexOf("."));
  console.log(vocab + ".md");

  const markdown = lib.csdl2markdown(filename, csdl, vocabs);
  fs.writeFileSync(vocabFolder + vocab + ".md", markdown.join("\n"));
}

console.log();

fs.readdirSync(exampleFolder)
  .filter((fn) => fn.endsWith(".xml"))
  .forEach((xmlfile) => {
    const example = xmlfile.substring(0, xmlfile.lastIndexOf("."));
    console.log(example + ".json");

    const xml = fs.readFileSync(exampleFolder + xmlfile, "utf8");
    try {
      const json = csdl.xml2json(xml, { strict: true });
      fs.writeFileSync(
        exampleFolder + example + ".json",
        JSON.stringify(json, null, 4)
      );
    } catch (e) {
      console.error(
        colors.red(
          `${xmlfile}:${e.parser.line}:${e.parser.column}: ${e.message}`
        )
      );
      process.exitCode = 1;
    }
  });

function omitLineNumbers(key, value) {
  if (key.endsWith("@parser.line")) {
    return undefined;
  }
  return value;
}
