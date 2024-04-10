#!/usr/bin/env node

const filter = require("pandoc-filter");

filter.stdio(function ({ t, c }, format, meta) {
  if (t === "Link" && !/^https?:\/\//.test(c[2][0])) {
    c[2][0] = c[2][0].replace(/\.md(?=$|#)/, ".html");
    return filter.Link(...c);
  }
});
