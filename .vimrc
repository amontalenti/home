" F1 - F12 Hotkeys
" ----------------

" hit F1 to pick a font
map <F1> :set guifont=*<CR>
" hit F2 for file/folder tree
map <F2> :NERDTreeToggle<CR>
" hit F3 for tag bar
map <F3> :Tagbar<CR>
" hit F4 for undo history
map <F4> :GundoToggle<CR>
" hit F5 for syntax highlighting
map <F5> :SyntasticToggleMode<CR>
set nonumber
" hit F6 for line numbers
nnoremap <F6> :set nonumber!<CR>
set nospell
" ** hit F7, F8, F9 for 'prose writing' mode **
" hit F7 for line wrapping
nnoremap <F7> :set wrap nolist linebreak!<CR>
" hit F8 for spell checking
nnoremap <F8> :setlocal nospell! spelllang=en_us<CR>:set mousemodel=popup_setpos<CR>:set spellfile=~/.vim/spell/added.utf-8.add<CR>
" hit F9 for distraction-free writing mode
nnoremap <F9> :Goyo<CR>
" integrate goyo and limelight.vim
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" hit F10 for Python style check
autocmd FileType python map <buffer> <F10> :call Flake8()<CR>
" reserve F11 for full-screen at WM level
" hit F12 for quick save
inoremap <F12> <c-o>:w<cr>
nnoremap <F12> :w<cr>

" Other Hotkeys and Shortcuts
" ---------------------------

" leader keys
let mapleader = ","
let maplocalleader = "\\"

" ,,0 to jump to a big font in gVim
" ,,= to set a font with +/- in gVim
let g:fontsize#defaultSize = 26

" :w!! to write a file as sudo
cmap w!! w !sudo tee % >/dev/null

" :cur will open current dir in Nautilus (on Desktop linux)
abbr cur !nautilus %:p:h

" ,l to toggle list mode
nmap <leader>l :set list!<CR>

" ,lt for comma-separated list to bullet point transform
nmap <leader>lt :call ListTrans_toggle_format()<CR>
vmap <leader>lt :call ListTrans_toggle_format('visual')<CR>

" ,cd to change director to current file
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>

" ,md to preview Markdown in browser
nmap <leader>md :LivedownPreview<CR>

" ,q to clear searches and highlights
nmap <leader>q :nohlsearch<CR>

" ,c to clear comments
map <leader>c :s/^\/\/ \\|^-- \\|^> \\|^[#"%!;] //<CR>:nohlsearch<CR>

" multiline commenting tools
map <leader># :s/^/# /<CR>:nohlsearch<CR>
map <leader>/ :s/^/\/\/ /<CR>:nohlsearch<CR>
map <leader>> :s/^/> /<CR>:nohlsearch<CR>
map <leader>" :s/^/\" /<CR>:nohlsearch<CR>
map <leader>% :s/^/% /<CR>:nohlsearch<CR>
map <leader>! :s/^/! /<CR>:nohlsearch<CR>
map <leader>; :s/^/; /<CR>:nohlsearch<CR>
map <leader>- :s/^/-- /<CR>:nohlsearch<CR>

" Configure vim plugins
" ---------------------

" load pathogen for other plugin management
call pathogen#infect()

filetype on
filetype indent plugin on

" default indentation options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" fix smartindent's stupidness with '#'
inoremap # X#

" support manpages
runtime! ftplugin/man.vim

" search highlighting
set hls

" autosave before external command
set autowrite

" smarter backspacing
set backspace=indent,eol,start

" extended regular expressions
set magic

" enable console mouse
set mouse=a

" enable status line
set laststatus=2
set ruler

syntax on

" mail files have 72 char limit
autocmd FileType mail set tw=72

" fix backspace mapping
imap <Del> <BS>
map <Del> <BS>

" wildmenu, for console menuing
set wildmenu
set wildmode=longest,full
source $VIMRUNTIME/menu.vim
set cpo-=<
set wcm=<C-Z>

" some color overrides
hi PmenuSel ctermfg=0 ctermbg=3
hi perlComment ctermfg=0 ctermbg=1

" convenience abbreviations
abbr pyimport #!/usr/bin/env python3
abbr pymain def main():<CR>print("Hello World!")<CR><BS><CR>if __name__ == "__main__":<CR>main()<CR><BS>
abbr sysout System.out.println

" get better up/down support
" so that visual line breaks are actually treated like lines
noremap <up> g<up>
noremap <down> g<down>

" vertical splitting when using :Explore
let g:netrw_browse_split=2

" disables annoying audio bell
set vb t_vb=

" Windows-specific settings
" makes vim terminal work (pageup/pagedown for example)
if $OS == "Windows_NT"
	set term=cygwin
endif

" gui font
set guifont="Monospace 10"

" prevent annoying close behavior for open buffers
set hidden

set copyindent
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set notitle

" fallback color scheme if we don't have colors available
colo desert

" preferred color scheme with colors
if &t_Co >= 256 || has("gui_running")
    colo mustang
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" enable omnicompletion for Python
"
" TODO: this python3complete.vim autoload script hasn't been
" modified since 2009, and it actually has a bug where imports
" of this style:
"
"   from concurrent.futures import (Future, ThreadPoolExecutor, ...)
"
" ... are simply not supported. Might be worth fixing and sending
" upstream. Also, oddly the script is split into two separate
" completion functions, pythoncomplete#Complete (python2) and
" python3complete#Complete (python3), even though there is only
" one vim FileType (python).
autocmd FileType python set omnifunc=python3complete#Complete

" enable omnicompletion for other languages beyond Python
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" TODO: apparently there is a default 'syntax completer' that one
" can set up as a fallback to the above lang-specific ones.

" disable the Icon toolbar
set guioptions-=T
" disable the 'File >' menu
set guioptions-=m

" Add the virtualenv's site-packages to vim path
" show current virtualenv
let g:virtualenv_stl_format='[Venv(%n)]'
au FileType python setlocal statusline=%<%f\ %h%m%r%{VirtualEnvStatusline()}%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
let g:virtualenv_auto_activate=1
" make virtualenv plugin work with pyenv directory
let g:virtualenv_directory = '~/.pyenv/versions'

" open gundo on right (no conflict with NERDTree)
let g:gundo_right=1

let NERDTreeIgnore = ['\.pyc$']

" disable jedi auto init
let g:jedi#auto_initialization = 0

" allow ropevim autocompletion
let ropevim_vim_completion=1
let ropevim_extended_complete=1

" system clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Ctrl+Bksp for delete word
imap <C-BS> <C-W>

" Use the special symbols for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Visual blocks can now be dragged around
vmap <expr> h DVB_Drag('left')
vmap <expr> l DVB_Drag('right')
vmap <expr> j DVB_Drag('down')
vmap <expr> k DVB_Drag('up')
vmap <expr> D DVB_Duplicate()
let g:DVB_TrimWS = 1

" make VimClojure work a little more nicely
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" make Ctrl-P must faster for git projects
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard --exclude=node_modules/', 'find %s -type f']
let g:ctrlp_use_caching = 0

let g:used_javascript_libs = 'jquery,angularjs'

" backup files
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" persistent undo
set undofile
set undodir=~/.vim/undodir/

if filereadable(expand("~/.simplenoterc"))
    source ~/.simplenoterc
endif

" markdown live preview
let g:livedown_open = 1
let g:livedown_port = 9337
let g:livedown_browser = "google-chrome"

" help tmux work better with arrow keys
map <Esc>[B <Down>

" help tmux figure out terminal mode
if match($TERM, "screen") != -1
      set term=screen-256color
endif

if has('python3')
    let g:gundo_prefer_python3 = 1
endif

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {"mode": "passive"}

" add zig support to tagbar
" from: https://github.com/preservim/tagbar/wiki#zig
let g:tagbar_type_zig = {
    \ 'ctagstype': 'zig',
    \ 'kinds' : [
        \'f:functions',
        \'s:structs',
        \'e:enums',
        \'u:unions',
        \'E:errors'
    \]
    \}
