if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead *.rest setf rst
    au! BufNewFile,BufRead *.j2,*.jinja setf htmljinja
    au! BufNewFile,BufRead *.zsh-theme setf zsh
    au! BufNewFile,BufRead Vagrantfile setf ruby
augroup END
