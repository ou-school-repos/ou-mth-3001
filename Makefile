SHELL=/bin/bash

.PHONY: lint
lint:
	mdl -r ~MD013,~MD025,~MD033,~MD034,~MD055,~MD056,~MD057 *.md

.PHONY: format
format:
	shfmt -w $(shell git ls-files \*.sh)


loc ?=

.PHONY: archive
archive:
	# usage: loc=. make archive
	bash etc/archive.sh "${loc}"


.PHONY: unarchive
unarchive:
	# usage: loc=<path> make archive
	test "${loc}"
	bash etc/unarchive.sh "${loc}"


clean_locs ?= $(shell find . -type d -name out-xml)

.PHONY: clean
clean:
	find ${clean_locs} -name \*.xopp | xargs rm
