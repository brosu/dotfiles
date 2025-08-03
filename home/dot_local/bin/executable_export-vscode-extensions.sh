#!/bin/sh

# Get chezmoi source path (your dotfiles repo root)
DOTFILES_DIR="$(chezmoi source-path)"

# Target path for the exported extensions list
EXT_FILE="$DOTFILES_DIR/private_Library/private_Application Support/Code/User/extensions.txt"

echo "[vscode] Exporting extensions to: $EXT_FILE"

# Create parent dir if needed
mkdir -p "$(dirname "$EXT_FILE")"

# Export installed extensions
code --list-extensions > "$EXT_FILE" 2>/dev/null

if [ $? -eq 0 ]; then
  echo "[vscode] Extension list updated."
else
  echo "[vscode] Failed to export extensions. Is VS Code CLI available?"
fi
