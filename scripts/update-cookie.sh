#!/bin/bash
# Update GitHub session cookie for readme-waves auto-upload
# Usage: ./scripts/update-cookie.sh

set -e

REPO="TakalaWang/TakalaWang"

echo "=== Update GitHub Session Cookie ==="
echo ""
echo "Steps:"
echo "  1. Open Chrome → github.com (make sure you're logged in)"
echo "  2. Press F12 → Application tab → Cookies → github.com"
echo "  3. Find 'user_session' → copy the Value"
echo ""
read -rsp "Paste cookie value (hidden): " cookie
echo ""

if [ -z "$cookie" ]; then
  echo "Error: empty cookie"
  exit 1
fi

echo "$cookie" | gh secret set GH_COOKIE --repo "$REPO" --body -
echo ""
echo "Cookie updated! The daily Action should work now."
echo "You'll get an email notification when it expires again."
