---
title: mkvalidator
---
# mkvalidator

mkvalidator is a simple command line tool to verify Matroska and WebM
files for spec conformance. It checks the various bogus or missing key
elements against the EBML DocType version of the file and reports the
errors/warnings in the command line.

## License

The program is licensed with the BSD license. So you can modify it in
any way you want. However we ask that you generously give back your
enhancements to the community if you think it can help.

mkvalidator depends on libebml2 (BSD) and libmatroska2 (BSD) that
themselves rely on
[Core-C](https://github.com/Matroska-Org/foundation-source/tree/master/corec)
(BSD) which adds an object API on top of the C language.

mkvalidator can be built with minilzo support whic is GPL. In that case the
license of the binary becomes GPL.

## Download

The latest release is v0.6.0 from 2021-01-31. You can [view the
ChangeLog](https://sourceforge.net/projects/matroska/files/mkvalidator/ChangeLog.txt/view),
download the [source
package](https://sourceforge.net/projects/matroska/files/mkvalidator/mkvalidator-0.6.0.tar.bz2/download)
or a pre-built [binary for
win64](https://sourceforge.net/projects/matroska/files/mkvalidator/mkvalidator-0.6.0-win64.zip/download).
