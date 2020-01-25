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

" multiline commenting tools
map ,# :s/^/# /<CR>:nohlsearch<CR>
map ,/ :s/^/\/\/ /<CR>:nohlsearch<CR>
map ,> :s/^/> /<CR>:nohlsearch<CR>
map ," :s/^/\" /<CR>:nohlsearch<CR>
map ,% :s/^/% /<CR>:nohlsearch<CR>
map ,! :s/^/! /<CR>:nohlsearch<CR>
map ,; :s/^/; /<CR>:nohlsearch<CR>
map ,- :s/^/-- /<CR>:nohlsearch<CR>

" clear comments
map ,c :s/^\/\/ \\|^-- \\|^> \\|^[#"%!;] //<CR>:nohlsearch<CR>

" convenience abbreviations
abbr pyimport #!/usr/bin/env python
abbr pymain def main():<CR>print "Hello World!"<CR><BS><CR>if __name__ == "__main__":<CR>main()<CR><BS>
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

" enable omnicompletion for different languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" disable the Icon toolbar
set guioptions-=T
" disable the 'File >' menu
set guioptions-=m

" use w!! to write a file as sudo
" even if you forget to sudo
cmap w!! w !sudo tee % >/dev/null

" on Linux, opens nautilus to current directory
abbr cur !nautilus %:p:h

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

" remap F1 to pick a font
map <F1> :set guifont=*<CR>
" toggle file/folder tree
map <F2> :NERDTreeToggle<CR>
" toggle in-file navigation bar
map <F3> :Tagbar<CR>
" toggle undo history visualization
map <F4> :GundoToggle<CR>
" toggle undo history visualization
map <F5> :SyntasticToggleMode<CR>
" toggle line numbers
set nonumber
nnoremap <F6> :set nonumber!<CR>

set nospell
" toggle line wrapping
nnoremap <F7> :set wrap nolist linebreak!<CR>
" toggle spell checking
nnoremap <F8> :setlocal nospell! spelllang=en_us<CR>:set mousemodel=popup_setpos<CR>:set spellfile=~/.vim/spell/added.utf-8.add<CR>
" toggle distraction free mode
nnoremap <F9> :Goyo<CR>
" hit F7, F8, F9 for 'prose writing' mode
"
" quick save
inoremap <F12> <c-o>:w<cr>
nnoremap <F12> :w<cr>

" system clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Ctrl+Bksp for delete word
imap <C-BS> <C-W>

" leader keys
let mapleader = ","
let maplocalleader = "\\"

" check Python for style
autocmd FileType python map <buffer> <F12> :call Flake8()<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Shortcut to change directory to current file
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>


" Use the special symbols for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

nmap ;l :call ListTrans_toggle_format()<CR>
vmap ;l :call ListTrans_toggle_format('visual')<CR>

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
nmap <leader>md :LivedownPreview<CR>

" set fontsize plugin default 'large font' size
" access this with <Leader><Leader>0 (,,0)
let g:fontsize#defaultSize = 35

" help tmux work better with arrow keys
map <Esc>[B <Down>

" hotkey to clear searches
nmap <leader>q :nohlsearch<CR>

" hotkey to edit last file
nmap <leader>e :e#<CR>

" help tmux figure out terminal mode
if match($TERM, "screen") != -1
      set term=screen-256color
endif

if has('python3')
    let g:gundo_prefer_python3 = 1
endif

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {"mode": "passive"}
