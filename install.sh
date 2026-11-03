#!/bin/sh
# Installs macItRun (https://github.com/matheusrosa27/macItRun-runtime).
# Downloads the latest published release, checks its SHA-256 and copies the app to Applications.
#   curl -fsSL https://raw.githubusercontent.com/matheusrosa27/macItRun-runtime/main/install.sh | sh
set -eu

REPO="matheusrosa27/macItRun-runtime"
BASE="https://github.com/$REPO/releases/latest/download"

fail() { echo "macItRun: $1" >&2; exit 1; }

[ "$(uname -s)" = Darwin ] || fail "macItRun only runs on macOS."
[ "$(uname -m)" = arm64 ] || fail "macItRun needs a Mac with Apple silicon."
major=$(sw_vers -productVersion | cut -d. -f1)
[ "$major" -ge 26 ] || fail "macItRun needs macOS 26 or later."

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

echo "Downloading macItRun…"
curl -fL --progress-bar -o "$tmp/macItRun.zip" "$BASE/macItRun.zip"
curl -fsSL -o "$tmp/macItRun.zip.sha256" "$BASE/macItRun.zip.sha256"

expected=$(awk '{print $1}' "$tmp/macItRun.zip.sha256")
actual=$(shasum -a 256 "$tmp/macItRun.zip" | awk '{print $1}')
[ -n "$expected" ] && [ "$expected" = "$actual" ] || fail "SHA-256 does not match; nothing was installed."

ditto -x -k "$tmp/macItRun.zip" "$tmp/app"
[ -d "$tmp/app/macItRun.app" ] || fail "the download is not a macItRun package; nothing was installed."

dest=/Applications
[ -w "$dest" ] || { dest="$HOME/Applications"; mkdir -p "$dest"; }

# Quit a running copy before replacing it.
osascript -e 'quit app id "app.macitrun.macItRun"' >/dev/null 2>&1 || true
rm -rf "$dest/macItRun.app"
ditto "$tmp/app/macItRun.app" "$dest/macItRun.app"

echo "Installed: $dest/macItRun.app"
open "$dest/macItRun.app"
