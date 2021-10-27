#!/bin/sh

find . -type f \( -name "*.pas" -o -name "*.cpp" -o -name "*.cs" \) | while read file; do enca -L russian -x UTF-8 "$file"; done;
