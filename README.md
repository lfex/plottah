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
* [Start the Project REPL](#start-the-repl-)
* [Tests](#tests-)
* [Examples](#examples-)
* [Usage](#usage-)
* [License](#license-)

## About [&#x219F;](#table-of-contents)

TBD

## Build [&#x219F;](#table-of-contents)

This project depends upon gnuplot being installed on the system; development was done against the gnuplot installed by Homebrew on a mac.

```shell
rebar3 compile
```

## Start the Project REPL [&#x219F;](#table-of-contents)

```shell
make repl
```

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

Be sure you've compile the project using the instructions above, first!

Then start the REPL, per the above.

From the REPL, start plottah:

```lisp
(plottah:start)
```

This will run the `gnuplot` shell in an OS process.

## License [&#x219F;](#table-of-contents)

Apache License, Version 2.0

Copyright © 2023, Duncan McGreggor <oubiwann@gmail.com>.

[//]: ---Named-Links---

[logo]: priv/images/plottah-x250.jpg
[logo-large]: priv/images/plottah-x1600.jpg
[gh-actions-badge]: https://github.com/lfex/plottah/workflows/ci%2Fcd/badge.svg
[gh-actions]: https://github.com/lfex/plottah/actions
[lfe]: https://github.com/lfe/lfe
[lfe badge]: https://img.shields.io/badge/lfe-2.1+-blue.svg
[erlang badge]: https://img.shields.io/badge/erlang-21%20to%2025-blue.svg
[versions]: https://github.com/lfex/plottah/blob/main/.travis.yml
[github tags]: https://github.com/lfex/plottah/tags
[github tags badge]: https://img.shields.io/github/tag/lfex/plottah.svg
