" ============================================================================
" FileName: floaterm.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" Use o or <CR> in the NORMAL mode to open the file in the floaterm window
nnoremap <buffer><silent> o    :call floaterm#util#edit(-1, expand('<cfile>'))<CR>
nnoremap <buffer><silent> <CR> :call floaterm#util#edit(-1, expand('<cfile>'))<CR>
