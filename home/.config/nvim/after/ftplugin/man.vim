setlocal number
setlocal relativenumber

autocmd BufWinEnter <buffer> wincmd H

func s:settings(timer)
  colorscheme onedark
endfunc
call timer_start(1, function('s:settings'))
