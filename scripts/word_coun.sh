#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./word_count.sh [file]

Get word count of given file.

'
    exit
fi

# cd "$(dirname "$0")"


main() {
    sed '1{/^---$/! q;};1,/^---$/d' $1 | wc -w  | grep -o "[0-9]*"
}

main "$@"