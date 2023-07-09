# plottah

[![Build Status][gh-actions-badge]][gh-actions]
[![LFE Versions][lfe badge]][lfe]
[![Erlang Versions][erlang badge]][versions]
[![Tags][github tags badge]][github tags]

[![Project Logo][logo]][logo-large]

*An Erlang/LFE gnuplot process server*

##### Table of Contents

* [About](#about-)
* [Build](#build-)
* [REPL](#repl-)
* [Tests](#tests-)
* [Examples](#examples-)
* [Usage](#usage-)
* [License](#license-)

## About [&#x219F;](#table-of-contents)

This library aims to provide a means for programmers of the BEAM VM to use gnuplot in their native language. To accomplish this, it runs `gnuplot` in shell mode in a managed OS process. The `erlexec` library is used for two-way communications (via `stdin` and combined `stdout`/`stderr`).

This library is in the early stages of development, so to-date only a few functions are provided in the API. See the "Usage" section below for example usage (also the `./examples` directory). For now, the API is a very thin layer over the gnuplot shell, but in the future a DSL may be provided for a more functional programming language experience.

## Build [&#x219F;](#table-of-contents)

This project depends upon:

* Erlang 21+
* `rebar3`
* `gnuplot` being installed on the system

Note that development was done against the gnuplot installed by Homebrew on macos.

With the dependencies in place, the library may be compiled with the following:

```shell
rebar3 compile
```

## REPL [&#x219F;](#table-of-contents)

To start an interactive session in the LFE REPL:

```shell
make repl
```

and then:

```lisp
(plottah:start)
```

This runs the `gnuplot` shell in an OS process and allows for two-way communication. See below on how to communicate with the process.

## Tests [&#x219F;](#table-of-contents)

```shell
rebar3 as test check
```

## Examples [&#x219F;](#table-of-contents)

Show the list of examples:

```shell
rebar3 as examples list
```

Run a specific example:

```shell
rebar3 as examples lfe run -- 3d-hidden
```

## Usage [&#x219F;](#table-of-contents)

First, be sure you've compiled the project using the instructions above!

Then start the REPL (see above), including starting up `plottah`. You can then run code like the following in the REPL (example taken from [here](https://gnuplot.sourceforge.net/demo_5.2/hidden.3.gnu)):

```lisp
(defun options ()
 #m(title "Hidden line removal of explicit surfaces"
    style "increment default"
    view "70, 45, 1, 1"
    samples "20, 20"
    isosamples "20, 20"
    hidden3d "back offset 1 trianglepattern 3 undefined 1 altdiagonal bentover"
    style "data lines"
    xrange "[ -3.00000 : 3.00000 ] noreverse nowriteback"
    x2range "[ * : * ] noreverse writeback"
    yrange "[ -3.00000 : 3.00000 ] noreverse nowriteback"
    y2range "[ * : * ] noreverse writeback"
    zrange "[ * : * ] noreverse writeback"
    cbrange "[ * : * ] noreverse writeback"
    rrange "[ * : * ] noreverse writeback"))

(defun eqn ()
  "sin(x*x + y*y) / (x*x + y*y)")

(plottah:splot (eqn) (options))
```

With that last, a window should pop up showing the following:

[![3D graph screenshot][screenshot]][screenshot]

## License [&#x219F;](#table-of-contents)

Apache License, Version 2.0

Copyright © 2023, Duncan McGreggor <oubiwann@gmail.com>.

[//]: ---Named-Links---

[logo]: priv/images/plottah-x250.jpg
[logo-large]: priv/images/plottah-x1600.jpg
[screenshot]: priv/images/screenshot.png
[gh-actions-badge]: https://github.com/lfex/plottah/workflows/ci%2Fcd/badge.svg
[gh-actions]: https://github.com/lfex/plottah/actions
[lfe]: https://github.com/lfe/lfe
[lfe badge]: https://img.shields.io/badge/lfe-2.1+-blue.svg
[erlang badge]: https://img.shields.io/badge/erlang-21%20to%2025-blue.svg
[versions]: https://github.com/lfex/plottah/blob/main/.travis.yml
[github tags]: https://github.com/lfex/plottah/tags
[github tags badge]: https://img.shields.io/github/tag/lfex/plottah.svg
