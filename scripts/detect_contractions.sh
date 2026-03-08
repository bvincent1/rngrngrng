#!/bin/bash

# Script to detect contractions in text files
# Usage: ./detect_contractions.sh [file]

if [ $# -eq 0 ]; then
    echo "Usage: $0 [file]"
    echo "Detects contractions (words with apostrophes) in a text file"
    exit 1
fi




main () {
  FILE="$1"

  if [ ! -f "$FILE" ]; then
      echo "Error: File not found: $FILE"
      exit 1
  fi

  echo "Contractions found in: $FILE"
  echo "---"

  # Extract contractions (words containing apostrophes)
  grep -oE "(?!>\")\b[a-zA-Z]+'[a-zA-Z]+\b(?!\")" "$FILE" | sort | uniq -c | sort -rn

  echo ""
  echo "Total unique contractions: $(grep -oE "\b[a-zA-Z]+'[a-zA-Z]+\b" "$FILE" | sort -u | wc -l)"
  echo "Total contraction occurrences: $(grep -oE "\b[a-zA-Z]+'[a-zA-Z]+\b" "$FILE" | wc -l)"
}


for arg in $@
do
  main "$arg"
done
