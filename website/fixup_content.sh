#!/bin/sh

exec sed -Ee 's!https?://(www.)?matroska.org/!/!g'
