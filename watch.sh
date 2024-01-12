#!/bin/sh

readonly CYTRUS_URL="https://cytrus.cdn.ankama.com/cytrus.json"

while true; do
  watch --interval 60 --chgexit curl -s "${CYTRUS_URL}"

  curl "${CYTRUS_URL}" --output out
  python3 jsonmerge.py cytrus.json out | jq > tmp && mv tmp cytrus.json

  git config user.name "$(gh api /users/"${GITHUB_ACTOR}" | jq .name -r)"
  git config user.email "${GITHUB_ACTOR_ID}+${GITHUB_ACTOR}@users.noreply.github.com"
  git add cytrus.json
  git commit -m "Update cytrus.json"
  git push
done
