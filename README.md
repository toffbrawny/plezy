# Plezy

A beautiful Plex and Jellyfin client for Flutter, with client-side watchlist, Seer (Jellyseerr/Overseerr) integration, and StreamyStats AI recommendations.

Based on [Plezy](https://github.com/edde746/plezy) by edde746.

## Downloads

Download the latest release from [Releases](https://git.toffbrawny.com/toffbrawny/plezy/releases):

- **Android**: `Plezy-v3.0.0-arm64.apk` — sideload on your Android device
- **iPad/iOS**: `Plezy-v3.0.0-iPad.ipa` — sideload via Xcode (see below)

---

## iOS: Reinstall Every 7 Days

Free Apple Developer accounts only allow app installs for 7 days. After that, the app stops launching and must be reinstalled. **All your settings, downloads, Seer login, watchlist, and StreamyStats config are preserved across reinstalls** — only the signing certificate expires.

### Prerequisites (one-time setup)

1. **Xcode 16.2+** installed on your Mac
2. **iOS 18.2 Simulator Runtime** installed (Xcode → Settings → Platforms)
3. **Apple ID** added to Xcode (Xcode → Settings → Accounts → your free Apple ID)
4. **iPad paired** with your Mac (connect via USB once, trust the computer)
5. **Flutter SDK** at `~/flutter`
6. **Java (Amazon Corretto 21)** at `~/Library/Java/JavaVirtualMachines/`

### Quick Reinstall (every 7 days)

1. Make sure your iPad is on the same Wi-Fi network as your Mac (or connected via USB)
2. Open Terminal and run:

```bash
cd /path/to/plezy
./reinstall_ipad.sh
```

3. Wait ~3 minutes for the build + install to complete
4. The app is refreshed — all your data and settings are preserved

### What the script does

The `reinstall_ipad.sh` script automates three steps:

1. **Builds the IPA** — `flutter build ipa --release`
2. **Exports the archive** — uses development signing with your free Apple ID team
3. **Installs on iPad** — `xcrun devicectl device install app` over Wi-Fi or USB

### Manual reinstall (if the script fails)

If the script doesn't work, do it step by step:

```bash
# 1. Set up environment
export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$HOME/flutter/bin:$PATH"

# 2. Go to the project
cd /path/to/plezy

# 3. Build the IPA
flutter build ipa --release

# 4. Export with development signing
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
  -allowProvisioningUpdates

# 5. Install on iPad (wireless or USB)
xcrun devicectl device install app \
  --device YOUR_IPAD_ID \
  build/ios/ipa/Plezy.ipa
```

### Troubleshooting

- **"No Account for Team"** — Open Xcode → Settings → Accounts, make sure your Apple ID is listed and has valid credentials
- **"iPad not found"** — Connect via USB, unlock the iPad, and ensure it's trusted. Wireless debugging works once paired
- **"iOS 18.2 is not installed"** — Install the iOS 18.2 Simulator Runtime from Xcode → Settings → Platforms
- **Build errors** — Run `flutter clean` then retry
- **App won't launch after 7 days** — This is expected with free accounts. Just run `./reinstall_ipad.sh` again

---

## Android: Install

Download `Plezy-v3.0.0-arm64.apk` from the releases page and sideload on your device. No reinstallation needed — the app stays installed permanently.

---

## Features

- **Watchlist** — bookmark movies/shows/seasons/episodes, stored locally, works offline
- **Seer Integration** — connect to Jellyseerr/Overseerr to request media, browse trending/genres/studios/networks
- **StreamyStats AI Recommendations** — vector-based movie & series recommendations in the Search tab
- **Full Plex & Jellyfin support** — browse, play, download, manage

## Built With

- Flutter 3.44.2
- Dart 3.12.2
- Drift (SQLite)
- Provider state management
- MPV player
- Material Symbols icons