#!/bin/bash

./replace.pl index.md > index_colored.md

cat ./head.tmpl > index.html
pandoc -f markdown_strict -t html index_colored.md >> index.html
cat ./tail.tmpl >> index.html

