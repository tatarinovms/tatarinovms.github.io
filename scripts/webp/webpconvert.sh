#!/bin/bash

#путь к папке с картиночкой
path="./images"
#Сам скрипт
find "$path" -type d -exec bash -c '
    for dir in "$@"; do
        current_dir="$(basename "$dir")"
        echo "Processing directory: $current_dir"
        for file in "$dir"/*.{jpg,jpeg,png}; do
            output="${file%.*}".webp
            cwebp -q 80 "$file" -o "$output"
            rm "$file"
        done
    done
' _ {} \;