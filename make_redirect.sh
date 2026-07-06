#!/bin/bash
# make_redirect.sh — Generate a meta-refresh redirect page.
#
# Usage:
#   ./make_redirect.sh <path> <target_url> <label>
# Example:
#   ./make_redirect.sh go/s1-female "https://www.lancers.jp/work/detail/1234567" "女性用"
#
# Writing the URL via this script guarantees that all three occurrences
# (meta refresh, JS fallback, manual link) stay in sync.

set -eu

if [ $# -ne 3 ]; then
  echo "Usage: $0 <path> <target_url> <label>" >&2
  exit 1
fi

DIR=$1
URL=$2
LABEL=$3

mkdir -p "$DIR"

cat > "$DIR/index.html" << HTML
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Keep this page out of search results -->
  <meta name="robots" content="noindex">
  <!-- 1) Primary redirect: works even with JavaScript disabled -->
  <meta http-equiv="refresh" content="0; url=$URL">
  <!-- 2) JS fallback: location.replace() keeps this page out of
          browser history, preventing back-button loops -->
  <script>location.replace("$URL");</script>
  <title>移動中...</title>
</head>
<body>
  <!-- 3) Last resort: manual link if both mechanisms fail -->
  <p>${LABEL}の募集ページへ移動しています。<br>
     自動で移動しない場合は <a href="$URL">こちら</a> をクリックしてください。</p>
</body>
</html>
HTML

echo "Created $DIR/index.html -> $URL"
