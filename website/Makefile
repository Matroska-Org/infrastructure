.PHONY: website

COPY_FROM_SPEC = diagram.md notes.md ordering.md codec_specs.md chapters.md subtitles.md tagging.md attachments.md cues.md streaming.md menu.md
COPY_FROM_SPEC_SRC = $(patsubst %,../specification/%,$(COPY_FROM_SPEC))
COPY_FROM_SPEC_DEST = $(patsubst %,technical/%,$(COPY_FROM_SPEC))

BLOCK_ADDITIONS_SRC = ../specification/block_additional_mappings_intro.md $(wildcard ../specification/block_additional_mappings/*.md)
BLOCK_ADDITIONS_DEST = technical/block_additional_mappings.md

all: build

clean:
	rm -f $(COPY_FROM_SPEC_DEST) $(BLOCK_ADDITIONS_DEST)

$(BLOCK_ADDITIONS_DEST): $(BLOCK_ADDITIONS_SRC)
	cat $^ > $@

copy: $(BLOCK_ADDITIONS_DEST)
	cp -v $(COPY_FROM_SPEC_SRC) technical/

build: copy
	jekyll build
