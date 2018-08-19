PRESENTATIONS=$(patsubst %.tex, %.pdf, $(wildcard presentations/*.tex))
BUILD_DIR=build
BUILD_DECKS=$(subst presentations/,$(BUILD_DIR)/,$(wildcard presentations/content/*))
LATEX=pdflatex -output-directory $(BUILD_DIR)

all: ${PRESENTATIONS}

clean:
	rm -fr presentations/$(BUILD_DIR)

distclean: clean
	rm -f presentations/*.pdf

# Extract dependencies for presentations by looking at the source code and
# extracting all calls to \includedeck from them; it returns a list of elements
# like ’presentations/content/ccc/ccc_lokal.tex’

define presentation_dependencies
  $(shell perl -ne '/includedeck\{(.*)\}/ && print "presentations/content/", $$1, ".tex "' $(1))
endef

# This template is called with arguments like ‘presentation/xxx.pdf’; it
# generates a rule that dependes on the corresponding tex file as well as on all
# decks used in that tex file; dependencies are of the form
# ‘content/ccc/ccc_lokal.tex’

define PRESENTATION_template
.ONESHELL: $(1)
$(1): $(subst .pdf,.tex,$(1)) $(call presentation_dependencies,$(subst .pdf,.tex,$(1)))
	echo $$^
	cd presentations
	mkdir -p $(BUILD_DECKS)
	$(LATEX) $$(notdir $$<)
	$(LATEX) $$(notdir $$<)
	mv $(subst presentations/,$(BUILD_DIR)/,$(1)) .
endef

$(foreach presentation, $(PRESENTATIONS), \
  $(eval $(call PRESENTATION_template, $(presentation))))
