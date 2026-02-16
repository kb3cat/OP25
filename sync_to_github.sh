#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/op25-logs/publish"
SRC="$HOME/op25-logs/data/talkgroups_state.csv"
DST="$REPO/talkgroups_state.csv"

cd "$REPO"
cp -f "$SRC" "$DST"

if ! git diff --quiet -- "$DST"; then
  git add "$DST"
  git commit -m "Update talkgroups_state.csv ($(date +%m/%d/%y\ %H:%M:%S))"
  git push
fi
