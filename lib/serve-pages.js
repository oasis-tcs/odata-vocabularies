const express = require("express");

var app = express()
  .get("/", function (req, res) {
    res.redirect("/odata-vocabularies/");
  })
  .use("/odata-vocabularies", express.static("_site"));

app.listen(8080, function () {
  console.log("Server running on http://localhost:8080");
});
