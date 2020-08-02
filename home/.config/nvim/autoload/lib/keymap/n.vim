" ============================================================================
" FileName: n.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" Normal: [[
function! lib#keymap#n#left_square_brackets() abort
  let curline = line('.')
  if empty(getline(curline-1))
    normal! {
  else
    normal! {
    if empty(getline('.'))
      normal! j
    endif
  endif
endfunc

" Normal: ]]
function! lib#keymap#n#right_square_brackets() abort
  let curline = line('.')
  if empty(getline(curline+1))
    normal! }
  else
    normal! }
    if empty(getline('.'))
      normal! k
    endif
  endif
endfunc

" Normal: <CR>
function! lib#keymap#n#CR() abort
  let line = trim(getline('.'))
  let disable_if_begin_with = ['#', '/']
  let disable_if_end_with = [',', ';', '{','[', '(', '/', '\', '<', '>']

  if line == '' || index(disable_if_begin_with, line[0]) >= 0 || index(disable_if_end_with, line[-1:]) >= 0
    return "\<CR>"
  endif

  if index(['c', 'cpp', 'cs', 'css', 'java', 'rust', 'scss', 'mysql'], &ft) >= 0
    return "A;"
  elseif index(['json', 'jsonc'], &ft) >= 0
    return "A,"
  elseif index(['qmake'], &ft) > 0
    return "A\\"
  endif
endfunc

" Normal: q
function! lib#keymap#n#q() abort
  " is the last buffer
  if len(getbufinfo({'buflisted':1})) == 1 && winnr('$') == 1 && bufname() == ''
    return ":q!\<CR>"
  else
    return ":bp\<bar>vsp\<bar>bn\<bar>bd!\<bar>:redraw!\<CR>"
  endif
endfunc

function! lib#keymap#n#jump() abort
  if &ft == 'man'
    execute 'Man ' . expand('<cword>')
  else
    call feedkeys("\<C-]>")
  endif
endfunc
