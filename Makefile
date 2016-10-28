INTERPRETER := ruby
GENERATOR='./generate.rb'

MAKE_TARGETS=$(patsubst dates/%.yaml, dates/%/ALL, $(wildcard dates/*.yaml))
CLEAN_TARGETS=$(patsubst dates/%.yaml, dates/%/*, $(wildcard dates/*.yaml))
ALL: ${MAKE_TARGETS}

clean:
	rm -rf ${CLEAN_TARGETS}

# Keep Makefiles
.SECONDARY: $(patsubst dates/%/ALL, dates/%/Makefile, $(MAKE_TARGETS))

dates/%/Makefile: dates/%.yaml $(wildcard decks/*.yaml)
	mkdir -p $(shell dirname $@)
	command -v $(INTERPRETER) || (printf "Could not find '%s' – Please install or add it to PATH!\n" $(INTERPRETER); exit 1)
	$(INTERPRETER) $(GENERATOR) $< $(shell dirname $@)

dates/%/ALL: dates/%/Makefile
	$(MAKE) -C $(shell dirname $@)
