.PHONY: clean all

.PHONY: default
default: test

.PHONY: test
test:
	docker-compose -f ./tests/docker-compose-private.yml up \
		--abort-on-container-exit --exit-code-from plugin
	docker-compose -f ./tests/docker-compose-public.yml up \
		--abort-on-container-exit --exit-code-from plugin
