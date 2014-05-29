if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead *.rest setf rst
    au! BufNewFile,BufReadPost *.md setf markdown
    au! BufNewFile,BufRead Vagrantfile setf ruby
augroup END
