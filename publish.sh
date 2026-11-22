#!/usr/bin/env bash
# Usage: ./publish.sh "what changed"
set -e
cd "$(dirname "$0")"
msg="${*:-Update site}"
git add -A
if git diff --cached --quiet; then
  echo "Nothing to publish."
  exit 0
fi
git commit -m "$msg"
git push -u origin HEAD
echo "Pushed. Live in 1-2 minutes: https://outbound-flight.github.io"
