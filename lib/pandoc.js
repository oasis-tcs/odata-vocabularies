const { spawn } = require("child_process");

function pandoc({ stdin, stdout }, options = {}) {
  var mermaidOptions = { startOnLoad: false, ...options.mermaid };
  delete options.mermaid;
  var opts = [
    "-f",
    "gfm+tex_math_dollars",
    "-t",
    "html",
    "--mathjax",
    "-s",
    "--eol=lf",
    "--wrap=none",
    "-V",
    `include-script=<script type="module">
	document.addEventListener("DOMContentLoaded", function() {
		document.querySelectorAll(".mermaid").forEach(function(pre) {
			pre.style.width = pre.getClientRects()[0].width + "px";
		});
	});
	import mermaid from "https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs";
	mermaid.initialize(${JSON.stringify(mermaidOptions)});
	mermaid.run({nodes: document.querySelectorAll(".mermaid code")});
</script>`,
  ];
  for (var param in options)
    [].concat(options[param]).forEach(function (value) {
      if (value && param.startsWith("--")) opts.push(param + "=" + value);
      else if (value && param.startsWith("-")) opts.push(param, value);
      else opts.push(param);
    });
  var proc = spawn("pandoc", opts);
  proc.stderr.on("data", function (err) {
    console.error(err.toString());
  });
  proc.stdout.pipe(stdout);
  stdin.on("error", console.error).pipe(proc.stdin);
}

module.exports = pandoc;
