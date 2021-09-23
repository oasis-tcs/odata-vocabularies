const {Transform} = require("stream");

var entry, blockedEntry;
var blocked = new Map();

function nextLine(t) {
	var offset = t.buffer.indexOf("\n");
	if (offset >= 0) {
		var o = offset;
		if (t.buffer[o - 1] === 13) o--;  // drop carriage-return before line-feed
		t.emit("line", t.buffer.toString("utf8", 0, o));
		t.buffer = t.buffer.slice(offset + 1);
		process.nextTick(nextLine, t);
	} else
		t.callback();
}

process.stdin.pipe(
	new Transform({
		transform(chunk, encoding, callback) {
			this.buffer = this.buffer ?
				Buffer.concat([this.buffer, chunk], this.buffer.length + chunk.length) :
				Buffer.from(chunk);
			this.callback = callback;
			nextLine(this);
		},
		flush(callback) {
			if (this.buffer && this.buffer.length > 0)  // add line-feed to final line
				this._transform(Buffer.from("\n"), undefined, callback);
			else
				callback();
		}
	})
	.on("line", function(line) {
		if (/^commit\s+([0-9a-f]*)/.test(line)) {
			if (entry && entry.length > 2 && !blockedEntry) this.push(entry.join(""));
			blockedEntry = blocked.get(RegExp.$1);
			entry = undefined;
		} else if (/^Date:\s+(.*)$/.test(line))
			entry = ["# " + RegExp.$1 + "\n"];
		else if (entry && /^\s+\S/.test(line)) {
			if (entry.length === 1)
				entry.push("");
			else if (entry.length === 2) {
				if (!/^\s+CHANGELOG(\s+([0-9a-f]*))?\s*$/.test(line))
					entry = undefined;
				else {
					if (RegExp.$2) blocked.set(RegExp.$2, true);
					entry.push("");
				}
			} else
				entry.push(line.replace(/^\s*/, "") + "\n");
		}
	})
	.on("end", function() {
		if (entry && entry.length > 2 && !blockedEntry) process.stdout.write(entry.join(""));
	})
).pipe(process.stdout);
