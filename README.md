[![Build Status](https://travis-ci.com/lipro/lpn-show-learning-yocto.svg?branch=master)](https://travis-ci.com/lipro/lpn-show-learning-yocto)

# Li-Pro.Net Learning Yocto

This repository contains an introduction to "The Yocto Project" Embedded Linux
build and development framework as a HTML5/Reveal.js presentation created and
generated with Sphinx from reStructuredText source files.

https://lipro.github.io/lpn-show-learning-yocto

## Checkout repository

Since the project utilizes the reuse of other Git repositories through
Git submodules, one must also pay attention to these when cloning. Using
different Git versions results in different calls to do this.

With **version 2.13 of Git and later**, `--recurse-submodules` can be used
instead of `--recursive`:

```sh
git clone --recurse-submodules git@github.com:lipro/lpn-show-learning-yocto.git
cd core
```

With **version 1.6.5 of Git up until version 2.12**, you can use:

```sh
git clone --recursive git@github.com:lipro/lpn-show-learning-yocto.git
cd core
```

For already cloned repos, or older Git versions, use:

```sh
git clone git@github.com:lipro/lpn-show-learning-yocto.git
cd core
git submodule update --init --recursive
```

## Setup build environment

Only needed at once when you start.

### Linux

Install arbitrary tools first:

```sh
sudo apt install \
         python3 \
         python3-venv \
         graphviz \
         make
```

### MacOS and Windows

*not yet, t.b.d.*

## Howto build the documentation

The documentation is written using the Sphinx documentation system.
To install it in a Python 3.x virtual environment, please do:

**Python 3.8 virtual environment:**

```bash
$: python3.8 -m venv --copies --promp="$(basename $(pwd))[$(python3.8 --version)]" .py38env
$: source .py38env/bin/activate
$: pip install --upgrade pip
$: pip install --upgrade setuptools
$: pip install --upgrade --requirement tools/requirements.txt
```

To use DeckTape, a high-quality PDF exporter for HTML presentation frameworks,
add / create the specific Node.js environment with

```sh
nodeenv --node=13.14.0 --requirements=tools/requirements-nodeenv.txt --python-virtualenv
```

**Get help:**

```bash
$: make help
```

**Clean-up:**

```bash
$: make clean
$: deactivate
$: rm -rf .py38env
```

**Documentation tests:**

```bash
$: make linkcheck
$: make spelling
```

### Build the presentation

```bash
$: make revealjs
```

The output can be found in the `build/revealjs` folders. To open it with
your default browser type

```sh
xdg-open build/revealjs/index.html
```

DeckTape currently supports the used Reveal.js presentation frameworks
out of the box. Now, after the special Sphinx builder "revealjs" was
running, it can be used to export the presentation to a PDF file ẃith
the help of the headless Chrome WEB engine.

**VERY VERY EXPERIMENTAL**

```sh
make revealjspdf
```

To open it with your default browser type

```sh
xdg-open build/revealjs/index.pdf
```

### Build the online document

```bash
$: make html
```

The output can be found in the `build/html` folders. To open it with
your default browser type

```sh
xdg-open build/html/index.html
```

### Build the printable document

```sh
make latexpdf
```

The output can be found in the `build/latex` folders. To open it with
your default viewer type

```sh
xdg-open build/latex/learning-yocto.pdf
```

## Further References

* Yocto Project® [Logos and Guidelines](https://www.yoctoproject.org/logos-and-guidelines/)
* Yocto Project® [Brand Guidelines](https://www.yoctoproject.org/wp-content/uploads/2017/08/YoctoProject_StyleGuide.pdf)
