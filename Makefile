
COUNT_FILE="./counts.txt"

help: ## Show this help
	@echo "\nSpecify a command. The choices are:\n"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[0;36m%-12s\033[m %s\n", $$1, $$2}'
	@echo ""
.PHONY: help

install: ## Install node libs
	@yarn install
.PHONY: install

format: ## Format all the *.md files in this repo
	@yarn run prettier -w ./**/*.md ./*.md
.PHONY: format

counts.txt: book/*.md ## Update the [counts.txt] file from all the [./book/*.md] files
	@./scripts/word_count.sh ./book/*.md > ${COUNT_FILE}
	@awk 'BEGIN {sum=0} { sum+=$$1 } END {print sum}' ${COUNT_FILE} >> ./${COUNT_FILE}
	@cat ${COUNT_FILE}
