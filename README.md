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

Note that development was done against the gnuplot installed by Homebrew (gnuplot 5.4 patchlevel 8) on macos (11.6).

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
(defun opts ()
  '(#(title "4D data (3D Heat Map)\\nIndependent value color-mapped onto 3D surface")
    #(size "1, 0.9")
    #(origin "0, 0.05")
    #(#(title offset) "character 0, 1, 0 font '' norotate")
    #(style "increment default")
    #(format "cb '%4.1f'")
    #(view "49, 28, 1, 1.48")
    #(samples "25, 25")
    #(isosamples "50, 50")
    #(xyplane "relative 0")
    #(cbtics "border in scale 0,0 mirror norotate autojustify")
    #(urange "[ 5 : 35 ] noreverse nowriteback")
    #(vrange "[ 5 : 35 ] noreverse nowriteback")
    #(xrange "[ * : * ] noreverse nowriteback")
    #(x2range "[ * : * ] noreverse nowriteback")
    #(yrange "[ * : * ] noreverse nowriteback")
    #(y2range "[ * : * ] noreverse nowriteback")
    #(zrange "[ * : * ] noreverse nowriteback")
    #(cbrange "[ * : * ] noreverse nowriteback")
    #(rrange "[ * : * ] noreverse nowriteback")
    #(pm3d "implicit at s")
    #(colorbox "user")
    #(colorbox "vertical origin screen 0.9, 0.2, 0 size screen 0.03, 0.6, 0 front noinvert noborder")
    #(#(x label) "x")
    #(#(xlabel offset) "character 3, 0, 0 font '' textcolor lt -1 norotate")
    #(#(y label) "y")
    #(#(ylabel offset) "character -5, 0, 0 font '' textcolor lt -1 rotate")
    #(#(z label) "z")
    #(#(zlabel offset) "character 2, 0, 0 font '' textcolor lt -1 norotate")))

(defun funcs ()
  '(#("sinc(x,y)" "sin(sqrt((x-20.)**2+(y-20.)**2))/sqrt((x-20.)**2+(y-20.)**2)")
    #("Z(x,y)" "100. * (sinc(x,y) + 1.5)")
    #("color(x,y)" "10. * (1.1 + sin((x-20.)/5.)*cos((y-20.)/10.))")))

(defun args ()
  "'++' using 1:2:(Z($1,$2)):(color($1,$2)) with pm3d title ''")

(plottah:splot (args) (options) (funcs))
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
