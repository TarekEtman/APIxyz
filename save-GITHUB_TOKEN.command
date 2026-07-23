#!/bin/bash
# Saves GITHUB_TOKEN to ~/apixyz-secrets.env (chmod 600). Double-click to run.
set -euo pipefail

KEY="GITHUB_TOKEN"
ENVFILE="$HOME/apixyz-secrets.env"

# Ensure the secrets file exists and is private.
touch "$ENVFILE"
chmod 600 "$ENVFILE"

echo "Paste your $KEY value, then press Return."
echo "(It won't be shown on screen.)"
printf "%s = " "$KEY"
read -rs VALUE
echo

if [ -z "${VALUE:-}" ]; then
  echo "No value entered. Nothing saved."
  exit 1
fi

# Basic sanity check: fine-grained PATs start with github_pat_
case "$VALUE" in
  github_pat_*) : ;;
  *) echo "Warning: value doesn't start with 'github_pat_' (fine-grained PAT prefix). Saving anyway." ;;
esac

# Upsert: remove any existing KEY line, then append the new one.
TMP="$(mktemp)"
grep -v -E "^${KEY}=" "$ENVFILE" > "$TMP" || true
mv "$TMP" "$ENVFILE"
printf '%s=%s\n' "$KEY" "$VALUE" >> "$ENVFILE"
chmod 600 "$ENVFILE"

echo "Saved $KEY to $ENVFILE"
echo "Done. You can close this window."
