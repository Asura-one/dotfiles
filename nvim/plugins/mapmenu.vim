function keymapmeu() abort
  let lst = {}
  let s:lines = readfile('../config/keymap.vim')
  for s:line in s:lines:
    if !empty(matchstr(s:line, 'map'))
      let lst[] = i
    endif
  endfor
endfunction

function test_keymapmeu() abort
  let a = "nnoremap <silent> <leader> :WhichKey '<Space>'<CR>"
  if !empty(matchstr(a, 'map'))
    echo a
  endif
endfunction
