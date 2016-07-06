ALL: $(patsubst lectures/%.yaml, lectures/%, $(wildcard lectures/*.yaml))

lectures/%: lectures/%.yaml
	mkdir $@
	./generate.rb $< $@
