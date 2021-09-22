const {Transform} = require("stream");

var entry;

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
		if (line.startsWith("commit")) {
			if (entry && entry.length > 2) this.push(entry.join(""));
			entry = undefined;
		} else if (line.startsWith("Date:"))
			entry = [line + "\n"];
		else if (entry && /^\s+\S/.test(line)) {
			if (entry.length === 1) entry.push("");
			else entry.push(line + "\n");
		}
	})
	.on("end", function() {
		if (entry && entry.length > 2) process.stdout.write(entry.join(""));
	})
).pipe(process.stdout);
