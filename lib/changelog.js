const changelog = require("conventional-changelog-core");
const fs = require("fs");
const path = require("path");
const commitPartial = fs.readFileSync(path.resolve(require.resolve("conventional-changelog-writer"), "../templates/commit.hbs"))
	.toString()
	.replace("* {{header}}", "### {{committerDate}}")
	+ "{{header}}\n\n";

changelog(undefined, undefined, undefined, {
	noteKeywords: ["CHANGELOG"]
}, {
	commitsSort: function(a, b) {
		if (a.committerDate < b.committerDate) return 1;
		if (a.committerDate > b.committerDate) return -1;
		return 0;
	},
	transform: function(commit, context) {
		if (commit.notes.length === 1) {
			commit.header = commit.notes[0].text;
			commit.footer = null;
			commit.notes = [];
			return commit;
		}
	},
	commitPartial
})
.pipe(process.stdout);
