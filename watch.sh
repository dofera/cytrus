#!/bin/sh

readonly CYTRUS_URL="https://cytrus.cdn.ankama.com"
readonly CYTRUS_FILE="cytrus.json"

push() {
  git add "${CYTRUS_FILE}"
  git commit --message "Update ${CYTRUS_FILE}"
  git push
}

merge() {
  python3 jsonmerge.py "$1" "$2" | jq >tmp && mv tmp "$1"
}

main() {
  while sleep 60; do
    curl --silent "${CYTRUS_URL}/${CYTRUS_FILE}" --output out
    merge "${CYTRUS_FILE}" out
    [ -n "$(git status --short "${CYTRUS_FILE}")" ] && [ -s "${CYTRUS_FILE}" ] && push
  done
}

main "$@"
