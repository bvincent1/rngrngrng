
format:
	@yarn run prettier ./book/*
.PHONY: format

counts:
	@./scripts/word_count.sh ./book/*.md > ./counts.md
	@awk 'BEGIN {sum=0} { sum+=$$1 } END {print sum}' ./counts.md >> ./counts.md
	@cat ./counts.md
.PHONY: counts
