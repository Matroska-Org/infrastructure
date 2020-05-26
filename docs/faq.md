---
title: Frequently asked & answered questions
---
# Frequently asked & answered questions

Listed below are some of the most common questions asked about Matroska.

### Q: What is matroska? I dont understand what a \'container format\' is at all, is it a player, or a audio/video compression format ?

A: Whenever you play a movie it includes at least one video stream and
one audio stream. Since its not practicle to have two files to play
audio/video, you pack both into a single file by using a so-called
container format file. This container and the software coming with it
take care of a lot of important functions, like the correct timing of
the audio and video playback when the file is played ( opened ). ZIP
or RAR could be a perfect container to pack one or more audio/video
streams together into one single file for distribution, but WinZIP
certainly wouldnt care about the correct timing of the these streams
on playback.

Known containers are the good old AVI, the MPEG container family
(`.mpg`; `.vob` on DVDs; `.m2ts` on Blu-rays), MP4 (`.mp4`) and older
ones such as Quicktime (`.mov`) or RealMedia (`.rm`).

Matroska is an Open Source alternative to all of them, and is able to
offer a lot of features that others dont have.

### Q: What are the advantages of matroska compared to AVI ?

A: The AVI container was originally introduced by Microsoft in the early
90s, and was designed as a very flexible A/V container format for the
video and audio compression formats of those days. It is necessary to
understand that AVI is only one ( but important ) part of a complete
multimedia framework called \'Video For Windows\' ( VfW ), offering
programmers not only a container but also a complete set of API commands
to be able to program their own video and audio codecs, using either the
VfW or the ACM interface ( this was back from the days when Microsoft
was still dedicated to sell their operating systems to people, instead
of multimedia solutions as they are trying to do today with WMV, so they
had to make their OS attractive to other programmers ).
Unfortunately this VfW framework cannot support many of the more
advanced features that modern audio and video compression formats will
offer, such as Variable Bitrate audio encoding ( VBR ), or Variable
Framerate video encoding ( VFR ). Although AVI was extended with an
additional standard called \'Open DML AVI\' in the mid/late 90s,
overcoming most of its very annoying limitations like the 2 GB file size
limit, there is still no proper and spec compliant way to support modern
compression formats like the excellent, opensource Ogg Vorbis audio
compression format.

Matroska has overcome all those limitations and can support all known
audio and video compression formats by design. To make sure it will also
be capable of coping with the future standards it is based on a very
flexible underlying framework called EBML, allowing to add more
functionalities to the container format without breaking backwards
compatibility with older softwares and files.


### Q: What file extensions does Matroska use?

A: We currently have 4 different extensions specified:

* `.mkv`: Used for files that contain at least one video track
  (usually with at least one audio track and optionally with subtitle
  tracks). This is the most commonly used extension.
* `.mka`: Used for audio only files, can contain any supported audio
  compression format, such as MP2, MP3, Vorbis, AAC, AC3, DTS, or PCM
* `.mk3d`: A special case of `.mkv` containing stereoscopic (3D) video
* `.mks`: Used for files that only contain subtitles


### Q: How can I create Matroska files?

A: You can reencode an existing source with FFmpeg or the more user
friendly Handbrake. You can also \'transmux\' an existing AVI, MP4 or TS
file. This option is a lossless process, all the audio and video data in
the source file will be read from it, and packed into a matroska file in
a spec compliant way, but basically stay unaltered to avoid any
degradation of quality. There are currently 2 different tools to do this
( look here for the announcement of their latest versions ), but the
list keeps on growing.

Moritz Bunku\'s MKVToolNix is a suite of applications that includes a
Matroska muxer that can be run on Windows, Linux and macOS X. It also
does accept AVI and OGM on its input, as well as AC3, AAC, Vorbis,
DTS, MP3, MP2 and PCM audio among many others.

In VirtuldubMod all you have to do is to open your AVI or OGM file,
set \'video\' to \'direct stream copy\', goto \'file\' \'save as
\...\' and select \'.mkv\' from the file type dropdown list and rename
it. Of course, this doesnt make much sense if you dont have any plans
to add something to the file that AVI or OGM cannot support, like
adding another audio track in an unsupported audio compression format.

From VirtualdubMod you can also directly encode into .mkv files from any
source that it can open, and using every available VfW and ACM codecs,
even in 2 pass mode.


### Q: How can I play Matroska files on my PC?

A: On the download page you will find links to several players and
components that allow you to play back Matroska files. Many operating
systems nowadays come with Matroska capabilities out of the box, too.


### Q: What is the advantage of using the `.mka` file instead of the original audio formats, like MP3, etc?

A: You can embed lyrics or transcriptions (e.g. from srt subtitles) in
the audio file. You can use chapters to separate parts of a track or a
live album. In some case (MP3, AC3, DTS) the Matroska file may also be
smaller than the original with much better/cleaner seeking support.

Here are some reasons that placing audio in MKA is
useful:

1. The tags will be the same no matter what audio format you use. That
   means that if you write a program to read back tags, it only has to
   read them from one type of tagging system, no matter what type of
   audio is being used.
2. All tracks to a CD can be in a single file. You have the option of
   dividing the tracks into seperate Tracks, or seperate Chapters. You
   could make your own compilation in a single file, even using
   different audio formats, such as MP3 and Vorbis.
3. If you write a program to read audio of of MKA, then you don\'t
   need to understand how the framing works in the different formats
   because it is already done for you in Matroska.
4. It is easy to delete portions of the audio without reencoding
   because you just throw away those blocks. You don\'t even have to
   be able to play that format back, you could edit by just knowing
   timecodes.
5. Detecting differences between two audio streams would be easy
   because you could store both in a single file, start playback, and
   then just switch between tracks.
6. If you intend to combine the audio with video, then having is in
   MKA means you can merge it with an MKV, even if the application
   doesn\'t support the audio type.
7. In the case of MP3, MP2 AC3 and even some AAC, using \"compressed
   headers\" the MKA file may even be smaller than the original
   \"raw\" file, without losing any bit of information.

### Q: Will my .mkv files be compatible with future Matroska software if I will use current tools to mux my files?

A: The files being created now are spec compliant.

### Q: Will there be a perfomance hit for storing audio/video in Matroska?

A: No, even though its more complex to read/write MKV than it is AVI you
can\'t tell a difference when reading back a file from AVI or MKV on
today\'s processors, even on smartphones ( see CorePlayer ).

### Q: What makes Matroska better (worse?) than an Ogg media container (`.ogm`)?

A: It\'s less a matter of better/worse, and more a matter of different.
This is a little complex but we will try to explain.

First Ogg is not the same thing as Ogm. Ogg is an RFC spec now, and is
very useful for what it was designed for, streaming over lossy links,
and Ogm is an implementation of Ogg placing other \'things\' inside.

So, we have:

1. Ogg:
   1. Designed for \"lossy\"streaming (over UDP).
   2. Designed to hold Vorbis and other Xiph-supported audio & video
      codecs.
   3. Well documented for above two purposes.
2. OGM:
   1. Implementation of Ogg to hold video, other audio codecs, and a
      type of subtitle.
   2. Implements Chapter support.
3. Matroska:
   1. Designed to hold any type of codec. (Audio, Video, Subtitle, etc)
   2. Designed for editability.
   3. Purposely flexible design.
   4. Well documented portions, others in process.
   5. Initial design is to support presentation container features
      such as Chapters, Tags, AudioGain, Menus, etc.

Will Matroska be streamable? Yes, but low bitrate streaming like
streaming Vorbis, will always be better in Ogg. This is because their
design is for different purposes.
