" ============================================================================
" FileName: terminal.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

" Use o or <CR> in the NORMAL mode to open the file in the terminal window
nnoremap <buffer><silent> <CR> :call <SID>open_file()<CR>
nnoremap <buffer><silent> o    :call <SID>open_file()<CR>
nnoremap <silent><buffer> p  :call <SID>preview_file()<CR>

function! s:open_file() abort
  if getbufvar(bufnr(), 'floaterm_winid', -1) != -1
    hide
  endif
  let cmd = s:get_editcmd()
  for winnr in range(1, winnr('$'))
    let bt = getbufvar(winbufnr(winnr), '&bt')
    let ft = getbufvar(winbufnr(winnr), '&ft')
    if bt == 'terminal'
      continue
    endif
    if index(['coc-explorer', 'vista', 'mundo'], ft) >= 0
      continue
    endif
    execute winnr . 'wincmd w'
  endfor
  execute cmd
endfunction

let s:preview_float_winid = -1
function! s:preview_file()
  let cmd = s:get_editcmd()
  let winid = lib#floatwin#open(0, 80, 20, 'topright')
  execute cmd
  setlocal number
  call nvim_buf_add_highlight(bufnr(), -1, 'Search', line('.')-1, 0, -1)
  let s:preview_float_winid = winid
  wincmd p
  call timer_start(100, function('s:register_autocmd'))
endfunction

function! s:register_autocmd(...) abort
  augroup close_preview_float_win
    autocmd!
    autocmd CursorMoved <buffer> call timer_start(200, function('s:close_float_win'))
  augroup END
endfunction

function! s:close_float_win(...) abort
  if win_getid() == s:preview_float_winid
    return
  else
    if lib#api#win_exists(s:preview_float_winid)
      call nvim_win_close(s:preview_float_winid, v:true)
    endif
    autocmd! close_preview_float_win
  endif
endfunction

function! s:get_editcmd() abort
  let curfile = expand('<cfile>')
  let curline = getline('.')
  let lnum = matchstr(curline, curfile . ':\zs\d\+\ze')

  " search for the curfile
  while curfile =~ '^\(../\|./\)'
    let curfile = substitute(curfile, '^\(../\|./\)', '', 'g')
  endwhile
  if curfile !~ '^/' " not begin with '/'
    let curfile = findfile(curfile, '.,**5;' . lib#path#get_root())
  endif
  if empty(curfile)
    call lib#utils#ShowMsg('file not found', 'error')
    return
  endif
  let curfile = fnamemodify(curfile, ':p')

  if empty('lnum')
    let cmd = printf('edit! %s', curfile)
  else
    let cmd = printf('edit! +%s %s', lnum, curfile)
  endif
  return cmd
endfunction
