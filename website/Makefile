.PHONY: website
.DEFAULT_GOAL := full-build

COPY_FROM_SPEC  = diagram.md notes.md ordering.md chapters.md subtitles.md tagging.md attachments.md cues.md streaming.md menu.md
COPY_FROM_SPEC_SRC = $(patsubst %,../specification/%,$(COPY_FROM_SPEC))
COPY_FROM_SPEC_DEST = $(patsubst transforms/,,$(patsubst %,technical/%,$(COPY_FROM_SPEC)))

BASICS_SRC = ../specification/index_matroska.md
BASICS_DEST = technical/basics.md

BLOCK_ADDITIONS_SRC = ../specification/block_additional_mappings_intro.md $(wildcard ../specification/block_additional_mappings/*.md)
BLOCK_ADDITIONS_DEST = technical/block_additional_mappings.md

CODEC_SPECS_SRC = ../specification/codec_specs.md ../specification/wavpack.md
CODEC_SPECS_DEST = technical/codec_specs.md

MANUAL_DESTS = $(BASICS_DEST) $(BLOCK_ADDITIONS_DEST) $(CODEC_SPECS_DEST) technical/elements.html

clean:
	rm -f $(COPY_FROM_SPEC_DEST) $(MANUAL_DESTS)

technical/elements.html: ../specification/ebml_matroska.xml transforms/ebml_schema2spectable.xsl
	( printf -- '---\ntitle: Matroska Element Specification\n---\n' ; \
	  xsltproc \
	    --stringparam GitRevision "$(shell git --no-pager log '--format=format:%h @ %ai' HEAD~..HEAD)" \
	    transforms/ebml_schema2spectable.xsl \
	    $< | sed -e 1d ) > $@

$(BASICS_DEST): $(BASICS_SRC)
	( printf -- "---\ntitle: Matroska Basics\n---\n" ; \
	  sed -Ee '1,/mainmatter/d' $< ) > $@

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
