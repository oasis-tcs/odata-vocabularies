#!/usr/bin/env node

const filter = require("pandoc-filter");

var vocab;

filter.stdio(function ({ t, c }, format, meta) {
  var m;
  if (
    t === "RawInline" &&
    (m = c[1].match(/^<a name="(.*?)Vocabulary" href="#\1Vocabulary">$/))
  )
    vocab = m[1];
  else if (t === "RawInline" && (m = c[1].match(/^<a name="(.*?)">$/))) {
    c[1] = `<a name="${vocab}-${m[1]}">`;
    return filter.RawInline(...c);
  } else if (t === "Link" && !/^https?:\/\//.test(c[2][0])) {
    if (c[2][0].startsWith("#"))
      c[2][0] = "#" + (vocab ? vocab + "-" : "") + c[2][0].substring(1);
    else if ((m = c[2][0].match(/^Org\.OData\.(.*?)\.V1\.md#/)))
      c[2][0] = `#${m[1]}-${c[2][0].substring(m[0].length)}`;
    else
      c[2][0] =
        "https://oasis-tcs.github.io/odata-vocabularies/vocabularies/" +
        c[2][0];
    return filter.Link(...c);
  }
});
