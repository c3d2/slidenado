PRESENTATIONS=$(patsubst %.tex, %.pdf, $(wildcard presentations/*.tex))

all: ${PRESENTATIONS}

.ONESHELL:
presentations/%.pdf : presentations/%.tex
	cd presentations
	pdflatex $(notdir $<)
	pdflatex $(notdir $<)
