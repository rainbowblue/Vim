if !exists(':Tabularize')
  finish " Tabular.vim wasn't loaded
endif

let s:save_cpo = &cpo
set cpo&vim

"/=\ze/l1r1 指明=号左边留一个空格后面也留一个空格"
" AddTabularPattern!  assignment      /[|&+*/%<>=!~-]\@<!\([<>!=]=\|=\~\)\@![|&+*/%<>=!~-]*=/l1r1
AddTabularPattern!  assignment      /[|&+*/%<>=!~-]*=/l1r1
AddTabularPattern!  two_spaces      /  /l0

AddTabularPipeline! multiple_spaces /  / map(a:lines, "substitute(v:val, '   *', '  ', 'g')") | tabular#TabularizeStrings(a:lines, '  ', 'l0')

AddTabularPipeline! argument_list   /(.*)/ map(a:lines, 'substitute(v:val, ''\s*\([(,)]\)\s*'', ''\1'', ''g'')')
                                       \ | tabular#TabularizeStrings(a:lines, '[(,)]', 'l0')
                                       \ | map(a:lines, 'substitute(v:val, ''\(\s*\),'', '',\1 '', "g")')
                                       \ | map(a:lines, 'substitute(v:val, ''\s*)'', ")", "g")')
"rambo
AddTabularPattern! equals    /^[^=]*\zs=/
AddTabularPattern! ruby_hash /^[^=>]*\zs=>/
" AddTabularPattern! commas    /,\s*\zs\s/l0
AddTabularPattern! commas    /,\ze/l0r1
" AddTabularPattern! colons    /^[^:]*:\s*\zs\s/l0
AddTabularPattern! colons    /:\ze
AddTabularPattern! adder    /+\ze
AddTabularPattern! brace    /(\ze/l1r0

AddTabularPattern! doxygen_c_comments /\S\+\s*\zs\/\*\!<\ze
" nmap <Leader>a/ :Tabularize /\S\+\s*\zs\/\*\!<\ze<CR>
" vmap <Leader>a/ :Tabularize /\S\+\s*\zs\/\*\!<\ze<CR>

AddTabularPipeline space / \+/
      \ map(a:lines, "substitute(v:val, ' \+', ' ', 'g')")
      \   | tabular#TabularizeStrings(a:lines, ' ', 'l0')

function! SplitCDeclarations(lines)
  let rv = []
  for line in a:lines
    " split the line into declaractions
    let split = split(line, '\s*[,;]\s*')
    " separate the type from the first declaration
    let type = substitute(split[0], '\%(\%([&*]\s*\)*\)\=\k\+$', '', '')
    " add the ; back on every declaration
    call map(split, 'v:val . ";"')
    " add the first element to the return as-is, and remove it from the list
    let rv += [ remove(split, 0) ]
    " transform the other elements by adding the type on at the beginning
    call map(split, 'type . v:val')
    " and add them all to the return
    let rv += split
  endfor
  return rv
endfunction

AddTabularPipeline! split_declarations /,.*;/ SplitCDeclarations(a:lines)

AddTabularPattern! ternary_operator /^.\{-}\zs?\|:/l1

AddTabularPattern! cpp_io /<<\|>>/l1

AddTabularPattern! pascal_assign /:=/l1

AddTabularPattern! trailing_c_comments /\/\*\|\*\/\|\/\//l1

let &cpo = s:save_cpo
unlet s:save_cpo
