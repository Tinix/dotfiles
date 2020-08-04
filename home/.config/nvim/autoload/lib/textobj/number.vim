" ============================================================================
" FileName: number.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

function! lib#textobj#number#() abort
  call lib#textobj#('\v\d+')
endfunc
