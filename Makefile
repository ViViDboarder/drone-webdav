.PHONY: clean all

.PHONY: default
default: test

.PHONY: test
test:
	docker-compose -f ./tests/docker-compose-private.yml up \
		--build --force-recreate \
		--abort-on-container-exit --exit-code-from plugin
	docker-compose -f ./tests/docker-compose-public.yml up \
		--build --force-recreate \
		--abort-on-container-exit --exit-code-from plugin
