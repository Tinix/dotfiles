" ============================================================================
" FileName: conceal.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

"-----------------------------------------------------------------------------
" https://github.com/mg979/vim-mini-plugins/blob/master/plugin/conceal.vim
"-----------------------------------------------------------------------------

function! lib#conceal#pattern(reset, pattern)
  " Entry point.
  hi Invisible guibg=NONE guifg=bg
  let b:patterns = get(b:, 'patterns', {})
  let b:patterns.Invisible = get(b:patterns, 'Invisible', copy(s:Hi))
  let b:patterns.Invisible.hi = 'Invisible'
  call b:patterns.Invisible.start(a:reset, a:pattern)
endfunc


let s:Hi = { 'match': 0, 'patterns' : [], 'hi': '' }


function! s:Hi.start(reset, pattern) abort
  " Conceal or unconceal a regex pattern.
  if a:reset
    return self.reset(!strlen(a:pattern), a:pattern)
  elseif !strlen(a:pattern)
    return self.print('Pattern needed')
  else
    call add(self.patterns, a:pattern)
    call self.apply()
    call self.print()
  endif
endfunc


function! s:Hi.reset(all, pattern)
  " Remove one or all concealed patterns.
  if empty(self.patterns)
    echo 'No patterns'
    return
  elseif a:all
    let self.patterns = []
    return self.clear()
  elseif index(self.patterns, a:pattern) < 0
    return self.print('No such a pattern')
  endif
  call remove(self.patterns, index(self.patterns, a:pattern))
  call self.apply()
  call self.print()
endfunc


function! s:Hi.apply()
  " Add the conceal match.
  call self.clear()
  if !empty(self.patterns)
    let self.match = matchadd(self.hi, join(self.patterns, '\|'))
  endif
endfunc


function! s:Hi.clear()
  " Clear old match if present.
  if self.match
    call matchdelete(self.match)
    let self.match = 0
  endif
endfunc


function! s:Hi.print(...)
  " Print current patterns.
  if a:0 | echo a:1 | return | endif
  echo 'Current patterns:' string(self.patterns)
endfunc
