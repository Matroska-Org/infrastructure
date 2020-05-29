.PHONY: website
.DEFAULT_GOAL := full-build

COPY_FROM_SPEC = diagram.md notes.md ordering.md chapters.md subtitles.md tagging.md attachments.md cues.md streaming.md menu.md
COPY_FROM_SPEC_SRC = $(patsubst %,../specification/%,$(COPY_FROM_SPEC))
COPY_FROM_SPEC_DEST = $(patsubst %,technical/%,$(COPY_FROM_SPEC))

BLOCK_ADDITIONS_SRC = ../specification/block_additional_mappings_intro.md $(wildcard ../specification/block_additional_mappings/*.md)
BLOCK_ADDITIONS_DEST = technical/block_additional_mappings.md

CODEC_SPECS_SRC = ../specification/codec_specs.md ../specification/wavpack.md
CODEC_SPECS_DEST = technical/codec_specs.md

MANUAL_DESTS = $(BLOCK_ADDITIONS_DEST) $(CODEC_SPECS_DEST)

clean:
	rm -f $(COPY_FROM_SPEC_DEST) $(MANUAL_DESTS)

$(BLOCK_ADDITIONS_DEST): $(BLOCK_ADDITIONS_SRC)
	cat $^ > $@

$(CODEC_SPECS_DEST): $(CODEC_SPECS_SRC)
	cat $^ > $@

clean-copy: clean copy

copy: $(MANUAL_DESTS)
	cp -v $(COPY_FROM_SPEC_SRC) technical/

full-build: clean build

build: copy
	jekyll build
