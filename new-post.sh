#!/usr/bin/env bash
# Usage: ./new-post.sh "Post title"
set -e
cd "$(dirname "$0")"
if [ -z "$1" ]; then echo 'Usage: ./new-post.sh "Post title"'; exit 1; fi
title="$*"
slug=$(printf '%s' "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')
[ -z "$slug" ] && slug=post
file="_posts/$(date +%Y-%m-%d)-$slug.md"
if [ -e "$file" ]; then echo "$file already exists"; exit 1; fi
printf -- '---\ntitle: "%s"\ndescription: ""\n---\n\n' "$title" > "$file"
echo "Created $file  (edit it, then run ./publish.sh \"Add post\")"
