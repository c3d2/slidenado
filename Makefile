PRESENTATIONS=$(patsubst %.tex, %.pdf, $(wildcard presentations/*.tex))

all: ${PRESENTATIONS}

clean:
	rm -f presentations/*.log
	rm -f presentations/*.out
	rm -f presentations/*.nav
	rm -f presentations/*.aux
	rm -f presentations/*.snm
	rm -f presentations/*.toc

.ONESHELL:
presentations/%.pdf : presentations/%.tex
	cd presentations
	pdflatex $(notdir $<)
	pdflatex $(notdir $<)
