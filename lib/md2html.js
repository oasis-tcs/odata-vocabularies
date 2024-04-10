#!/usr/bin/env node

const filter = require("pandoc-filter");

filter.stdio(function ({ t, c }, format, meta) {
  if (t === "Link") {
    c[2][0] = c[2][0].replace(/{{(.*?)}}/g, function (m, p) {
      return meta[p]?.c || m;
    });
    if (!/^https?:\/\//.test(c[2][0]))
      c[2][0] = c[2][0].replace(/\.md(?=$|#)/, ".html");
    return filter.Link(...c);
  }
});
