#!/bin/sh

exec sed -E \
     -e 's!https?://(www.)?matroska.org/!/!g' \
     -e 's!^Table:!\nTable:!'
