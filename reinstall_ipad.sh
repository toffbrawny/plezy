#!/bin/bash
# Plezy iOS rebuild + reinstall script for iPad
# Run this every 7 days to refresh the free developer signing certificate
# App settings and data are preserved across reinstalls
#
# Prerequisites (already set up):
# - Flutter SDK at ~/flutter
# - Java (Amazon Corretto 21) at ~/Library/Java/JavaVirtualMachines/
# - Xcode 16.2 with iOS 18.2 runtime
# - iPad connected via USB and trusted

set -e

export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$HOME/flutter/bin:$PATH"

PROJECT_DIR="/path/to/plezy"
IPAD_ID="YOUR_IPAD_ID"
IPA_PATH="$PROJECT_DIR/build/ios/ipa/Plezy.ipa"

echo "=== Step 1: Building IPA ==="
cd "$PROJECT_DIR"
flutter build ipa --release 2>&1 | tail -5

echo ""
echo "=== Step 2: Exporting archive (development signing) ==="
cat > /tmp/export.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>method</key>
  <string>debugging</string>
  <key>teamID</key>
  <string>YOUR_TEAM_ID</string>
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

echo ""
echo "=== Step 3: Installing on iPad ==="
xcrun devicectl device install app --device "$IPAD_ID" "$IPA_PATH" 2>&1 | tail -5

echo ""
echo "=== Done! Plezy is installed on your iPad. ==="
echo "Settings and data are preserved."