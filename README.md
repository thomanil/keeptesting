
DESCRIPTION:
===========

The simplest way to autotest your code - no matter what language or
framework you use.

Run it from the command line. Specify 1) how tests are launched and 2)
how a failed test looks in the terminal.

The tests will run on every file change in your project - results are
fed back through a pretty html console, or on the commandline.

USAGE:
======

`keeptesting [options] 'FAILURE-MATCHING-REGEX' 'TEST-COMMAND'`

Run tests whenever files change in the current directory or subdirectories.

Spits back indication of test success or failure, based on specified regex
that detects errors/failures in the output of a test run.
Starts embedded webserver by default, letting you see test feedback in browser
window. Can also run in the command line.

If you have a .keeptesting dotfile present, you can just type 'keeptesting' to
run with the options, error detection and test command etc specified in
the dotfile.

Note: Be sure to use quotes around params like the examples!

`-c, --command-line-mode`       Commandline mode

`-p, --watched-path`            Path to watch for changes

`-d, --store-dotfile`           Save current keeptesting config in dotfile

`-h, --help`                    Display usage

`-v, --version`                 Display version number


EXAMPLES:
======

`keeptesting 'Error|Failure' 'rake test'`                    Run tests whenever anything changes
`keeptesting -p 'test' -p 'lib' 'Error|Failure' 'rake test'` Test on changes in test/ or lib/
`keeptesting -d 'Error|Failure' 'rake test'`                 Store current config in .keeptesting
`keeptesting`                                                Run using .keeptesting config file


PREREQUISITES:
==============

You must have some version of Ruby and RubyGems installed first. That's it.


INSTALL:
========

`gem install keeptesting`


TODO:
=====

(See todo.org)


LICENSE:
========

(The MIT License)

Copyright (c) 2012 Thomas Kjeldahl Nilsson

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
