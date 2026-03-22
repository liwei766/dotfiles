# Pro Tools Cheat Sheet — iMac 2017

## Shell Aliases

| Alias | Command |
|-------|---------|
| `ls` | `lsd` with icons |
| `ll` | `lsd -la` long list |
| `lt` | `lsd --tree` tree view |
| `cat` | `bat` with syntax highlighting |
| `catp` | `bat` plain (no decorations) |
| `lg` | `lazygit` TUI git client |
| `gs` | `git status -sb` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gp` | `git push` |
| `gl` | `git pull` |
| `gd` | `git diff` |
| `gds` | `git diff --staged` |
| `glog` | `git log --oneline --graph` |
| `gco` | `git checkout` |
| `gsw` | `git switch` |
| `gbr` | `git branch` |
| `ff` | `fd` find files |
| `fdir` | `fd` find directories |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `reload` | `source ~/.zshrc` |
| `ports` | show listening ports |
| `brewup` | brew update + upgrade + cleanup |

## Shell Functions

| Function | Description |
|----------|-------------|
| `y` | yazi file manager (cd on quit) |
| `z <dir>` | zoxide smart cd |
| `zi` | zoxide interactive (fzf) |
| `mkcd <dir>` | mkdir + cd |
| `extract <file>` | extract any archive |
| `fgb` | fzf git branch switcher |
| `fgl` | fzf git log viewer |
| `fkill` | fzf process killer |

## fzf (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `Ctrl-T` | Search files (bat preview) |
| `Ctrl-R` | Search command history |
| `Alt-C` | Search directories (tree preview) |
| `Ctrl-/` | Toggle preview panel |
| `Ctrl-D/U` | Scroll preview half-page |
| `Ctrl-Y` | Copy selection to clipboard |

## Ghostty

| Key | Action |
|-----|--------|
| `Cmd+T` | New tab |
| `Cmd+W` | Close tab/split |
| `Cmd+1-8` | Go to tab N |
| `Cmd+9` | Last tab |
| `Cmd+Shift+[/]` | Previous/next tab |
| `Cmd+D` | Split right |
| `Cmd+Shift+D` | Split down |
| `Cmd+Alt+Arrows` | Navigate splits |
| `Cmd+Shift+Arrows` | Resize splits |
| `Cmd+Shift+Enter` | Zoom split |
| `Cmd+Shift+E` | Equalize splits |
| `Cmd+K` | Clear screen |
| `Cmd++/-/0` | Font size |
| `Cmd+Shift+,` | Reload config |
| `Cmd+,` | Open config |

## Vim — Leader is `Space`

### Files & Search (fzf.vim)

| Key | Action |
|-----|--------|
| `<space>f` | Find files |
| `<space>F` | Find files from ~ |
| `<space>rg` | Ripgrep search |
| `<space>rw` | Ripgrep word under cursor |
| `<space>b` | Buffers |
| `<space>h` | File history |
| `<space>/` | Search current buffer |
| `<space>l` | Search all open buffers |
| `<space>:` | Commands |
| `<space>?` | Help tags |
| `<space>gs` | Git status files |
| `<space>gc` | Git commits |
| `<space>gb` | Git buffer commits |

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl-D/U` | Half-page down/up (centered) |
| `n/N` | Next/prev search (centered) |
| `H/L` | Previous/next tab |
| `Ctrl-H/J/K/L` | Navigate splits |
| `]q/[q` | Next/prev quickfix |
| `]h/[h` | Next/prev git hunk |
| `]a/[a` | Next/prev ALE diagnostic |

### Git (Fugitive + GitGutter)

| Key | Action |
|-----|--------|
| `<space>gg` | Git status |
| `<space>gB` | Git blame |
| `<space>gp` | Git push |
| `<space>gl` | Git pull |
| `<space>gL` | Git log (last 20) |
| `<space>gd` | Toggle GitGutter |
| `<space>hp` | Preview hunk |
| `<space>hs` | Stage hunk |
| `<space>hu` | Undo hunk |

### Editing

| Key | Action |
|-----|--------|
| `<space>w` | Save |
| `<space>q` | Quit |
| `<space>x` | Save & quit |
| `<space>Q` | Force quit all |
| `J` (visual) | Move lines down |
| `K` (visual) | Move lines up |
| `</>` (visual) | Indent/outdent (stay selected) |
| `Y` | Yank to end of line |
| `<space>p` (visual) | Paste without losing register |
| `<space>Z` | Toggle fold |

### Panels

| Key | Action |
|-----|--------|
| `<space>e` | Toggle NERDTree |
| `<space>nf` | Find current file in NERDTree |
| `<space>tt` | Open terminal |
| `Esc` (terminal) | Exit terminal mode |

### ALE (Linting)

| Key | Action |
|-----|--------|
| `<space>af` | Auto-fix file |
| `<space>al` | Lint file |
| `<space>ai` | ALE info |

### Config

| Key | Action |
|-----|--------|
| `<space>vm` | Edit my_configs.vim |
| `<space>ve` | Edit .vimrc |
| `<space>vs` | Reload .vimrc |

## VS Code — Vim Mode, Leader is `Space`

| Key | Action |
|-----|--------|
| `<space>f` | Quick open file |
| `<space>rg` | Find in files |
| `<space>e` | Toggle sidebar |
| `<space>w` | Save |
| `<space>q` | Close |
| `H/L` | Previous/next editor |
| `<space>bb` | Previous editor |
| `<space>bd` | Close editor |
| `<space>gg` | Source control |
| `<space>gB` | Toggle git blame |
| `<space>ca` | Quick fix |
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Show hover |
| `]h/[h` | Next/prev change |
| `]a/[a` | Next/prev diagnostic |
| `jk` (insert) | Escape |
| `Cmd+Alt+Arrows` | Navigate split groups |
| `Ctrl+J/K` | Navigate suggestions |

## yazi (File Manager)

| Key | Action |
|-----|--------|
| `h/l` | Parent / open dir |
| `j/k` | Down / up |
| `gg/G` | Top / bottom |
| `gh` | Go home |
| `gd` | Go Desktop |
| `gD` | Go Downloads |
| `gc` | Go ~/.config |
| `gp` | Go ~/Projects |
| `Enter` | Open file |
| `O` | Open in VS Code |
| `a` | Create file/dir |
| `r` | Rename |
| `d` | Delete |
| `y/p/x` | Yank / paste / cut |
| `v/V` | Select / visual mode |
| `.` | Toggle hidden files |
| `/` | Find |
| `f` | Filter |
| `sn/ss/sm/se` | Sort: name/size/modified/ext |
| `cp` | Copy absolute path |
| `cn` | Copy filename |
| `[/]` | Previous / next tab |
| `tn/tc` | New / close tab |
| `!` | Open shell |
| `q` | Quit |

## lazygit

| Key | Action |
|-----|--------|
| `space` | Stage/unstage file |
| `a` | Stage all |
| `c` | Commit |
| `P` | Push |
| `p` | Pull |
| `1-5` | Switch panels |
| `enter` | View file/expand |
| `d` | Discard changes |
| `b` | Branch menu |
| `n` | New branch |
| `?` | Help |
| `q` | Quit |
