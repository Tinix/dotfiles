" ============================================================================
" FileName: file.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldik
" ============================================================================

" AutoFormat:
function! lib#file#autoformat() abort
  if &readonly || !&modifiable
    return
  endif

  let curpos = getpos('.')
  " 1. remove whitespace
  call s:remove_white_spaces()
  " 2. remove blank line
  call s:remove_blank_lines()
  " 3. use coc
  call CocAction('format')

  if expand('%') != ''
    update
  endif

  call setpos('.', curpos)
endfunc

" AutoSave:
function! lib#file#autosave() abort
  if &readonly || !&modifiable || &bt == 'acwrite'
    return
  endif

  let curpos = getpos('.')
  if getpos('.')[1] != line('$')
    call s:remove_blank_lines()
  endif

  if !empty(trim(getline('.')))
    call s:remove_white_spaces()
  endif

  if !empty(expand('%'))
    update
  endif

  call setpos('.', curpos)
endfunc

" RemoveBlankLines:
function! s:remove_blank_lines() abort
  if !&modifiable
    return
  endif

  let save_reg = @"
  let endlnum = line('$')
  let lastnoblank = prevnonblank(endlnum)
  if endlnum == lastnoblank
    return
  endif
  execute printf('%s,%sdelete', lastnoblank+1, endlnum)
  let @" = save_reg
endfunc

" RemoveWhiteSpaces:
function! s:remove_white_spaces()
  if mode() ==# 'n'
    silent! keeppatterns keepjumps execute 'undojoin | %s/[ \t]\+$//g'
  endif
endfunc

" RenameFile:
function! lib#file#rename(name) abort
  let old = expand('%')
  if empty(a:name)
    let new = input('New file name: ', expand('%'), 'file')
  else
    let new = a:name
  endif
  if new != '' && new != old
    execute ':saveas ' new
    if has('unix')
      execute 'silent !rm ' old
    else
      execute 'silent !del ' old
    endif
    execute 'bdelete ' old
    redraw!
  endif
endfunc

" RemoveFile: remove current file
function! lib#file#remove() abort
  let fname = expand('%')
  execute 'bdelete ' fname
  if has('unix')
    execute 'silent !rm ' fname
  else
    execute 'silent !del ' fname
  endif
  redraw!
endfunc
