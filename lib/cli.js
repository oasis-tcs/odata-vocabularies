#!/usr/bin/env node
"use strict";

//console.dir(argv);

const csdl = require("odata-csdl");
const lib = require("./csdl2markdown");
const minimist = require("minimist");
const fs = require("fs");

var unknown = false;

var argv = minimist(process.argv.slice(2), {
  string: ["t", "target"],
  boolean: ["h", "help"],
  alias: {
    h: "help",
    t: "target",
  },
  unknown: (arg) => {
    if (arg.substring(0, 1) == "-") {
      console.error("Unknown option: " + arg);
      unknown = true;
      return false;
    }
  },
});

if (unknown || argv._.length == 0 || argv.h) {
  console.log(`Usage: odata-vocab2md <options> <source file>
Options:
 -h, --help     show this info
 -t, --target   target file (default: source file basename + .md)`);
} else {
  //TODO: further input parameters reserved for e.g. referenced CSDL documents
  // for (var i = 0; i < argv._.length; i++) {
  //     convert(argv._[i]);
  // }
  convert(argv._[0]);
}

function convert(source) {
  if (!fs.existsSync(source)) {
    console.error("Source file not found: " + source);
    return;
  }

  const text = fs.readFileSync(source, "utf8");
  //TODO: for JSON input use parser that produces line numbers
  const json = text.startsWith("<")
    ? csdl.xml2json(text, { strict: true, lineNumbers: true })
    : JSON.parse(text);
  if (json.$Version < "4.0") {
    console.error("Only OData Version 4.0 or greater is supported");
    return;
  }

  const target =
    argv.target ||
    (source.lastIndexOf(".") <= 0
      ? source
      : source.substring(0, source.lastIndexOf("."))) + ".md";
  console.log(target);

  const markdown = lib.csdl2markdown(source, json);

  fs.writeFileSync(target, markdown.join("\n"));
}
