#!/bin/sh

LAUNCH_AGENTS_DIR="$HOME/Library/LaunchAgents"

echo "[chezmoi] Reloading managed launch agents in: $LAUNCH_AGENTS_DIR"

# Get the list of managed files in LaunchAgents
chezmoi managed --exclude scripts | while IFS= read -r path; do
  case "$path" in
    Library/LaunchAgents/*.plist)
      plist="$HOME/$path"
      if [ -f "$plist" ]; then
        echo "[chezmoi] (Re)loading $plist"
        launchctl unload "$plist" >/dev/null 2>&1 || true
        launchctl load -w "$plist" >/dev/null 2>&1 || echo "[chezmoi] Failed to load: $plist"
      fi
      ;;
  esac
done
