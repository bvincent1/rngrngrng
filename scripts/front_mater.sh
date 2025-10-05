#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./front_matter.sh [file(s)...]

Get front-matter of given file(s) in json format.

'
    exit
fi

# cd "$(dirname "$0")"

main () {
  node -e "console.log(JSON.stringify(require(\"gray-matter\").read(\"$1\")));"
}


for arg in $@
do
  main "$arg"
done
