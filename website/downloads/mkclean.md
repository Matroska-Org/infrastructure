---
title: mkclean
---
# mkclean

mkclean is a command line tool to clean and optimize Matroska (`.mkv`
/ `.mka` / `.mks` / `.mk3d`) and WebM (`.webm` / `.weba`) files that
have already been muxed. It reorders the elements with the Cues at the
front, so your Matroska files are ready to be streamed efficiently
over the web. It also removes elements not found in the Matroska specs
and the extra Meta Seek list of Clusters that some program add to
their file. It can also optionally remux the Cluster blocks to start
each boundary with a keyframe and the matching audio/subtitle blocks
for that keyframe.

Also comes with `mkWDclean` to modify files in a way they can play in
broken/incomplete players.

## License

The program is licensed with the BSD license. So you can modify it in
any way you want. However we ask that you generously give back your
enhancements to the community if you think it can help.

mkclean depends on both libebml2 (BSD license) and libmatroska2 (BSD
license), which relies on the Core-C (BSD license) Project, which adds
a low level object based API on top of the ANSI C language.

## Download

You can download the [latest source package
(v0.8.10)](https://sourceforge.net/projects/matroska/files/mkclean/mkclean-0.8.10.tar.bz2/download),
[ChangeLog](https://sourceforge.net/projects/matroska/files/mkclean/README.txt/view)
or a [pre-built binary for
win64](https://sourceforge.net/projects/matroska/files/mkclean/mkclean-0.8.10-win64.zip/download).
