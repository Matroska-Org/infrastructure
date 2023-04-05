.PHONY: website
.DEFAULT_GOAL := full-build

COPY_FROM_SPEC  = notes.md ordering.md chapters.md subtitles.md attachments.md cues.md streaming.md menu.md chapter_codecs.md control.md matroska_implement.md tags-precedence.md
COPY_FROM_SPEC_SRC = $(patsubst %,../specification/%,$(COPY_FROM_SPEC))
COPY_FROM_SPEC_DEST = $(patsubst transforms/,,$(patsubst %,technical/%,$(COPY_FROM_SPEC)))

BASICS_SRC = ../specification/index_matroska.md
BASICS_DEST = technical/basics.md

BLOCK_ADDITIONS_SRC = ../specification/block_additional_mappings_intro.md $(wildcard ../specification/block_additional_mappings/*.md)
BLOCK_ADDITIONS_DEST = technical/block_additional_mappings.md

CODEC_SPECS_SRC = ../specification/codec_specs.md ../specification/wavpack.md
CODEC_SPECS_DEST = technical/codec_specs.md

DIAGRAM_SRC = ../specification/diagram.md
DIAGRAM_DEST = technical/diagram.md

TAGGING_SRC = ../specification/tagging.md ../specification/transforms/matroska_tags2markdown4rfc.xsl ../specification/matroska_tags.xml ../specification/tagging_end.md
TAGGING_DEST = technical/tagging.md

MANUAL_DESTS = $(BASICS_DEST) $(BLOCK_ADDITIONS_DEST) $(CODEC_SPECS_DEST) $(DIAGRAM_DEST) $(TAGGING_DEST) technical/elements.html

technical/%: ../specification/%
	./fixup_content.sh < $< > $@

technical/elements.html: ../specification/ebml_matroska.xml transforms/ebml_schema2spectable.xsl
	( printf -- '---\ntitle: Matroska Element Specification\n---\n' ; \
	  xsltproc \
	    --nonet \
	    --stringparam GitRevision "$(shell cd ../specification && git --no-pager log -n 1 '--format=format:%h @ %ai' HEAD)" \
	    transforms/ebml_schema2spectable.xsl \
	    $< ) | ./fixup_content.sh> $@

$(BASICS_DEST): $(BASICS_SRC)
	( printf -- "---\ntitle: Matroska Basics\n---\n" ; \
	  sed -Ee '1,/mainmatter/d' $< ) | ./fixup_content.sh > $@

$(BLOCK_ADDITIONS_DEST): $(BLOCK_ADDITIONS_SRC)
	cat $^ | ./fixup_content.sh > $@

$(CODEC_SPECS_DEST): $(CODEC_SPECS_SRC)
	cat $^ | ./fixup_content.sh > $@

$(DIAGRAM_DEST): $(DIAGRAM_SRC)
	( printf -- "---\ntitle: Data Layout\n---\n" ; \
	  cat $< ) | ./fixup_content.sh > $@

$(TAGGING_DEST): $(TAGGING_SRC)
	( cat ../specification/tagging.md ; \
	  xsltproc --nonet ../specification/transforms/matroska_tags2markdown4rfc.xsl ../specification/matroska_tags.xml ; \
	  cat ../specification/tagging_end.md ) | \
	./fixup_content.sh > $@

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
