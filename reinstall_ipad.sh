#!/bin/bash
# Plezy iOS rebuild + reinstall script for iPad (template — no hardcoded values)
# Run this every 7 days to refresh the free Apple Developer signing certificate.
# App settings and data are preserved across reinstalls.
#
# Prerequisites:
# - Flutter SDK available on PATH (e.g. ~/flutter/bin in your shell PATH)
# - A JDK (set JAVA_HOME below)
# - Xcode 16.x with an iOS runtime installed
# - iPad paired via USB and trusted (wireless works once paired)
#
# Required environment variables (none are hardcoded — set them for your machine):
#   IPAD_ID   your iPad device ID        -> xcrun devicectl list devices
#   TEAM_ID   your Apple Developer team ID (a free account works)
#   JAVA_HOME your JDK home              -> e.g. /Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
#
# Usage:
#   IPAD_ID=xxxx-xxxx TEAM_ID=YYYYYYYY JAVA_HOME=/path/to/jdk ./reinstall_ipad.sh

set -e

: "${IPAD_ID:?Set IPAD_ID to your iPad device ID — run: xcrun devicectl list devices}"
: "${TEAM_ID:?Set TEAM_ID to your Apple Developer team ID}"
: "${JAVA_HOME:?Set JAVA_HOME to your JDK home}"

export JAVA_HOME
export PATH="$JAVA_HOME/bin:$PATH"
command -v flutter >/dev/null 2>&1 || { echo "Error: 'flutter' not found in PATH" >&2; exit 1; }

# Auto-detect the project root from this script's location (run it from the repo root).
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$PROJECT_DIR"

echo "=== Step 1: Building IPA ==="
flutter build ipa --release 2>&1 | tail -5

echo ""
echo "=== Step 2: Exporting archive (development signing) ==="
cat > /tmp/export.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>method</key>
  <string>debugging</string>
  <key>teamID</key>
  <string>${TEAM_ID}</string>
  <key>signingStyle</key>
  <string>automatic</string>
  <key>compileBitcode</key>
  <false/>
</dict>
</plist>
EOF

xcodebuild -exportArchive \
  -archivePath build/ios/archive/Runner.xcarchive \
  -exportOptionsPlist /tmp/export.plist \
  -exportPath build/ios/ipa \
  -allowProvisioningUpdates 2>&1 | tail -3

IPA_PATH="$(ls "$PROJECT_DIR"/build/ios/ipa/*.ipa 2>/dev/null | head -1)"
if [ -z "$IPA_PATH" ]; then
  echo "No IPA found in build/ios/ipa/ — did the export fail?" >&2
  exit 1
fi

echo ""
echo "=== Step 3: Installing on iPad ($IPAD_ID) ==="
xcrun devicectl device install app --device "$IPAD_ID" "$IPA_PATH" 2>&1 | tail -5

echo ""
echo "=== Done! Plezy is installed on your iPad. ==="
echo "Settings and data are preserved."