.PHONY: docker-test install
SRCS=src/requires.rb src/line_metadata.rb src/line_tokens.rb src/token_collection.rb src/breakable_entry.rb src/parser_state.rb src/parser.rb src/render_queue_dfa.rb src/format.rb src/main.rb

all: build/rubyfmt.rb

build/rubyfmt.rb: $(SRCS)
	cat $(SRCS) > $@

install: build/rubyfmt.rb
	mkdir -p ~/bin
	cp build/rubyfmt.rb ~/bin/

docker-test:
	docker build -t rubyfmt-test ./dockerfiles/2.3/ &&  docker run -e LANG="en_US.UTF-8" -e LANGUAGE="en_US:en" -e LC_ALL="en_US.UTF-8" -v `pwd`:/github/workspace -it rubyfmt-test
	docker build -t rubyfmt-test ./dockerfiles/2.5/ &&  docker run -e LANG="en_US.UTF-8" -e LANGUAGE="en_US:en" -e LC_ALL="en_US.UTF-8" -v `pwd`:/github/workspace -it rubyfmt-test
	docker build -t rubyfmt-test ./dockerfiles/2.6/ &&  docker run -e LANG="en_US.UTF-8" -e LANGUAGE="en_US:en" -e LC_ALL="en_US.UTF-8" -v `pwd`:/github/workspace -it rubyfmt-test
