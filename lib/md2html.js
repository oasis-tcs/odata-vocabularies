#!/usr/bin/env node

const filter = require("pandoc-filter");

filter.stdio(function ({ t, c }, format, meta) {
  /* Links with dynamic target: Edit this page [here](--editurl) */
  if (t === "Link" && c[2][0].startsWith("--")) {
    c[2][0] = meta[c[2][0].substring(2)].c;
    return filter.Link(...c);
  }
  /* Links to other converted documents */
  if (t === "Link" && !/^https?:\/\//.test(c[2][0])) {
    c[2][0] = c[2][0].replace(/\.md(?=$|#)/, ".html");
    return filter.Link(...c);
  }
});
