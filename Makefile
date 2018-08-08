.ONESHELL:
presentations/%.pdf : presentations/%.tex
	cd presentations
	pdflatex $(notdir $<)
	pdflatex $(notdir $<)
