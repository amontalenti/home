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
map <F4> :emenu <C-Z>

" some color overrides
hi PmenuSel ctermfg=0 ctermbg=3
hi perlComment ctermfg=0 ctermbg=1

" for quick script dev cycle
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>

" quick F3 execute commands
map <F3> :!%<CR>
imap <F3> <ESC>:!%<CR>

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

" enable spell-checking with F7
map <F7> <Esc>:setlocal spell spelllang=en_us<CR>:set mousemodel=popup_setpos<CR>:set spellfile=~/.vim/spell/added_words.utf-8.add<CR>
" map <F7> <Esc>:setlocal nospell<CR>

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
set number
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
endif

" enable omnicompletion for different languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" disable the toolbar
set guioptions-=T

" use w!! to write a file as sudo 
" even if you forget to sudo
cmap w!! w !sudo tee % >/dev/null

" on Linux, opens nautilus to current directory
abbr cur !nautilus %:p:h

" load pathogen for other plugin management
call pathogen#infect()