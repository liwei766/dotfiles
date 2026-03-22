# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/liwei/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
#autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi='/usr/local/bin/vim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/usr/local/opt/curl/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ===========================================
# zoxide — smarter cd
# ===========================================
eval "$(zoxide init zsh)"
alias cd="z"

# ===========================================
# fzf — fuzzy finder
# ===========================================
source <(fzf --zsh)

# Use fd for fzf (respects .gitignore, faster than find)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# fzf theme (gruvbox-inspired)
export FZF_DEFAULT_OPTS="
  --height 60%
  --layout=reverse
  --border=rounded
  --info=inline
  --prompt='  '
  --pointer='▶'
  --marker='✓'
  --bind='ctrl-d:half-page-down,ctrl-u:half-page-up'
  --bind='ctrl-y:execute-silent(echo {+} | pbcopy)'
  --color=bg+:#3c3836,bg:#282828,spinner:#fb4934,hl:#928374
  --color=fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934
  --color=marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934
"

# fzf + preview (bat for files, eza for dirs)
export FZF_CTRL_T_OPTS="
  --preview 'bat --style=numbers --color=always --line-range :300 {} 2>/dev/null || head -100 {}'
  --preview-window=right:50%:wrap
  --bind='ctrl-/:toggle-preview'
"
export FZF_ALT_C_OPTS="
  --preview 'lsd --tree --depth=2 --color=always {} 2>/dev/null || ls -la {}'
  --preview-window=right:50%:wrap
"

# ===========================================
# fd aliases
# ===========================================
alias ff='fd --type f'
alias fdir='fd --type d'

# ===========================================
# yazi — terminal file manager
# ===========================================
# cd into the directory yazi was in when you quit
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# ===========================================
# Editor
# ===========================================
export EDITOR="vim"
export VISUAL="vim"

# ===========================================
# lsd — modern ls with icons
# ===========================================
if command -v lsd &>/dev/null; then
  alias ls='lsd --group-directories-first'
  alias ll='lsd -la --group-directories-first'
  alias lt='lsd --tree --depth=3 --group-directories-first'
  alias la='lsd -a --group-directories-first'
  alias l='lsd -l --group-directories-first'
fi

# ===========================================
# bat — better cat
# ===========================================
if command -v bat &>/dev/null; then
  alias cat='bat --paging=never'
  alias catp='bat --plain --paging=never'
fi

# ===========================================
# delta — better git diffs (if available)
# ===========================================
if command -v delta &>/dev/null && ! git config --global core.pager &>/dev/null; then
  git config --global core.pager delta
  git config --global interactive.diffFilter 'delta --color-only'
  git config --global delta.navigate true
  git config --global delta.side-by-side true
  git config --global delta.line-numbers true
  git config --global delta.syntax-theme gruvbox-dark
  git config --global merge.conflictstyle diff3
  git config --global diff.colorMoved default
fi

# ===========================================
# ripgrep config
# ===========================================
if command -v rg &>/dev/null; then
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

# ===========================================
# lazygit alias
# ===========================================
if command -v lazygit &>/dev/null; then
  alias lg='lazygit'
fi

# ===========================================
# Pro aliases
# ===========================================
# Quick navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git shortcuts
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gds='git diff --staged'
alias glog='git log --oneline --graph --decorate -20'
alias gco='git checkout'
alias gsw='git switch'
alias gbr='git branch'

# Misc
alias ports='lsof -i -P -n | grep LISTEN'
alias ip='curl -s ifconfig.me'
alias reload='source ~/.zshrc'
alias path='echo $PATH | tr ":" "\n"'
alias brewup='brew update && brew upgrade && brew cleanup'

# ===========================================
# Pro functions
# ===========================================
# Create dir and cd into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# Extract any archive
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.tar.xz)  tar xJf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.7z)      7z x "$1" ;;
      *)         echo "'$1' — unknown archive format" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# fzf + git: interactive branch switcher
fgb() {
  local branch
  branch=$(git branch --all --sort=-committerdate | fzf --height 40% --reverse | sed 's/^[* ]*//' | sed 's|remotes/origin/||')
  [ -n "$branch" ] && git switch "$branch" 2>/dev/null || git checkout "$branch"
}

# fzf + git: interactive log viewer
fgl() {
  git log --oneline --graph --decorate --color=always |
    fzf --ansi --no-sort --reverse --height 80% \
      --preview 'echo {} | grep -o "[a-f0-9]\{7,\}" | head -1 | xargs git show --color=always' \
      --bind 'enter:execute(echo {} | grep -o "[a-f0-9]\{7,\}" | head -1 | xargs git show --color=always | less -R)'
}

# fzf + kill: interactive process killer
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m --height 40% --reverse | awk '{print $2}')
  [ -n "$pid" ] && echo "$pid" | xargs kill -${1:-9}
}
