" Format C code
function! FormatCode()
	if &filetype != 'h' && &filetype != 'c' && &filetype != 'cpp' && &filetype != 'H' && &filetype != 'C' && &filetype != 'CPP'
		echohl WarningMsg | echo "No support for this filetype!" | echohl None
		return
	endif
	let saved_cursor = getpos('.')

	" let char = input('Enter Using TabWidth: ')
	" if char == '2'
		" set shiftwidth=2
		" set tabstop=2
	" elseif char == '4'
		" set shiftwidth=4
		" set tabstop=4
	" elseif char == '8'
		" set shiftwidth=8
		" set tabstop=8
	" else
		" set shiftwidth=4
		" set tabstop=4
	" endif

	" 0) Save cursor position
	" execute "normal mzHmy"
	" 1) Delete trailing spaces/tabs
	%s/\s\+$//e
	" 2) Delete ^M
	%s///e
	" 4) Delete blocks of 3 empty lines
	%s/^\n\{3}//e
	" 5) Use the 'popular' format
	set shiftwidth=4
	set tabstop=4
	" 5) Replace all tabs with spaces
	set expandtab
	retab!
	" 6) Use the 'correct' format
	set shiftwidth=8
	set tabstop=8
	set noexpandtab
	" 7) Align code
	execute "normal gg=G"
	" 8) Restore cursor position
	" execute "normal `yzt`z"
	" 9) Clear the search pattern
	let @/ = ''

	call setpos('.', saved_cursor)
	echohl WarningMsg | echo "Now formatcode over !" | echohl None
endfunction

