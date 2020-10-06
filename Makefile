# Makefile for pizzeria-teamcmp
# vim: set ft=make ts=8 noet

.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# Targets
#
.PHONY: build
build: ### Example of build. Modify me.
	@echo "I'm a build recipe"

.PHONY: run
run: ### Example of run. Modify me.
	@echo "I'm a run recipe"
