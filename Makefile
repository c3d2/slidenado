TARGETS=$(patsubst dates/%.yaml, dates/%/ALL, $(wildcard dates/*.yaml))
ALL: ${TARGETS}

clean:
	rm -rf ${TARGETS}

# Keep Makefiles
.SECONDARY: $(patsubst dates/%/ALL, dates/%/Makefile, $(TARGETS))

dates/%/Makefile: dates/%.yaml $(wildcard decks/*.yaml)
	mkdir -p $(shell dirname $@)
	./generate.rb $< $(shell dirname $@)

dates/%/ALL: dates/%/Makefile
	$(MAKE) -C $(shell dirname $@)
