install:
	bin/setup
console:
	bin/console

lint:
	bundle exec rake rubocop

test:
	bundle exec rake test

check:
	bundle exec rake


.PHONY: test
