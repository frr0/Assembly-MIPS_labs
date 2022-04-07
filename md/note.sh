#!/bin/sh

name=$1

f_md=$name.md
f_pdf=$name.pdf

pandoc -s -i \
    --pdf-engine=xelatex \
    -V geometry:"top=2cm, bottom=2cm, left=2cm, right=2cm" \
    -V colorlinks \
    --highlight-style zenburn \
    -V urlcolor=NavyBlue \
    --toc -N \
    -o $f_pdf $f_md +RTS -Ksize -RTS

# stuff to add
# 
# latex packges to put in the md file:
# - \usepackage{mathtools}
# - \usepackage{multicol}
