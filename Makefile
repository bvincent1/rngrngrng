
format:
	@yarn run prettier -w ./book/*
.PHONY: format

COUNT_FILE="./counts.txt"
counts:
	@./scripts/word_count.sh ./book/*.md > ${COUNT_FILE}
	@awk 'BEGIN {sum=0} { sum+=$$1 } END {print sum}' ${COUNT_FILE} >> ./${COUNT_FILE}
	@cat ${COUNT_FILE}
.PHONY: counts
