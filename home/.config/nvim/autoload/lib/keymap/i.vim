" ============================================================================
" FileName: i.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" Insert: <BS>
function! lib#keymap#i#BS() abort
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  endif

  let line = getline('.')       " don't use trim() here
  let colnr = getpos('.')[2]
  let paren = strcharpart(line, colnr-2, 2)
  let pairs = ['()', '[]', '{}', '<>', '%%', '$$', '**', '""', "''", '~~', '``']
  if index(pairs, paren) >=0
    return "\<Left>\<Del>\<Del>"
  else
    let prefix = line[:colnr-2]
    if prefix =~ '^\s\+$' && len(prefix) % &shiftwidth == 0
      return "\<BS>"
    else
      return "\<Left>\<Del>"
    endif
  endif
endfunc

" Insert: <CR>
function! lib#keymap#i#CR() abort
  let line = getline('.') " can not use trim
  if pumvisible()
    return "\<C-y>"
  elseif index([')', ']', '}', '`'], strcharpart(line, getpos('.')[2]-1, 1)) >= 0
    return "\<CR>\<Esc>O"
  elseif strcharpart(line, getpos('.')[2]-1,2) == '</'
    return "\<CR>\<Esc>O"
  else
    return "\<CR>"
  endif
endfunc

" Insert: <Esc>
function! lib#keymap#i#Esc()
  let colnr = getpos('.')[2]
  let linelen = len(getline('.'))
  if colnr == (linelen + 1)
    return "\<Esc>"
  else
    return "\<Esc>\<Right>"
  endif
endfunc

" Insert: FlyOutPairs
function! lib#keymap#i#flyoutpairs(key)
  return "\<ESC>:call search("."'".a:key."'".")\<CR>a"
endfunc
