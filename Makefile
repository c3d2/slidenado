PRESENTATIONS=$(patsubst %.tex, %.pdf, $(wildcard presentations/*.tex))
BUILD_DIR=build
BUILD_DECKS=$(subst presentations, presentations/$(BUILD_DIR), $(wildcard presentations/content/*))
LATEX=pdflatex -output-directory $(BUILD_DIR)

all: ${PRESENTATIONS}

clean:
	rm -fr presentations/$(BUILD_DIR)

distclean: clean
	rm -f presentations/*.pdf

.SECONDARY: $(BUILD_DECKS)
presentations/$(BUILD_DIR)/%:
	mkdir -p $@

define PRESENTATION_template
.ONESHELL: $(1)
$(1): $(subst .pdf,.tex,$(1)) $(BUILD_DECKS)
	cd presentations
	$(LATEX) $$(notdir $$<)
	$(LATEX) $$(notdir $$<)
	mv $(subst presentations/,$(BUILD_DIR)/,$(1)) .
endef

$(foreach presentation, $(PRESENTATIONS), \
  $(eval $(call PRESENTATION_template, $(presentation))))
