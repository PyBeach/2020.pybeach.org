.DEFAULT_GOAL := help
.PHONY: help serve build

help: ## this help dialog
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

serve: ## serve project locally for development
	pipenv run lektor serve -f scsscompile

build: ## build project for hosting on Netlify
	lektor build -f scsscompile --output-path _build
