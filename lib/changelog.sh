#!/bin/bash

node lib/changelog >CHANGELOG.md
git add CHANGELOG.md
git diff-index --quiet HEAD || git commit -m "changelog"
git push
