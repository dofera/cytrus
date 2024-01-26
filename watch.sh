#!/bin/sh

readonly CYTRUS_URL="https://cytrus.cdn.ankama.com/cytrus.json"

main()
{
  while sleep 60; do
    curl --silent "${CYTRUS_URL}" --output out
    merge
    [ -n "$(git status --short cytrus.json)" ] && push
  done
}

merge()
{
  python3 jsonmerge.py cytrus.json out | jq > tmp && mv tmp cytrus.json
}

push()
{
  git add cytrus.json
  git commit --message "Update cytrus.json"
  git push
}

main "$@"
