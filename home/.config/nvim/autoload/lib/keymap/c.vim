" ============================================================================
" FileName: c.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" Command: <BS>
function! lib#keymap#c#BS() abort
  let pos = getcmdpos()
  let surround = getcmdline()[pos-2:pos-1]
  if index(["''", '<>', '()', '[]', '{}'], surround) >=0
    return "\<Right>\<BS>\<BS>"
  else
    return "\<BS>"
  endif
endfunc

" Command: ''|<>|()|[]|{}
function! lib#keymap#c#pairs(pairs) abort
  let pos = getcmdpos()
  let prechar = getcmdline()[pos-2]
  if prechar == a:pairs[0]
    return a:pairs[0]
  else
    return a:pairs . "\<Left>"
  endif
endfunc

