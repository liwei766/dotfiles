# dotfiles — iMac 27" 5K 2017

Pro-level terminal setup with consistent gruvbox theme across all tools.

## Tools

| Tool | Version | Purpose |
|------|---------|---------|
| Ghostty | 1.3.1 | Terminal emulator |
| Vim | 9.2 | Editor (amix/vimrc + custom) |
| VS Code | 1.112.0 | GUI editor (Vim mode) |
| fzf | 0.70.0 | Fuzzy finder |
| fd | 10.4.2 | Fast find replacement |
| ripgrep | 14.1.1 | Fast grep replacement |
| bat | 0.24.0 | cat with syntax highlighting |
| lsd | 1.2.0 | ls with icons |
| delta | 0.18.2 | Git diff viewer |
| lazygit | 0.44.1 | TUI git client |
| zoxide | 0.9.9 | Smart cd |
| yazi | 26.1.22 | Terminal file manager |
| glow | 2.1.1 | Markdown renderer |

## Structure

```
dotfiles/
├── .config/
│   ├── ghostty/config      # Terminal config
│   ├── bat/config           # Syntax highlighting config
│   └── yazi/                # File manager config
│       ├── yazi.toml
│       ├── keymap.toml
│       └── theme.toml
├── vim/
│   └── my_configs.vim       # Vim config (for ~/.vim_runtime/)
├── vscode/
│   ├── settings.json        # VS Code settings
│   ├── keybindings.json     # VS Code keybindings
│   └── extensions.txt       # VS Code extensions list
├── git/
│   └── .gitconfig-delta     # Git delta pager config
├── .zshrc                   # Shell config
├── .fdignore                # fd global ignore
├── .ripgreprc               # ripgrep config
├── cheatsheet.md            # Quick reference
├── install.sh               # Symlink installer
└── README.md
```

## Install

```bash
git clone https://github.com/liwei766/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## Key Bindings

Leader key is `Space` in both Vim and VS Code (Vim mode).

See [cheatsheet.md](cheatsheet.md) for full reference.

## Theme

Gruvbox Dark Hard everywhere — Ghostty, Vim, VS Code, bat, delta, fzf, yazi.
