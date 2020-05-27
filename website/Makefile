.PHONY: website

COPY_FROM_SPEC = diagram.md notes.md ordering.md codec_specs.md chapters.md subtitles.md tagging.md attachments.md cues.md streaming.md menu.md
COPY_FROM_SPEC_SRC = $(patsubst %,../specification/%,$(COPY_FROM_SPEC))
COPY_FROM_SPEC_DEST = $(patsubst %,technical/%,$(COPY_FROM_SPEC))

all: build

clean:
	rm -f $(COPY_FROM_SPEC_DEST)

copy:
	cp -v $(COPY_FROM_SPEC_SRC) technical/

build: copy
	jekyll build
