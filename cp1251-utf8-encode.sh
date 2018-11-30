#!/bin/sh

find . -type f -name *.pas -print | while read file; do
    iconv -f cp1251 -t utf8 "$file" > "$file.new" &&
    mv -f "$file.new" "$file"
done
