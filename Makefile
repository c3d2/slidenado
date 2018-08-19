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

.ONESHELL:
presentations/%.pdf : presentations/%.tex $(BUILD_DECKS)
	cd presentations
	$(LATEX) $(notdir $<)
	$(LATEX) $(notdir $<)
	mv $(BUILD_DIR)/$*.pdf .
