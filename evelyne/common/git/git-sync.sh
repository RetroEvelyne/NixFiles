#!/usr/bin/env sh

git add .
git commit -am "$(date --iso-8601)"
git pull
git push
