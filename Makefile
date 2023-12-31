compile:
	@rebar3 lfe compile

repl: compile
	@./_build/default/lib/lfe/bin/lfe

hex-publish:
	@echo "\nPublishing to hex.pm ...\n"
	rm -rf doc
	mkdir doc
	cp priv/html/docs-redirect.html doc/index.html
	rebar3 hex publish
	rm -rf doc

md5sum:
	@md5sum priv/output/*.jpg |grep -v md5sum|sort

output-md5sum:
	@echo "\nGenerating check sums ...\n"
	@$(MAKE) md5sum | grep priv > examples/output.md5sum

docker-image:
	docker build -t lfex:plottah .

docker-md5sum: docker-image
	docker run -it -v `pwd`/examples:/plottah/examples lfex:plottah
