#!/bin/bash
# tom at nine ch - 30.07.2023

if [ -z "$1" ]; then
  echo "./new.sh name"
  exit
fi

hugo new content/posts/$1/index.md
