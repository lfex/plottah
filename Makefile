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
