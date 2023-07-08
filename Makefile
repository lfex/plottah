compile:
	@rebar3 lfe compile

repl: compile
	@./_build/default/lib/lfe/bin/lfe
