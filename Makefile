.PHONY: clean all

.PHONY: default
default: test

.PHONY: test
test: check
	docker-compose -f ./tests/docker-compose-private.yml up \
		--build --force-recreate \
		--abort-on-container-exit --exit-code-from plugin
	docker-compose -f ./tests/docker-compose-public.yml up \
		--abort-on-container-exit --exit-code-from plugin

.PHONY: install-hooks
install-hooks:
	pre-commit install

.PHONY: check
check:
	pre-commit run --all-files
