" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss

" AbsPath:
function! lib#lightline#AbsPath()
  let path = substitute(expand('%:p'), $HOME, '~', 'g')
  if len(path) > winwidth(0)/2.5
    let path = pathshorten(path)
    if len(path) > winwidth(0)/2.5
      return ''
    endif
  endif
  return path
endfunc

" Mode:
function! lib#lightline#Mode()
  return &filetype ==# 'coc-explorer' ? 'coc-explorer' :
    \ &filetype ==# 'denite' ? 'Denite' :
    \ &filetype ==# 'gitv' ? 'GitV' :
    \ &filetype ==# 'help' ? 'Help' :
    \ &filetype ==# 'man' ? 'Man' :
    \ &filetype ==# 'qf' && !getwininfo(win_getid(winnr()))[0]['loclist'] ? 'QuickFix' :
    \ &filetype ==# 'qf' && getwininfo(win_getid(winnr()))[0]['loclist'] ? 'Location List' :
    \ &filetype ==# 'startify' ? 'Startify' :
    \ &filetype ==# 'Mundo' ? 'Mundo' :
    \ expand('%:t') =~ '__Tagbar__' ? 'Tagbar' :
    \ expand('%:t') =~ '__vista__' ? 'Vista' :
    \ lightline#mode()
endfunc

" FileName:
function! lib#lightline#FileName()
  let filename = expand('%:t') !=# '' ? expand('%:t') : ''
  let modified = &modified ? ' ✎' : ''
  return filename . modified
endfunc

" GitBranch:
function! lib#lightline#GitBranch()
  if exists('*FugitiveHead') && &filetype !~# '\v(denite|help|man|qf|tagbar|Mundo|vista)'
    let branch = FugitiveHead()
    return branch !=# '' ? ''. branch : ''
  endif
  return ''
endfunc

" FileFormat:
function! lib#lightline#FileFormat()
  return &filetype !=# 'denite' &&
    \ &filetype !=# 'gitv' &&
    \ &filetype !=# 'help' &&
    \ &filetype !=# 'man' &&
    \ &filetype !=# 'qf' &&
    \ &filetype !=# 'startify' &&
    \ &filetype != 'Mundo' &&
    \ expand('%:t') !~ '__vista__' &&
    \ winwidth(0) > 70
    \ ? &fileformat : ''
endfunc

" FileType:
function! lib#lightline#FileType()
  return strlen(&filetype) ? (WebDevIconsGetFileTypeSymbol() . ' ' . &filetype) : ''
endfunc

" FileEncoding:
function! lib#lightline#FileEncoding()
  return &filetype !=# 'denite' &&
    \ &filetype !=# 'gitv' &&
    \ &filetype !=# 'help' &&
    \ &filetype !=# 'man' &&
    \ &filetype !=# 'qf' &&
    \ &filetype !=# 'startify' &&
    \ &filetype !=# 'Mundo' &&
    \ expand('%:t') !~ '__vista__' &&
    \ winwidth(0) > 70
    \ ? &fileencoding : ''
endfunc

" ReadOnly:
function! lib#lightline#ReadOnly()
  return &readonly && &filetype !~# '\v(denite|help|man|qf|startify)' && expand('%:t') !~ ('__vista__') ? '' : ''
endfunc
