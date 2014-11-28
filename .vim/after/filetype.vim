" after

" markdown live editor -- vim-livedown
"
if !exists('g:livedown_open')
  let g:livedown_open = 1
endif

if !exists('g:livedown_port')
  let g:livedown_port = 1337
endif

function! LivedownPreview()
  call system("livedown start '" . expand('%:p') .
        \ "' --open" .
        \ " --port " . g:livedown_port .
        \ " &")
endfunction

augroup livedown
  au! VimLeave <buffer> call system("livedown stop --port " . g:livedown_port . " &")
augroup END
