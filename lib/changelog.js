const changelog = require("conventional-changelog-core");
const fs = require("fs");
const commitPartial = fs.readFileSync(require.resolve("conventional-changelog-writer/templates/commit.hbs"))
	.toString()
	.replace("* {{header}}", "### {{committerDate}}")
	+ "{{header}}\n\n";

var amended = new Map();

changelog({
	transform: function(commit, cb) {
		if (typeof commit.gitTags === "string") {
			var match = /tag:\s*[v=]?(.+?)[,)]/gi.exec(commit.gitTags);
			if (match) commit.version = match[1]
		}
		cb(null, commit)
	}
}, undefined, undefined, {
	noteKeywords: ["CHANGELOG", "AMENDS"]
}, {
	commitsSort: null,
	transform: function(commit, context) {
		var amend = commit.notes.find(_ => _.title === "AMENDS");
		if (amend) amended.set(amend.text, true);
		if (!amended.get(commit.hash)) {
			var header = commit.notes.find(_ => _.title === "CHANGELOG");
			if (header) {
				commit.header = header.text;
				commit.footer = null;
				commit.notes = [];
				return commit;
			}
		}
	},
	commitPartial
})
.pipe(process.stdout);
