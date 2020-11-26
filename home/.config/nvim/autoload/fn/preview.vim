" ============================================================================
" FileName: glance.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

function! fn#preview#open_file() abort
  if &ft=='floaterm'
    hide
  endif
  let [fpath, lnum] = s:get_filepath()
  if empty(fpath)
    return
  endif
  let cmd = printf('edit %s %s', empty(lnum) ? '' : '+'.lnum, fpath)
  execute cmd
endfunction

let s:preview_float_winid = -1
let s:preview_float_border_winid = -1
let s:ns_id = -1
function! fn#preview#preview_file()
  let [fpath, lnum] = s:get_filepath()
  if empty(fpath)
    return
  endif
  if bufloaded(fpath)
    let bufnr = bufnr(fpath)
  else
    let bufnr = bufadd(fpath)
    call nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
  endif
  let [winid, border_winid] = fn#floatwin#open(bufnr, 80, 20, 'topright', fpath)
  noautocmd call win_gotoid(winid)
  execute 'doautocmd filetypedetect BufNewFile'
  if !empty(lnum)
    let s:ns_id = nvim_create_namespace('glance')
    call nvim_buf_add_highlight(bufnr, s:ns_id, 'Search', str2nr(lnum)-1, 0, -1)
    call win_gotoid(winid)
    noautocmd execute 'keepjumps ' . lnum
  endif
  noautocmd wincmd p
  call nvim_win_set_option(winid, 'number', v:true)
  let s:preview_float_winid = winid
  let s:preview_float_border_winid = border_winid
  call timer_start(100, function('s:register_autocmd'))
endfunction

function! s:register_autocmd(...) abort
  augroup close_preview_float_win
    autocmd!
    autocmd CursorMoved * call timer_start(200, function('s:close_float_win'))
  augroup END
endfunction

function! s:close_float_win(...) abort
  if win_getid() == s:preview_float_winid
    return
  else
    if s:ns_id != -1
      let buf = nvim_win_get_buf(s:preview_float_winid)
      call nvim_buf_clear_namespace(buf, s:ns_id, 0, -1)
      let s:ns_id = -1
    endif
    if fn#api#win_exists(s:preview_float_winid)
      call nvim_win_close(s:preview_float_winid, v:true)
      let s:preview_float_winid = -1
    endif
    if fn#api#win_exists(s:preview_float_border_winid)
      call nvim_win_close(s:preview_float_border_winid, v:true)
      let s:preview_float_border_winid = -1
    endif
    autocmd! close_preview_float_win
  endif
endfunction

" TODO: more edge cases
function! s:get_filepath() abort
  let fpath = substitute(expand('<cfile>'), '^\zs\(\~\|\$HOME\)', $HOME, '')
  let lnum = matchstr(getline('.'), fpath . '\(:\||\)\zs\d\+\ze')

  if isdirectory(fpath)
    call fn#utils#show_message('Can not preview directory', 'error')
    let fpath = ''
  elseif fpath =~ '^/' && !filereadable(fpath)
    call fn#utils#show_message('File was not found', 'error')
    let fpath = ''
  elseif !filereadable(fpath)
    " remote `./` and `../`
    while fpath =~ '^\(../\|./\)'
      let fpath = substitute(fpath, '^\(../\|./\)', '', 'g')
    endwhile
    " do search
    let fpath = findfile(fpath, '.,**5;' . fn#path#get_root())
    if !empty(fpath)
      let fpath = fnamemodify(fpath, ':p')
    elseif exists('g:did_coc_loaded')
      let taginfo = coc#rpc#request('getTagList', [])
      if taginfo isnot v:null
        let fpath = taginfo[0]['filename']
        let lnum = matchstr(taginfo[0]['cmd'], 'keepjumps \zs\d\+\ze')
      else
        call fn#utils#show_message('File was not found', 'error')
      endif
    endif
  else
    call fn#utils#show_message('File was not found', 'error')
  endif
  return [fpath, lnum]
endfunction
