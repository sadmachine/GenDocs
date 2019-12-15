Documentation Syntax/Usage
==========================

Special Comment Block Syntax
----------------------------

GenDocs looks for a special block comment with the following syntax:

```
/*!
...
*/
```

Notice the `!` right after the start of the block comment (`/*`). Use this special block comment syntax to write any documentation that you want GenDocs to pick up on. GenDocs looks for block comments in this format, and ignores normal block comments. 

How-To Document
---------------

> In the examples below, anything surrounded by `<>` is something that would be filled in, and everything between `[]` is an optional part of the comment. `<>` and `[]` are not part of the syntax and should not be literally added to the comments.

### Library

If you would like to document your code as a named library, you can insert a library comment at the top of the "main" library file. This "main" library file could be just simply a file that `#Include`s all the library files, it could be a file which has all the library code in it, or it could be some combination of the two. As long as all the necessary code for the library is accessible from this "main" library file.

Here is an example of a library documentation comment (from [/Demo/TestLib.ahk](/Demo/TestLib.ahk)):

```
/*!
  Library: Test Library
    This library does something

    or maybe not!
    In-paragraph line breaks work
  Author: fincs
  License: WTFPL
  Version: 1.0
*/
```

The above libraries name is `Test Library`, its description is `This library does something...`, it has an author `fincs`, a license `WTFPL`, and a version `1.0`.

The general syntax for a library documentation comment would be:

```
/*!
  Library: <library name>
    <library description (markdown style)>
  [
  Author: <author name>
  License: <license type>
  Version: <version tag>
  ]
*/
```

 Notice how the description of the Library is an indented section after the `Library:` specifier and before any other specifiers, and that it is also can be styled with markdown. 

### Functions

> For methods (functions within a class) see [Methods](#Methods)

For documenting functions 


### Classes

Class documentation

#### Constructors

Constructor documentation

#### Methods

Method documentation


