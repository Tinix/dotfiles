" ============================================================================
" FileName: qf.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

setlocal wrap
setlocal norelativenumber number
setlocal linebreak
setlocal nolist
setlocal cursorline
setlocal nobuflisted
setlocal nospell

nnoremap <silent><buffer> p  :call <SID>preview_file()<CR>
nnoremap <silent><buffer> q  :pclose!<CR>:quit<CR>
nnoremap <buffer> o    <CR><C-w>p

" quit vim if the last window is qf
autocmd BufEnter <buffer> if winnr('$') < 2| q | endif

let b:undo_ftplugin = 'setl fo< com< ofu<'

let b:qf_isLoc = ! empty(getloclist(0))
if b:qf_isLoc == 1
	nnoremap <buffer> O <CR>:lclose<CR>
else
	nnoremap <buffer> O <CR>:cclose<CR>
endif

let s:preview_float_winid = -1
function! s:preview_file()
	let winwidth = &columns
	let curlist = b:qf_isLoc == 1 ? getloclist('.') : getqflist()
	let curline = getline(line('.'))
	if curline =~# '|\d\+'
    let curfile = fnameescape(substitute(curline, '|.*$', '', ''))
    let curpos  = substitute(curline, '^\(.\{-}|\)\(\d\+\)\(.*\)', '\2', '')
    let cmd = printf('edit! +%s %s', curpos, curfile)
	else
    let curfile = expand('<cfile>')
    let cmd = printf('edit! %s', curfile)
	endif
  let winid = lib#floatwin#open(0, 80, 20, 'topright')
  execute cmd
  let s:preview_float_winid = winid
  wincmd p
  augroup close_preview_float_win
    autocmd CursorMoved * call timer_start(200, function('s:close_float_win'))
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
