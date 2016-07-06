ALL: $(patsubst dates/%.yaml, dates/%, $(wildcard dates/*.yaml))

dates/%: dates/%.yaml
	mkdir -p $@
	./generate.rb $< $@
	make -C $@
