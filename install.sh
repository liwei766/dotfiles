#!/bin/bash
# ===========================================
# Dotfiles installer — creates symlinks
# ===========================================

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1" dst="$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  backup: $dst → ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  ln -sf "$src" "$dst"
  echo "  linked: $dst → $src"
}

echo "=== Dotfiles Installer ==="
echo ""

# Shell
echo "[shell]"
link "$DOTFILES/.zshrc" "$HOME/.zshrc"
link "$DOTFILES/.fdignore" "$HOME/.fdignore"
link "$DOTFILES/.ripgreprc" "$HOME/.ripgreprc"

# Ghostty
echo "[ghostty]"
mkdir -p "$HOME/.config/ghostty"
link "$DOTFILES/.config/ghostty/config" "$HOME/.config/ghostty/config"

# bat
echo "[bat]"
mkdir -p "$HOME/.config/bat"
link "$DOTFILES/.config/bat/config" "$HOME/.config/bat/config"

# yazi
echo "[yazi]"
mkdir -p "$HOME/.config/yazi"
link "$DOTFILES/.config/yazi/yazi.toml" "$HOME/.config/yazi/yazi.toml"
link "$DOTFILES/.config/yazi/keymap.toml" "$HOME/.config/yazi/keymap.toml"
link "$DOTFILES/.config/yazi/theme.toml" "$HOME/.config/yazi/theme.toml"

# Vim (assumes amix/vimrc is installed)
echo "[vim]"
if [ -d "$HOME/.vim_runtime" ]; then
  link "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"
  link "$DOTFILES/vim/my_configs.vim" "$HOME/.vim_runtime/my_configs.vim"
  # Install fzf.vim plugin if not present
  if [ ! -d "$HOME/.vim_runtime/my_plugins/fzf.vim" ]; then
    echo "  installing fzf.vim plugin..."
    git clone --depth 1 https://github.com/junegunn/fzf.vim "$HOME/.vim_runtime/my_plugins/fzf.vim"
  fi
else
  echo "  skip: ~/.vim_runtime not found"
  echo "  install amix/vimrc first: git clone --depth 1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh"
fi

# VS Code
echo "[vscode]"
VSCODE_DIR="$HOME/Library/Application Support/Code/User"
if [ -d "$VSCODE_DIR" ]; then
  link "$DOTFILES/vscode/settings.json" "$VSCODE_DIR/settings.json"
  link "$DOTFILES/vscode/keybindings.json" "$VSCODE_DIR/keybindings.json"
  echo "  installing extensions..."
  while IFS= read -r ext; do
    code --install-extension "$ext" --force 2>/dev/null || true
  done < "$DOTFILES/vscode/extensions.txt"
else
  echo "  skip: VS Code not found"
fi

# Git delta
echo "[git]"
echo "  To add delta config, run:"
echo "  git config --global include.path ~/dotfiles/git/.gitconfig-delta"

echo ""
echo "Done! Run 'source ~/.zshrc' to reload shell."
