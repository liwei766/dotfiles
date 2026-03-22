" ===========================================
" Pro Vim Config — iMac 27" 5K 2017
" Loaded AFTER amix/vimrc plugins_config.vim
" ===========================================

" -- Leader key
let mapleader = " "
let maplocalleader = ","

" -- Performance (Intel i5-7500)
set lazyredraw
set ttyfast
set updatetime=250
set timeoutlen=500
set regexpengine=1
set synmaxcol=300

" -- Search
set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault
nnoremap <leader><space> :nohlsearch<CR>
" Search visually selected text with //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" -- Mouse
set mouse=a

" -- UI
set number
set relativenumber
set cursorline
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes
set colorcolumn=80,120
set showmatch
set matchtime=2
set noshowmode
set laststatus=2
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.o,*.obj,*.pyc,*.class,*.swp,*~,*.DS_Store
set title
set titlestring=%f\ —\ vim

" -- Colors
if has('termguicolors')
  set termguicolors
endif
set background=dark
silent! colorscheme gruvbox

" -- Editing
set autoindent
set smartindent
set wrap
set linebreak
set breakindent
set showbreak=↪\
set backspace=indent,eol,start
set clipboard=unnamed
set completeopt=menuone,noselect,popup
set nojoinspaces
set formatoptions+=j

" -- Folding
set foldmethod=indent
set foldlevelstart=99
set nofoldenable
nnoremap <leader>Z za

" -- Splits
set splitbelow
set splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" -- Resize splits
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>_ :resize -5<CR>
nnoremap <leader>0 <C-w>=

" -- Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>

" -- Buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bl :ls<CR>
nnoremap <leader>bb :b#<CR>

" -- Quick save/quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>Q :qa!<CR>

" -- Move lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" -- Join lines without moving cursor
nnoremap J mzJ`z

" -- Keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap G Gzz

" -- Better indenting (stay in visual mode)
vnoremap < <gv
vnoremap > >gv

" -- Yank to end of line (consistent with D, C)
nnoremap Y y$

" -- Paste without losing register
xnoremap <leader>p "_dP

" -- Delete to black hole register (use X to avoid conflict with gitgutter)
nnoremap <leader>x "_d
vnoremap <leader>x "_d

" -- Quick access to config
nnoremap <leader>ve :e ~/.vimrc<CR>
nnoremap <leader>vm :e ~/.vim_runtime/my_configs.vim<CR>
nnoremap <leader>vs :source ~/.vimrc<CR>

" -- Quickfix navigation
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz

" -- Terminal
nnoremap <leader>tt :terminal<CR>
tnoremap <Esc> <C-\><C-n>

" -- Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" -- Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" -- Auto-resize splits on window resize
autocmd VimResized * wincmd =

" -- Highlight yanked text briefly
if exists('##TextYankPost')
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
endif

" -- Filetype-specific settings
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4
autocmd FileType javascript,typescript,json,yaml,html,css setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal wrap linebreak spell

" -- Undo persistence
if has('persistent_undo')
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=10000
  set undoreload=100000
  silent !mkdir -p ~/.vim/undodir
endif

" -- Disable swap files (use undo instead)
set noswapfile
set nobackup
set nowritebackup

" ===========================================
" Plugin Overrides (loaded after plugins_config.vim)
" ===========================================

" -- Lightline: gruvbox theme + enhanced sections
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ ['lineinfo'], ['percent'], ['filetype', 'fileencoding'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")&&""!=FugitiveHead()?" ".FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" -- NERDTree: show hidden, left side
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.DS_Store', '\.git$']
let g:NERDTreeWinSize = 30
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" -- GitGutter: enable by default, gruvbox signs
let g:gitgutter_enabled = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '~'
nnoremap <leader>gd :GitGutterToggle<CR>
nnoremap ]h :GitGutterNextHunk<CR>zz
nnoremap [h :GitGutterPrevHunk<CR>zz
nnoremap <leader>hp :GitGutterPreviewHunk<CR>
nnoremap <leader>hs :GitGutterStageHunk<CR>
nnoremap <leader>hu :GitGutterUndoHunk<CR>

" -- ALE: enhanced config
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['flake8', 'pyright'],
\   'go': ['go', 'golint', 'errcheck'],
\   'sh': ['shellcheck'],
\   'vim': ['vint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'python': ['black', 'isort'],
\   'go': ['gofmt'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\}
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_virtualtext_cursor = 'current'
nmap <silent> ]a <Plug>(ale_next_wrap)
nmap <silent> [a <Plug>(ale_prev_wrap)
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>al :ALELint<CR>
nnoremap <leader>ai :ALEInfo<CR>

" -- fzf.vim: full fuzzy integration (overrides CtrlP and MRU)
if executable('fzf')
  set rtp+=/usr/local/opt/fzf

  " Files (replaces CtrlP)
  nnoremap <leader>f :Files<CR>
  nnoremap <leader>F :Files ~<CR>

  " Grep with ripgrep
  if executable('rg')
    nnoremap <leader>rg :Rg<CR>
    nnoremap <leader>RG :Rg!<CR>
    " Grep word under cursor
    nnoremap <leader>rw :Rg <C-r><C-w><CR>
  endif

  " Buffers, history, lines
  nnoremap <leader>b :Buffers<CR>
  nnoremap <leader>h :History<CR>
  nnoremap <leader>/ :BLines<CR>
  nnoremap <leader>l :Lines<CR>

  " Commands, help, maps
  nnoremap <leader>: :Commands<CR>
  nnoremap <leader>? :Helptags<CR>
  nnoremap <leader>M :Maps<CR>

  " Git
  nnoremap <leader>gc :Commits<CR>
  nnoremap <leader>gb :BCommits<CR>
  nnoremap <leader>gs :GFiles?<CR>

  " fzf window layout
  let g:fzf_layout = { 'down': '40%' }
  let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

  " Use bat for preview if available
  if executable('bat')
    let $FZF_PREVIEW_COMMAND = 'bat --style=numbers --color=always --line-range :300 {}'
  endif
endif

" -- Fugitive shortcuts
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git pull<CR>
nnoremap <leader>gB :Git blame<CR>
nnoremap <leader>gL :Git log --oneline -20<CR>

" -- Grep with ripgrep (override plugins_config grepprg)
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif
