# Convert OData 4.0x CSDL JSON or XML to Github Flavored Markdown

This script produces Markdown documentation from an OData vocabulary using [CSDL XML](http://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html) or [CSDL JSON](http://docs.oasis-open.org/odata/odata-csdl-json/v4.01/odata-csdl-json-v4.01.html) in Version 4.0 or 4.01.

It's a pure JavaScript implementation, depending only on [`odata-csdl`](https://github.com/oasis-tcs/odata-csdl-schemas/tree/main/lib), which in turn depends on [`sax js`](https://www.npmjs.com/package/sax).

_Note: this tool is only intended for documenting vocabularies, not for documenting metadata documents or annotation files._

## Installation

Clone or download this repository, go to its root folder and type

```sh
npm install
```

To install globally type

```sh
npm install -g
```

## Usage

Assuming you installed the script globally, and your vocabulary file is `MyVocabulary.xml`, then

```sh
odata-vocab2md MyVocabulary.xml
```

will create `MyVocabulary.md` next to it.

Just type

```sh
odata-vocab2md -h
```

to get usage hints

```
Usage: odata-vocab2md <options> <source files>
Options:
 -h, --help              show this info
 -t, --target            target file (default: source file base name + .md)
```

If you installed the script locally, start it via

```sh
node lib/cli.js ...
```

## Usage for OData TC vocabulary editors

To produce fresh Markdown and CSDL JSON files from all XML vocabularies in the [`/vocabularies`](../vocabularies) folder, use

```sh
npm run build
```

anywhere in this repository.

If you use [Visual Studio Code](https://code.visualstudio.com/), you can [run this script directly from the explorer](https://code.visualstudio.com/docs/getstarted/tips-and-tricks#_run-npm-scripts-as-tasks-from-the-explorer).

You should also install the recommended extension for [XML Language Support by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml). It will validate the XML files against the official [OData CDSL XML schemas](https://github.com/oasis-tcs/odata-csdl-schemas/tree/main/schemas).

## Generation of change logs

A GitHub workflow generates a file `CHANGELOG.md` from the long texts of the merge commits. If such a
text has the form

```
CHANGELOG
- All terms were deprecated
- 100 new terms were introduced
```

with CHANGELOG on the first line and arbitrary markdown on subsequent lines, the markdown will be included
in `CHANGELOG.md` under a heading that consists of the date and time of the commit.

If a commit id follows the CHANGELOG, as in

```
CHANGELOG 122dff73ef4f139e3361e5af557519c898ee81bd
- All terms were deprecated
- 100 new terms were introduced
```

this entry replaces the one from the given commit in `CHANGELOG.md`, thus allowing corrections in the changelog even
though commit texts cannot be changed afterwards.
