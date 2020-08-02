" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" FlyOutPairs:
function! userfunc#keymap#FlyOutPairs(key)
  return "\<ESC>:call search("."'".a:key."'".")\<CR>a"
endfunction

" Insert: <BS>
function! userfunc#keymap#Insert_BS() abort
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
endfunction

" Insert: <CR>
function! userfunc#keymap#Insert_CR() abort
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
endfunction

" Insert: <Esc>
function! userfunc#keymap#Insert_ESC()
  let colnr = getpos('.')[2]
  let linelen = len(getline('.'))
  if colnr == (linelen + 1)
    return "\<Esc>"
  else
    return "\<Esc>\<Right>"
  endif
endfunction

" Normal: <CR>
function! userfunc#keymap#Normal_CR() abort
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
endfunction

" Normal: q
function! userfunc#keymap#Normal_q() abort
  " is the last buffer
  if len(getbufinfo({'buflisted':1})) == 1 && winnr('$') == 1 && bufname() == ''
    return ":q!\<CR>"
  else
    return ":bp\<bar>vsp\<bar>bn\<bar>bd!\<bar>:redraw!\<CR>"
  endif
endfunction

" Normal: [[
function! userfunc#keymap#Square_Brackets_Left() abort
  let curline = line('.')
  if empty(getline(curline-1))
    normal! {
  else
    normal! {
    if empty(getline('.'))
      normal! j
    endif
  endif
endfunction

" Normal: ]]
function! userfunc#keymap#Square_Brackets_Right() abort
  let curline = line('.')
  if empty(getline(curline+1))
    normal! }
  else
    normal! }
    if empty(getline('.'))
      normal! k
    endif
  endif
endfunction

" Command: <BS>
function! userfunc#keymap#Command_BS() abort
  let pos = getcmdpos()
  let surround = getcmdline()[pos-2:pos-1]
  if index(["''", '<>', '()', '[]', '{}'], surround) >=0
    return "\<Right>\<BS>\<BS>"
  else
    return "\<BS>"
  endif
endfunction

" Command: ''|<>|()|[]|{}
function! userfunc#keymap#Command_Pairs(pairs) abort
  let pos = getcmdpos()
  let prechar = getcmdline()[pos-2]
  if prechar == a:pairs[0]
    return a:pairs[0]
  else
    return a:pairs . "\<Left>"
  endif
endfunction

" VisualStarSearch:
function! userfunc#keymap#VisualStarSearch(cmdtype, ...) abort
  let temp = @"
  normal! gvy
  if !a:0 || a:1 != 'raw'
    let @" = escape(@", a:cmdtype.'\*')
  endif
  let @/ = substitute(@", '\n', '\\n', 'g')
  let @/ = substitute(@/, '\[', '\\[', 'g')
  let @/ = substitute(@/, '\~', '\\~', 'g')
endfunction

function! userfunc#keymap#Exec(cmd)
  execute a:cmd
  return ''
endfunction

function! userfunc#keymap#jump() abort
  if &ft == 'man'
    execute 'Man ' . expand('<cword>')
  else
    call feedkeys("\<C-]>")
  endif
endfunction

" https://github.com/mg979/vim-mini-plugins/blob/master/plugin/ctrlg.vim
function! userfunc#keymap#ctrl_g() abort
  let l = str2float(line('.').".0") / line("$") * 100
  let perc = string(float2nr(l)) . "%"

  let buf = "Buf ".bufnr('')
  let file = expand("%") == '' ? s:tr('unnamed') : expand('%')
  let mod = !&modified? '' : printf('[%s] ', s:tr('modified'))
  let lines = printf('%s / %s %s', line('.'), line('$'), s:tr('lines'))

  if !filereadable(file)
    let info = "        " . s:tr("nofile")
    let warn = 1
  else
    let info = s:win ? '' : substitute(system('ls -l "'.file.'"'), '\('.file.'\)\?\n', '', '')
    let info = "        " . info
    let warn = 0
  endif

  let all = strwidth(buf.file.perc.mod.lines) + 18 "18 is 6x3 separators
  let max = &columns - all - 20
  if len(info) > max
    let info = info[:max]."…"
  endif

  echohl Constant   | echo mod
  echohl Special    | echon buf
  echohl WarningMsg | echon "  >>  "
  echohl Directory  | echon file
  echohl WarningMsg | echon "  >>  "
  echohl Special    | echon perc
  echohl WarningMsg | echon "  >>  "
  echohl None       | echon lines
  if warn
    echohl WarningMsg
  else
    echohl Type
  endif
  echon info
  echohl None
endfunction

let s:win  = has("win32") || has("win64") || has("win16")

let s:langs = {
  \ 'en': ['Modified',   'lines', 'Not a file.', '[No Name]'],
  \ }

let s:tr_dict = {
  \ 'modified': 0,
  \ 'lines': 1,
  \ 'nofile': 2,
  \ 'unnamed': 3
  \}

fun! s:tr(string)
  return s:langs['en'][s:tr_dict[a:string]]
endfun
