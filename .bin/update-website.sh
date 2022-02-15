#!/usr/bin/env bash

CWD="$(pwd)"
REPO_DIR="$(basename "$CWD")"
REPO_PARENT_DIR="$(basename "$(dirname "$CWD")")"

if [[ "$REPO_DIR" == "chateaumaxmin.info" ]] && [[ "$REPO_PARENT_DIR" == "_repos" ]] && [[ -d ../../chateaumaxmin.info ]]; then
	find . -mindepth 1 \
	       -maxdepth 1 \
	       -not -iname '.bin' \
	       -not -iname '.git' \
	       -not -iname '.gitignore' \
	       -not -iname '_config.yml' \
	       -exec rm -rf "{}" \;

	cp -rf ../../chateaumaxmin.info/* .
else
	echo "Unexpected execution directory"
	exit 1
fi
