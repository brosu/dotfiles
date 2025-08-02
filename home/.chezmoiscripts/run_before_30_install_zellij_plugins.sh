#!/bin/sh

PLUGIN_DIR="$HOME/.config/zellij/plugins"
PLUGIN_NAME="vim-zellij-navigator.wasm"
PLUGIN_PATH="$PLUGIN_DIR/$PLUGIN_NAME"
PLUGIN_URL="https://github.com/hiasr/vim-zellij-navigator/releases/download/0.3.0/$PLUGIN_NAME"

mkdir -p "$PLUGIN_DIR"

  echo "⬇️  Downloading $PLUGIN_NAME..."
  curl -L -o "$PLUGIN_PATH" "$PLUGIN_URL"
  if [ $? -eq 0 ]; then
    echo "✅ Download complete: $PLUGIN_PATH"
  else
    echo "❌ Failed to download plugin"
    exit 1
  fi
