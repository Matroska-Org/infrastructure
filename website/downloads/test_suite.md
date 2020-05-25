---
title: Test suite
---
# Test suite

As the popularity of Matroska is quickly growing, it is becoming
necessary to define a set of minimum features players should handle. As
we are pushing old features like the header stripping, we realise a lot
of players (hardware and software) don\'t support such simple features.
Probably because they never had a set of source materials to validate
their code against. So we have remedied this with a set of 8 files meant
to cover the basic features a player should support to be considered a
good Matroska player.

The emphasis is on the container support not on the codec. It's
possible some players may not support Theora for example in the "live"
test file, but it's always possible to generate a similar file with
`mkclean --live` (download mkclean [here](mkclean.html)).

The 8 files included in this set are:

* `test1.mkv` : Basic file
* `test2.mkv` : Non default timecodescale & aspect ratio
* `test3.mkv` : Header stripping & standard block
* `test4.mkv` : Live stream recording
* `test5.mkv` : Multiple audio/subtitles
* `test6.mkv` : Different EBML head sizes & cue-less seeking
* `test7.mkv` : Extra unknown/junk elements & damaged
* `test8.mkv` : Audio gap

We strongly encourage developers and companies that produce Matroska
players to test these files on their product and make sure they all pass
the test. We also encourage users to test these files too with their
players and report the (non) success they are having. Later we will be
producing a database of all known Matroska players and what test they
pass/fail (but it won't come until a few weeks).

[Let us know](../contact.html) if you have any suggestion on how to
improve this test suite or if you think something is not correct.

You can download the test files [on
SourceForge](https://sourceforge.net/projects/matroska/files/test_files/matroska_test_w1_1.zip/download)
and also look at the [Release
Notes](https://sourceforge.net/projects/matroska/files/test_files/Release.txt/view)
accompanying these files.
