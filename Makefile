TARGETS=$(patsubst dates/%.yaml, dates/%, $(wildcard dates/*.yaml))
ALL: clean ${TARGETS}

clean:
	rm -rf ${TARGETS}

dates/%:
	mkdir -p $@
	./generate.rb $@.yaml $@
	make -C $@
