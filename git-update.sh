#!/bin/bash

if [ "$1" != "" ]; then
  git add -A > /dev/null
  git commit -m "$1" > /dev/null
  gitout=$(git push origin master 2>&1)
  echo "$gitout" | tail -n4
else
  git add -A > /dev/null
  git commit -m "Update" > /dev/null
  gitout=$(git push origin master 2>&1)
  echo "$gitout" | tail -n4
fi
