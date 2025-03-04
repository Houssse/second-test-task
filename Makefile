lint:
	bundle exec rubocop
	bundle exec slim-lint app/views

test: prepare_test_db
	bin/rails test

prepare_test_db:
	bin/rails db:test:prepare