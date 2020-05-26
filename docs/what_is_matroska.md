---
title: What is Matroska?
---
# What is Matroska?

***Matroska*** aims to become THE standard of multimedia container
formats. It was derived from a project called MCF, but differentiates
from it significantly because it is based on EBML (Extensible Binary
Meta Language), a binary derivative of **XML**. EBML enables the
Matroska Development Team to gain significant advantages in terms of
future format extensibility, without breaking file support in old
parsers.

## What is a container?

First, it is essential to clarify exactly \"What an Audio/Video
container is\", to avoid any misunderstandings:

* It is NOT a video or audio compression format (video codec)
* It is an envelope for which there can be many audio, video and
  subtitles streams, allowing the user to store a complete movie or CD
  in a single file.

## Features

***Matroska*** is designed with the future in mind. It incorporates
features you would expect from a modern container format, like:

* Fast seeking in the file
* Chapter entries
* Full metadata (tags) support
* Selectable subtitle/audio/video streams
* Modularly expandable
* Error resilience (can recover playback even when the stream is
  damaged)
* Streamable over the internet and local networks (HTTP, CIFS, FTP,
  etc)
* *Menus (like DVDs have)*

## An open project

Matroska is an open standards project. This means for personal use it is
absolutely free to use and that the technical specifications describing
the bitstream are open to everybody, even to companies that would like
to support it in their products. The source code of the libraries
developed by the Matroska Development Team is licensed under GNU L-GPL.
In addition to that, there are also free parsing and playback libraries
available under the BSD license, for commercial software and Hardware
adoption.

## Goals

The Matroska has the following goals:

* Create and document a modern, flexible and cross-platform
  Audio/Video container format, in combination with an open codec API
  to form a free and open media framework
* Establish Matroska as the opensource alternative to existing
  containers such as AVI, ASF, MOV, RM, MP4, MPG ES
* Develop a set of tools for the creation, editing and implementation
  of Matroska files
* Develop libraries and tools for software developers to be able to
  support Matroska in their applications
* Prepare hardware support of Matroska files in next generations
  standalone units, in close cooperation with device manufacturers
* Support adoption and implementation of Matroska\'s in open
  architectures like FFmpeg, VLC or GStreamer (Multimedia Framework
  for Linux, equivalent to Microsoft (TM) DirectShow (R) for Windows
  (TM))
* Launch a set of DirectShow filters for playback and creation of
  ***Matroska*** files on Windows (TM) Operating Systems

## Participate!

We invite every interested developer to join our team and to help us to
achieve these goals. While most of the existing Matroska code is in C++
we are also interested in C and Java programmers joining us.
