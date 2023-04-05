.PHONY: website
.DEFAULT_GOAL := full-build

COPY_FROM_SPEC  = attachments.md chapter_codecs.md chapters.md control.md cues.md matroska_implement.md menu.md notes.md ordering.md streaming.md subtitles.md tags-precedence.md
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

technical/attachments.md: ../specification/attachments.md
	./fixup_content.sh Attachments < $< > $@

technical/chapter_codecs.md: ../specification/chapter_codecs.md
	./fixup_content.sh "Chapters Codecs" < $< > $@

technical/chapters.md: ../specification/chapters.md
	./fixup_content.sh Chapters < $< > $@

technical/control.md: ../specification/control.md
	./fixup_content.sh "Control Tracks" < $< > $@

technical/cues.md: ../specification/cues.md
	./fixup_content.sh Cues < $< > $@

technical/elements.html: ../specification/ebml_matroska.xml transforms/ebml_schema2spectable.xsl
	( printf -- '---\ntitle: Matroska Element Specification\n---\n' ; \
	  xsltproc \
	    --nonet \
	    --stringparam GitRevision "$(shell cd ../specification && git --no-pager log -n 1 '--format=format:%h @ %ai' HEAD)" \
	    transforms/ebml_schema2spectable.xsl \
	    $< ) | ./fixup_content.sh> $@

technical/matroska_implement.md: ../specification/matroska_implement.md
	./fixup_content.sh "Matroska Implementation Recommendations" < $< > $@

technical/menu.md: ../specification/menu.md
	./fixup_content.sh "Menu Specification" < $< > $@

technical/notes.md: ../specification/notes.md
	./fixup_content.sh "Specification Notes" < $< > $@

technical/ordering.md: ../specification/ordering.md
	./fixup_content.sh "Matroska Element Ordering" < $< > $@

technical/streaming.md: ../specification/streaming.md
	./fixup_content.sh Streaming < $< > $@

technical/subtitles.md: ../specification/subtitles.md
	./fixup_content.sh Subtitles < $< > $@

technical/tags-precedence.md: ../specification/tags-precedence.md
	./fixup_content.sh "Tags Precedence" < $< > $@

$(BASICS_DEST): $(BASICS_SRC)
	( printf -- "---\ntitle: Matroska Basics\n---\n" ; \
	  sed -Ee '1,/mainmatter/d' $< ) | ./fixup_content.sh > $@

$(BLOCK_ADDITIONS_DEST): $(BLOCK_ADDITIONS_SRC)
	cat $^ | ./fixup_content.sh "Block Additional Mapping" > $@

$(CODEC_SPECS_DEST): $(CODEC_SPECS_SRC)
	cat $^ | ./fixup_content.sh "Codec Mappings" > $@

$(DIAGRAM_DEST): $(DIAGRAM_SRC)
	( printf -- "---\ntitle: Data Layout\n---\n" ; \
	  cat $< ) | ./fixup_content.sh > $@

$(TAGGING_DEST): $(TAGGING_SRC)
	( cat $< ; \
	  xsltproc --nonet ../specification/transforms/matroska_tags2markdown4rfc.xsl ../specification/matroska_tags.xml ; \
	  cat ../specification/tagging_end.md ) | \
	./fixup_content.sh Tags > $@

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
