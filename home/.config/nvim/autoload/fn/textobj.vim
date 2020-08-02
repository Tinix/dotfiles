" ============================================================================
" FileName: textobj.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

function! fn#textobj#(pattern) abort
  let pos = getpos('.')
  let lnum = pos[1]
  let cnum = pos[2]
  let line = getline(lnum)
  " match from current column position
  let [str, start, end] = matchstrpos(line, a:pattern, cnum)
  if str !=# ''
    call cursor(lnum, start+1)
    normal v
    call cursor(lnum, end)
    return
  endif
  " didn't find matches from current column position,
  " so re-match from the beginning of the line
  let [str, start, end] = matchstrpos(line, a:pattern)
  if str !=# ''
    call cursor(lnum, start+1)
    normal v
    call cursor(lnum, end)
  endif
endfunc
