# Matroska.Org Infrastructure Repository

This repository contains the files for the [Matroska
Homepage](https://www.matroska.org/).  It might evolve to encompass
other files related to the technical infrastructure around the
Matroska project.

## Building the home page

You'll need:

* `jekyll`
* `make`
* `xsltproc`

First, make sure to have all git submodules update to date:

```sh
git submodule init
git submodule update
```

Now run:

```sh
cd website
make
```

The output will be located in `website/_site`.
