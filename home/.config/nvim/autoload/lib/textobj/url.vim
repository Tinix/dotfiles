" ============================================================================
" FileName: url.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

function! lib#textobj#url#() abort
  let pattern = '\(http\|https\|ftp\)://[a-zA-Z0-9][a-zA-Z0-9_-]*\(\.[a-zA-Z0-9][a-zA-Z0-9_-]*\)*\(:\d\+\)\?\(/[a-zA-Z0-9_/.\-+%?&=;@$,!''*~]*\)\?\(#[a-zA-Z0-9_/.\-+%#?&=;@$,!''*~]*\)\?'
  call lib#textobj#(pattern)
endfunc
