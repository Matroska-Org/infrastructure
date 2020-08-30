.PHONY: website
.DEFAULT_GOAL := full-build

COPY_FROM_SPEC  = diagram.md notes.md ordering.md chapters.md subtitles.md attachments.md cues.md streaming.md menu.md
COPY_FROM_SPEC_SRC = $(patsubst %,../specification/%,$(COPY_FROM_SPEC))
COPY_FROM_SPEC_DEST = $(patsubst transforms/,,$(patsubst %,technical/%,$(COPY_FROM_SPEC)))

BASICS_SRC = ../specification/index_matroska.md
BASICS_DEST = technical/basics.md

BLOCK_ADDITIONS_SRC = ../specification/block_additional_mappings_intro.md $(wildcard ../specification/block_additional_mappings/*.md)
BLOCK_ADDITIONS_DEST = technical/block_additional_mappings.md

CODEC_SPECS_SRC = ../specification/codec_specs.md ../specification/wavpack.md
CODEC_SPECS_DEST = technical/codec_specs.md

TAGGING_SRC = ../specification/tagging.md ../specification/transforms/matroska_tags2markdown4rfc.xsl ../specification/matroska_tags.xml ../specification/tagging_end.md
TAGGING_DEST = technical/tagging.md

MANUAL_DESTS = $(BASICS_DEST) $(BLOCK_ADDITIONS_DEST) $(CODEC_SPECS_DEST) $(TAGGING_DEST) technical/elements.html

FIXUP_CONTENT := sed -Ee 's!https?://(www.)?matroska.org/!/!g'

technical/%: ../specification/%
	$(FIXUP_CONTENT) < $< > $@

technical/elements.html: ../specification/ebml_matroska.xml transforms/ebml_schema2spectable.xsl
	( printf -- '---\ntitle: Matroska Element Specification\n---\n' ; \
	  xsltproc \
	    --nonet \
	    --stringparam GitRevision "$(shell cd ../specification && git --no-pager log -n 1 '--format=format:%h @ %ai' HEAD)" \
	    transforms/ebml_schema2spectable.xsl \
	    $< ) | $(FIXUP_CONTENT) > $@

$(BASICS_DEST): $(BASICS_SRC)
	( printf -- "---\ntitle: Matroska Basics\n---\n" ; \
	  sed -Ee '1,/mainmatter/d' $< ) | $(FIXUP_CONTENT) > $@

$(BLOCK_ADDITIONS_DEST): $(BLOCK_ADDITIONS_SRC)
	cat $^ | $(FIXUP_CONTENT) > $@

$(CODEC_SPECS_DEST): $(CODEC_SPECS_SRC)
	cat $^ | $(FIXUP_CONTENT) > $@

$(TAGGING_DEST): $(TAGGING_SRC)
	( cat ../specification/tagging.md ; \
	  xsltproc --nonet ../specification/transforms/matroska_tags2markdown4rfc.xsl ../specification/matroska_tags.xml ; \
	  cat ../specification/tagging_end.md ) | \
	$(FIXUP_CONTENT) > $@

clean:
	rm -f $(COPY_FROM_SPEC_DEST) $(MANUAL_DESTS)

clean-copy:
	$(MAKE) clean
	$(MAKE) copy

copy: $(COPY_FROM_SPEC_DEST) $(MANUAL_DESTS)

full-build:
	$(MAKE) clean
	$(MAKE) build

build: copy
	jekyll build
