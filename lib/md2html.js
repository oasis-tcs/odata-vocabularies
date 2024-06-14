#!/usr/bin/env node

const filter = require("pandoc-filter");

filter.stdio(function ({ t, c }, format, meta) {
  if (t === "Link" && !/^https?:\/\//.test(c[2][0])) {
    if (/^Org\.OData\..*?\.xml#L/.test(c[2][0]))
      c[2][0] =
        "https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/" +
        c[2][0];
    else if (/\.xml#L/.test(c[2][0]))
      c[2][0] =
        "https://github.com/SAP/odata-vocabularies/blob/main/vocabularies/" +
        c[2][0];
    else c[2][0] = c[2][0].replace(/\.md(?=$|#)/, ".html");
    return filter.Link(...c);
  }
});
