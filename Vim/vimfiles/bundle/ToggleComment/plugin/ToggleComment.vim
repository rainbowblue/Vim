" Toggle comment for visually selected block of code wangbei
function! ToggleComment() range
	" Define comment string here
	let s:commentstr_cpp = '//'
	let s:commentstr_vim = '"'

	" Check filetype
	if &filetype == 'h' || &filetype == 'c' || &filetype == 'hpp' || &filetype == 'cpp'
		let s:commentstr = s:commentstr_cpp
	elseif &filetype == 'vim' || &filetype == 'snippets'
		let s:commentstr = s:commentstr_vim
	else
		echohl WarningMsg | echo "No support for this filetype!" | echohl None
		return
	endif

	" Check if all lines are commented or blank
	let s:hascode = 0
	let s:nchar   = strlen(s:commentstr)
	let s:pattern = '^\s*\zs.\{' . s:nchar . '}'
	for s:line in getline(a:firstline, a:lastline)
		let s:linestart = matchstr(s:line, s:pattern)
		if s:linestart != s:commentstr && s:linestart != ""
			let s:hascode = 1
			break
		endif
	endfor

	" Comment/uncomment
	if s:hascode
		let s:old_string = '^\s*\zs'
		let s:new_string = s:commentstr." "
	else
		let s:old_string = s:commentstr.'\s*'
		let s:new_string = ""
	endif
	let s:linenum = a:firstline
	while s:linenum <= a:lastline
		let s:line = getline(s:linenum)
		let s:line = substitute(s:line, s:old_string, s:new_string, "")
		call setline(s:linenum, s:line)
		let s:linenum += 1
	endwhile
endfunction

