setlocal shiftwidth=2
setlocal nospell

" coc-pairs
let g:coc_pairs = [
  \['（', '）'],
  \['“', '”'],
  \['‘', '’'],
  \['《', '》'],
  \['*', '*'],
  \['$', '$'],
  \]

setlocal textwidth=82
setlocal formatoptions=jmBtl

let b:match_words = '\<begin\>:\<end\>'
