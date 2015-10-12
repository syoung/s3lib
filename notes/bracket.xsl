bracket


<entry [Tue 2013:12:03 15:13:31 EST] DOWNLOADED AND INSTALLED BRACKED WITH THESEUS node.js PLUGIN>

https://github.com/adobe-research/theseus

Theseus is a new type of JavaScript debugger for Node.js, Chrome, and both simultaneously. It is an extension for the Brackets code editor.

Theseus is part of a collaboration between the User Interface Design Group at MIT CSAIL and Adobe Research. Though it's a research project, I'm doing the best I can engineering-wise and I'm responsive to bug reports and feature requests. Patches welcome!

Screenshot of Theseus

Features

Real-time code coverage: Theseus shows the number of times that every function has been called next to its definition. Functions that have never been called are also given a gray background. You can watch the code light up as you interact with the web page.

Screenshot of call counts and dead code coloring

Retroactive inspection: Click a call count to see the values of parameters, return values, and any exceptions that have been thrown from that function. It's like adding console.log without having to save and reload.

Screenshot of a single function being logged

Asynchronous call tree: If you click multiple call counts, all invocations of those functions are shown in a tree. When callback functions are called, they show up in the tree under the function that created them, regardless of whether they were called immediately or many ticks later.

Screenshot of multiple functions being logged

Install

Install Brackets Sprint 28 or later.
In Brackets, click the menu item File > Extension Manager...
Go to the "Available" tab of the dialog that appears.
Type "Theseus" in the search box.
Click the "Install" button in the search result for Theseus.
For Node.js support, also run npm install -g node-theseus in a terminal to get the command-line helper. Theseus requires node-theseus 0.2.x.

Usage: Debug JavaScript running in Node.js

Brackets + Node.js

Start your program by running node-theseus app.js (instead of node app.js as you normally would). Theseus will automatically connect to that process.

(You install node-theseus with npm install -g node-theseus)

Usage: Debug JavaScript running in Chrome

Brackets + Chrome

Open the File menu and put Theseus into the mode for static HTML files:

Brackets + Chrome

Then open an HTML file and start Brackets' Live Development mode by clicking the lightning bolt in the top right corner of the window:

Brackets' lightning bolt

Your page will open in Chrome.

A Handful of Technical Details

Node.js: Files with paths containing node_modules will not be instrumented.

Chrome: Files requested with the URL parameter theseus=no (for example, < script src="script.js?theseus=no" />) will not be instrumented.

Any file containing the (exact) string /*theseus instrument: false */ will not be instrumented by Theseus. You can also use the --theseus-exclude=filename option with node-theseus (which also has some other options that you might find helpful).

Bugs

First, there's a whole wiki page about troubleshooting Theseus. Check it out!

If you come across a bug, submit an issue on GitHub. Include a list of steps we can follow to reproduce the problem, a description of what you saw that seemed broken, and a description of what you expected to see.

Mailing List

Announcements and discussion: https://groups.google.com/d/forum/theseus-discuss

License

Theseus is released under the MIT license.
Status API Training Shop Blog About © 2013 GitHub, Inc. Terms Privacy Security Contact 
	
</entry>