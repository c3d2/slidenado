TARGETS=$(patsubst dates/%.yaml, dates/%, $(wildcard dates/*.yaml))
ALL: ${TARGETS}

clean:
	rm -rf ${TARGETS}

dates/%:
	mkdir -p $@
	./generate.rb $@.yaml $@
	$(MAKE) -C $@
