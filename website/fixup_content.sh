#!/bin/sh

title="$1"

(
  if test -n "$title"; then
    printf -- '---\ntitle: %s\n---\n' "$title"
  fi
  cat
) | sed -E \
     -e 's!https?://(www.)?matroska.org/!/!g' \
     -e 's!^Table:!\nTable:!'
