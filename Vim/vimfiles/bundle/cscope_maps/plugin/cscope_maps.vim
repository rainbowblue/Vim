" cscope setting        {{{
" ------------------------------------------------------------------------------
" 生成一个 cscope 的数据库
" 1.cd /usr/src/linux/
" 2.cscope -Rbq
" cs add /usr/src/linux/cscope.out /usr/src/linux/
" reset : 重新初始化所有连接. 用法  : cs reset

if has("cscope")
	silent! execute "!cscope kill -1"
endif

if has("cscope")
	if MySys() == "linux"
		set csprg=/usr/bin/cscope
	else
		set csprg=cscope
	endif
	" 这个全局变量设置下, 禁止这个插件自带的mapping
	" If you don't like them, you can set g:autocscope_menus to 0 and they won't load
	let g:autocscope_menus=0

	" Use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
	set cscopetag

	" Use tags for definition search first
	" set cscopetagorder=1
	set cscopetagorder=0

	" Use quickfix window to show cscope results
	set cscopequickfix=s-,c-,d-,i-,t-,e-

	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add the database pointed to by environment variable
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

	" Show msg when any other cscope db added
	set cscopeverbose

	" s: C语言符号  g: 定义     d: 这个函数调用的函数 c: 调用这个函数的函数
	" t: 文本       e: egrep模式    f: 文件     i: include本文件的文件
	""""""""""""" My cscope/vim key mappings
	"
	" The following maps all invoke one of the following cscope search types:
	"
	"   's'   symbol: find all references to the token under cursor
	"   'g'   global: find global definition(s) of the token under cursor
	"   'c'   calls:  find all calls to the function name under cursor
	"   't'   text:   find all instances of the text under cursor
	"   'e'   egrep:  egrep search for the word under cursor
	"   'f'   file:   open the filename under cursor
	"   'i'   includes: find files that include the filename under cursor
	"   'd'   called: find functions that function under cursor calls
	"
	nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
	nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
	nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
	nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
	nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
	nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR><CR>
	nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR><CR>
	nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
endif

" }}}

" ctags                 {{{
" ------------------------------------------------------------------------------
" map <F1> :call Do_CsTag()<CR>

if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
	let g:isWin=1
else
	let g:isWin=0
endif

" 设置tags的路径
" set tags=tags,./tags,../tags,../../tags,../../../tags,../../../../tags
" set tags=tags;
" set path+=./,C:/c55/C55_Connected_Audio_Framework_EZDSP/c55-connected-audio-framework/inc,C:/c55/C55_Connected_Audio_Framework_EZDSP/c55-connected-audio-framework/c55xx_csl/inc,C:/c55/C55_Connected_Audio_Framework_EZDSP/c55-connected-audio-framework/dsplib/inc,C:/c55/C55_Connected_Audio_Framework_EZDSP/c55-connected-audio-framework/asrc/inc,C:\c55\C55_Connected_Audio_Framework_EZDSP\c55-connected-audio-framework\c55xx_csl\inc,C:\c55\C55_Connected_Audio_Framework_EZDSP\c55-connected-audio-framework\c55x5_drivers\inc,C:\c55\C55_Connected_Audio_Framework_EZDSP\c55-connected-audio-framework\c55x5_drivers\i2c\inc,C:\c55\C55_Connected_Audio_Framework_EZDSP\c55-connected-audio-framework\c55x5_drivers\pal_os\inc;

"gf 命令 go file 到该文件去
" set path+=./include;
" set path+=../

function! Do_CsTag()
	let dir = getcwd()

	if has("cscope")
		silent! execute "cs kill -1"
	endif

	" 先删除已有的tags和cscope文件，如果存在且无法删除，则报错。
	if ( DeleteFile(dir, "tags") )
		return
	endif
	if ( DeleteFile(dir, "cscope.files") )
		return
	endif
	if ( DeleteFile(dir, "cscope.out") )
		return
	endif

	if(executable('ctags'))
		" silent! execute "!ctags -R --c-types=+p --fields=+S *"
		silent! execute "!ctags -R --c-types=+p --fields=+iaS *"
		" silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
		" silent! execute "!ctags -R --c++-kinds=+lpx --c-kinds=+lpx --fields=+miaS --extra=+q ."

	endif
	if(executable('cscope') && has("cscope") )
		if(g:isWin!=1)
			silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
		else
			silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
		endif
		silent! execute "!cscope -R -bkq -i cscope.files"

		" execute "normal :"
		" if filereadable("cscope.out")
			" execute "cs add cscope.out"
		" endif
	endif
endfunction

""下面是对cscope -Rbkq 的解释
""-R: 在生成索引文件时，搜索子目录树中的代码
""-b: 只生成索引文件，不进入cscope的界面
""-k: 在生成索引文件时，不搜索/usr/include目录
""-q: 生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度
function! DeleteFile(dir, filename) " {{{
	if filereadable(a:filename)
		if (g:isWin == 1)
			let ret = delete(a:dir."\\".a:filename)
		else
			let ret = delete("./".a:filename)
		endif
		if (ret != 0)
			echohl WarningMsg | echo "Failed to delete ".a:filename | echohl None
			return 1
		else
			return 0
		endif
	endif
	return 0
endfunction " }}}

" }}}
