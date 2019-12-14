GenDocs+ v0.1-alpha (A fork of GenDocs v3.0-alpha003)
=====================================================

Introduction
------------

GenDocs is a utility for easily creating documentation for AutoHotkey libraries. It was created by **fincs** and the original repository can be found [here](https://github.com/fincs/GenDocs). 

GenDocs+ is a fork of GenDocs which will hopefully add some additional features to make documentation of AutoHotKey libraries even easier and more convenient. It is intended to expand on the great work done by **fincs**.

Original Features (by **fincs**)
--------------------------------

- Functions
- Pages
- Classes
	+ Constructors
	+ Methods
	+ Properties
	+ Inner classes

Added Features (Ongoing)
------------------------

- [ ] Better documentation of syntax that GenDocs expects
- [ ] Ability to parse specified `#Include`ed files 
- [ ] Choice of destination folder for the generated documentation files

Syntax/Usage
------------

For usage, see [usage.md].

For a full syntax example, see [/Demo/TestLib.ahk] and the other files in `/Demo`.

GenDocs-flavored Markdown
-------------------------

GenDocs uses a stripped down version of Markdown, which supports:

- **Paragraphs**: blocks of text delimited by blank lines. Equivalent to HTML `<p>...</p>`.
- **In-paragraph line breaks**: end a line with two spaces. Equivalent to HTML `<br/>`.
- **Headings**: start a line with up to three hash (`#`) characters, followed by space. Equivalent to HTML `<hN>...</hN>`.
- **Emphasis marks**: \*...\*. Equivalent to HTML `<em>...</em>`.
- **Strong emphasis marks**: \*\*...\*\*. Equivalent to HTML `<strong>...</strong>`.
- **Inline code marks**: \`...\`. Equivalent to HTML `<code>...</code>`.
- **Code sections**: *unlike standard Markdown*, they use the blockquote syntax: blocks of text whose lines start with > followed by a space.
- **Unordered lists**: lines that start with \*. Equivalent to HTML `<ul>...<li>...</li>...</ul>`.
- **Ordered lists**: lines that start with a number, dot and space (e.g. `1. `); or letter, dot and space (e.g. `a. `). Equivalent to HTML `<ol>...</ol>` and `<ol style="list-style-type: lower-alpha">...</ol>` respectively.
- **Escape sequences**: the sequences \\\*, \\\`, \\\[, \\\], \\\! and \\\\ are recognized, and yield literal characters.
- **Links**: `[Link text](Link URL)`. Equivalent to HTML `<a href="...">...</a>`.
- **Images**: `![Image ALT text](Image file name)`. Equivalent to HTML `<img src="..." alt="..."/>`.

