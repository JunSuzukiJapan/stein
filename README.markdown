# Stein
[![Build Status](https://travis-ci.org/JunSuzukiJapan/stein.svg?branch=master)](https://travis-ci.org/JunSuzukiJapan/stein)


## Installation

```bash:shell
$ cd ~/quicklisp/local-projects
$ git clone https://github.com/JunSuzukiJapan/stein.git
```

```lisp:lisp
(require :quicklisp)
(ql:register-local-projects)
(ql:quickload :stein)
```

## Example

```lisp:example
(stn:quickload "https://github.com/fukamachi/prove.git")
```

## Author

* Jun Suzuki (jun.suzuki.japan@gmail.com)

## Copyright

Licensed under the MIT License.
