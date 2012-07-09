let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <Plug>(neocomplcache_start_unite_snippet) unite#sources#snippet#start_complete()
inoremap <silent> <expr> <Plug>(neocomplcache_start_unite_quick_match) unite#sources#neocomplcache#start_quick_match()
inoremap <silent> <expr> <Plug>(neocomplcache_start_unite_complete) unite#sources#neocomplcache#start_complete()
inoremap <silent> <SNR>83_yrrecord =YRRecord3()
inoremap <C-Tab> 	
inoremap <silent> <Plug>NERDCommenterInInsert  <BS>:call NERDComment(0, "insert")
inoremap <S-Right> <Nop>
inoremap <S-Left> <Nop>
inoremap <S-Down> <Nop>
inoremap <S-Up> <Nop>
inoremap <silent> <C-Down> :call AddEmptyLineBelow()a
inoremap <silent> <C-Up> :call DelEmptyLineBelow()a
inoremap <silent> <Down> :call AddEmptyLineAbove()a
inoremap <silent> <Up> :call DelEmptyLineAbove()a
inoremap <silent> <S-Tab> =BackwardsSnippet()
inoremap <F9> :NERDTreeToggle
imap <M-k> mz:m-2`z
imap <M-j> mz:m+`z
inoremap <C-BS> diwa
inoremap <M-l>f f*
inoremap <M-l>p p*
inoremap <M-l>r r*
inoremap <M-l>m m*
inoremap <M-L>h h*
inoremap <M-l>y y*
inoremap <M-l>l l*
inoremap <M-l>e e*
inoremap <M-l>d d*
inoremap <M-l>g g*
inoremap <M-l>b b*
inoremap <M-l>a a*
map! <S-Insert> *
xmap  <Plug>SpeedDatingUp
nmap  <Plug>SpeedDatingUp
nnoremap  
vnoremap  "+y
nnoremap  
nnoremap  
nmap  :call GotoFirstEffectiveLine()
nnoremap  gT
snoremap <silent> 	 i<Right>=TriggerSnippet()
noremap <NL> jjj
noremap  kkk
nnoremap  gt
snoremap  a<BS>
nnoremap <silent>  :YRReplace '1', 'p'
nnoremap <silent>  :YRReplace '-1', 'P'
nnoremap  
vnoremap  m'gUiw`'a
nmap o <Plug>ZoomWin
xmap  <Plug>SpeedDatingDown
nmap  <Plug>SpeedDatingDown
snoremap  a<BS>
nmap  :shell
nnoremap   /
vnoremap <silent> # :call VisualSearch('b')
snoremap % a<BS>%
snoremap ' a<BS>'
vnoremap <silent> * :call VisualSearch('f')
nnoremap ++ :call lib#InPlace('normal! gg=G')
nmap ,P :Preview
nmap <silent> ,ssl <Plug>SnippetsListSnippets
nmap <silent> ,ssd <Plug>SnippetsDeleteSnippet
nmap <silent> ,sse <Plug>SnippetsEditSnippet
nmap <silent> ,ssP <Plug>SnippetsInsertSnippet
nmap <silent> ,ssp <Plug>SnippetsAppendSnippet
vmap <silent> ,ssa <Plug>SnippetsAddSnippet
nmap <silent> ,ssa <Plug>SnippetsAddSnippet
map <silent> ,mm :ShowMarksPlaceMark
map <silent> ,ma :ShowMarksClearAll
map <silent> ,mc :ShowMarksClearMark
map <silent> ,mo :ShowMarksOn
map <silent> ,mt :ShowMarksToggle
nmap ,ca <Plug>NERDCommenterAltDelims
vmap ,cA <Plug>NERDCommenterAppend
nmap ,cA <Plug>NERDCommenterAppend
vmap ,c$ <Plug>NERDCommenterToEOL
nmap ,c$ <Plug>NERDCommenterToEOL
vmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
vmap ,cn <Plug>NERDCommenterNest
vmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
vmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
vmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
vmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
vmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
vmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
vmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
vmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
nmap ,sd :cs find d =expand("<cword>"):copen
nmap ,si :cs find i ^=expand("<cfile>")$:copen
nmap ,sf :cs find f =expand("<cfile>"):copen
nmap ,se :cs find e =expand("<cword>"):copen
nmap ,st :cs find t =expand("<cword>"):copen
nmap ,sc :cs find c =expand("<cword>"):copen
nmap ,sg :cs find g =expand("<cword>"):copen
nmap ,ss :cs find s =expand("<cword>"):copen
nmap ,caL <Plug>CalendarH
nmap ,cal <Plug>CalendarV
nnoremap ,I :call IndentGuides()
nnoremap ,hb :HgBlame
nnoremap ,hd :HgDiff
nnoremap ,< xgEp
nnoremap ,> xEp
nnoremap ,dw :call ToggleDiffWhitespace()
omap ,cc <Plug>NERDCommenterToggle
map ,at :AT
map ,av :AV
map ,as :AS
map ,aa :A
map ,mru :MRU
nmap <silent> ,0 <Plug>FontsizeDefault
nmap <silent> ,- <Plug>FontsizeDec
nmap <silent> ,= <Plug>FontsizeInc
nmap <silent> ,+ <Plug>FontsizeInc
nmap <silent> ,of :FSHere
vmap <silent> ,hr <Plug>MarkRegex
nmap <silent> ,hr <Plug>MarkRegex
vmap <silent> ,hc <Plug>MarkClear
nmap <silent> ,hc <Plug>MarkClear
vmap <silent> ,hl <Plug>MarkSet
nmap <silent> ,hl <Plug>MarkSet
nmap <silent> ,mk :MarksBrowser
nmap ,mwc <Plug>MarkClear
vmap ,mr <Plug>MarkRegex
nmap ,mr <Plug>MarkRegex
vmap ,mw <Plug>MarkSet
nmap ,mw <Plug>MarkSet
map ,yr :YRShow
nnoremap <silent> ,	 :ScratchToggle
nmap <silent> ,tt :NERDTree
nnoremap ,L :LinediffReset
vnoremap ,l :Linediff
onoremap <silent> ,T :call EasyMotion#T(0, 1)
onoremap <silent> ,t :call EasyMotion#T(0, 0)
vnoremap <silent> ,F :call EasyMotion#F(1, 1)
onoremap <silent> ,F :call EasyMotion#F(0, 1)
nnoremap <silent> ,F :call EasyMotion#F(0, 1)
vnoremap <silent> ,f :call EasyMotion#F(1, 0)
onoremap <silent> ,f :call EasyMotion#F(0, 0)
nnoremap <silent> ,f :call EasyMotion#F(0, 0)
nnoremap ,. :CtrlPTag
xmap ,ct <Plug>Commentary
nmap ,ct <Plug>CommentaryLine
nnoremap ,R :RainbowParenthesesToggle
nmap ,ax <Plug>ToggleAutoCloseMappings
nnoremap ,ack :Ack! 
nmap ,ut :se fileencoding=utf-8
nmap ,fc :se fileencoding?
nmap ,fu :se ff=unix
nmap ,fd :se ff=dos
nnoremap <silent> , @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')
nnoremap ,z zMzvzz
nmap <silent> ,lv :lv /=expand("<cword>")/ %:lw
noremap ,rw :%s/=expand("<cWORD>")//gc<Left><Left><Left>
noremap ,rr :%s/=expand("<cword>")//gc<Left><Left><Left>
nnoremap <silent> ,h3 :execute '3match InterestingWord3 /\<\>/'
nnoremap <silent> ,h2 :execute '2match InterestingWord2 /\<\>/'
nnoremap <silent> ,h1 :execute 'match InterestingWord1 /\<\>/'
nnoremap <silent> ,hh :execute 'match InterestingWord1 /\<\>/'
nnoremap ,s sj
nnoremap ,v vl
noremap <silent> ,  :noh:call clearmatches()
nmap <silent> ,wmt :WMToggle
nnoremap <silent> ,tag :TlistToggle
map ,ba :1,300 bwipe!
map ,cf :Bclose
map ,bd :Bclose
nmap ,bp :call BufPos_ActivateBuffer(v:count)
nmap <silent> ,ws :call RemoveTrailingSpace_and_EmptyLines():w!
nnoremap ,ee :tabedit $VIM/vimrc
map <silent> ,rs :source $VIM/vimrc
map ,gf gf
map ,cd :lcd %:p:h:pwd
map ,tm :tabmove
map ,tc :tabclose
map ,to :tabonly
map ,te :tabedit =expand("%:p:h")/
map ,tn :tabnew $TEMP/scratch.txt
map ,co ggVGy:tabnew:set syntax=qfpgg
nmap ,cw :botright cop
nmap ,cp :cp
nmap ,cn <Plug>NERDCommenterNest
nnoremap ,dfn :%s/^\+[0-9]\+//
noremap ,rm mmHmt:%s///ge'tzt'm
noremap ,dm mzHmx:%s///ge'xzt'z:delm x z
map ,% :echo expand("%:p")
nnoremap ,cli :cl
vmap ,ax :!chmod a+x %
omap ,ax :!chmod a+x %
nmap <silent> ,qa :qa!
nmap <silent> ,qq :q!
nmap <silent> ,qf :q!
nmap <silent> ,qw :wq
nmap <silent> ,xx :xa!
nmap <silent> ,ww :w!
nnoremap ,, :ZoomWin
nnoremap ,V V`]
nnoremap ,W :%s/\s\+$//:let @/=''
nnoremap ,w mz:%s/\s\+$//:let @/=''`z
vnoremap ,y "*ygv
vnoremap ,P :set paste!"*P:set nopaste
onoremap ,P :set paste!"*P:set nopaste
noremap ,p :set paste!"*P:set nopaste
nnoremap ,y "*y
onoremap ,y "*y
nnoremap / :call SearchCompleteStart()/
vnoremap / :call SearchCompleteStart()/
nmap 0 ^
vmap 0 ^
vnoremap ? :m-2gv
nmap @ :YRMapsMacro
inoremap <silent> ­ =EchoFuncP()<BS>
inoremap <silent> ½ =EchoFuncN()<BS>
inoremap ï o
omap <expr> H YRMapsExpression("", "^")
nnoremap H ^
vnoremap H ^
nnoremap J mzJ`z
nnoremap K <Nop>
omap <expr> L YRMapsExpression("", "$")
vnoremap L g_
nnoremap L $
nnoremap N Nzzzv
xnoremap <silent> P :YRPaste 'P', 'v'
nnoremap <silent> P :YRPaste 'P'
nnoremap Q <Nop>
xmap S <Plug>VSurround
nnoremap S i^mwgk:silent! s/\v +$//:noh`w
snoremap U a<BS>U
nnoremap VaB vaBV
nnoremap Vab vabV
nnoremap Vat vatV
nnoremap Vit vitVkoj
nnoremap VV V
nnoremap Vaa  ggVG
vnoremap X "_Xi 
nnoremap Y :YRYankCount 'y$'
vmap [% [%m'gv``
snoremap \ a<BS>\
nmap \\\ <Plug>CommentaryLine
nmap \\ <Plug>Commentary
xmap \\ <Plug>Commentary
nnoremap \zz :let &scrolloff=999-&scrolloff
vmap ]% ]%m'gv``
snoremap ^ a<BS>^
nnoremap _d :set ft=diff
nnoremap _pd :set ft=python.django
nnoremap _cw :set ft=confluencewiki
nnoremap _js :set ft=javascript
nnoremap _jt :set ft=htmljinja
nnoremap _hd :set ft=htmldjango
nnoremap _md :set ft=markdown
nnoremap __ :split | 
snoremap ` a<BS>`
vmap a% [%v]%
vnoremap ar a[
onoremap ar a[
nnoremap bp :bprev
nnoremap bn :bnext
nmap cs <Plug>Csurround
xnoremap <silent> d :YRDeleteRange 'v'
nmap d <Plug>SpeedDatingNowLocal
nmap d <Plug>SpeedDatingNowUTC
nmap ds <Plug>Dsurround
map <silent> fd :call DeFunc()
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> gp :YRPaste 'gp'
nnoremap <silent> gP :YRPaste 'gP'
xmap gS <Plug>VgSurround
vnoremap <silent> gv :call VisualSearch('gv')
nnoremap gl l
nnoremap gk k
nnoremap gj j
nnoremap gh h
nnoremap gI `.
nmap gm :call cursor(0, virtcol('$')/2)
nnoremap g, g,zz
nnoremap g; g;zz
map gR :vimgrep <cword> **/*.cpp **/*.c **/*.h *.java *.js *.rc
map gr :vimgrep <cword> *.cpp *.c *.h *.java *.js *.rc
vnoremap gu u
vnoremap ir i[
onoremap ir i[
nnoremap n nzzzv
nnoremap <silent> p :YRPaste 'p'
xnoremap <silent> p :YRPaste 'p', 'v'
xmap s <Plug>Vsurround
nnoremap sc :set cursorcolumn! | set cursorcolumn?
nnoremap ss :set spell! | set spell?
nnoremap sn :set relativenumber! | set relativenumber?
nnoremap sw :set wrap! | set wrap?
nnoremap sh :set hlsearch! | set hlsearch?
nnoremap sl :set list! | set list?
nnoremap sp :call AutoUpperForMacros()
nnoremap s <Nop>
nnoremap tf :CommandTFlush
nnoremap tb :CommandTBuffer
nnoremap tt :CommandT
vnoremap u <Nop>
nnoremap vv ^vg_
nnoremap vaa ggvGg_
xnoremap <silent> x :YRDeleteRange 'v'
xnoremap <silent> y :YRYankRange 'v'
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap zo zCzo
nnoremap zO zCzO
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> a<BS>
snoremap <silent> <S-Tab> i<Right>=BackwardsSnippet()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <silent> <SNR>83_yrrecord :call YRRecord3()
nnoremap <SNR>60_ListSnippets :ListSnippets
nnoremap <SNR>60_DeleteSnippet :DeleteSnippet
nnoremap <SNR>60_EditSnippet :EditSnippet
nnoremap <SNR>60_InsertSnippet :InsertSnippet
nnoremap <SNR>60_AppendSnippet :AppendSnippet
vnoremap <SNR>60_AddSnippet :AddSnippet
nnoremap <SNR>60_AddSnippet :%AddSnippet
nmap <silent> <Plug>NERDCommenterAppend :call NERDComment(0, "append")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment(0, "toEOL")
vnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(1, "uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(0, "uncomment")
vnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(1, "nested")
nnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(0, "nested")
vnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(1, "alignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(0, "alignBoth")
vnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(1, "alignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(0, "alignLeft")
vmap <silent> <Plug>NERDCommenterYank :call NERDComment(1, "yank")
nmap <silent> <Plug>NERDCommenterYank :call NERDComment(0, "yank")
vnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(1, "invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(0, "invert")
vnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(1, "sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(0, "sexy")
vnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(1, "minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(0, "minimal")
vnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(1, "toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(0, "toggle")
vnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(1, "norm")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(0, "norm")
nnoremap <silent> <SNR>37_quit :call fontsize#quit()
nnoremap <silent> <SNR>37_setDefault :call fontsize#setDefault()
nnoremap <silent> <SNR>37_default :call fontsize#default()
nnoremap <silent> <SNR>37_dec :call fontsize#dec()
nnoremap <silent> <SNR>37_inc :call fontsize#inc()
vnoremap <S-Right> <Nop>
vnoremap <S-Left> <Nop>
vnoremap <S-Down> <Nop>
vnoremap <S-Up> <Nop>
nnoremap <S-Right> <Nop>
nnoremap <S-Left> <Nop>
nnoremap <S-Down> <Nop>
nnoremap <S-Up> <Nop>
vnoremap <silent> <Down> :call AddEmptyLineAbove()gv
vnoremap <silent> <Up> :call DelEmptyLineAbove()gv
nnoremap <silent> <Down> :call AddEmptyLineAbove()
nnoremap <silent> <Up> :call DelEmptyLineAbove()
nnoremap <silent> <Plug>CalendarH :cal Calendar(1)
nnoremap <silent> <Plug>CalendarV :cal Calendar(0)
nnoremap <silent> <F8> :RGrep =expand("<cword>") *.cpp *.c *.h *.H *.asm *.cc *.C *.CPP
nmap <F4> ['
nmap <F3> ]'
nmap <F2> : ShowMarksPlaceMark
nmap <F7> :so $VIM\vimfiles\sessions\Session.vim
noremap <F9> :NERDTreeToggle
nnoremap <F6> :GundoToggle
nnoremap <S-F2> :Ack =expand("<cword>")
vnoremap <silent> <C-Down> :call AddEmptyLineBelow()gv
vnoremap <silent> <C-Up> :call DelEmptyLineBelow()gv
nnoremap <silent> <C-Down> :call AddEmptyLineBelow()
nnoremap <silent> <C-Up> :call DelEmptyLineBelow()
nnoremap <S-Tab> %
nmap <C-Tab> w
nmap <F5> 0y$:=GotoHelp(@0)
noremap <F1> :call Do_CsTag()
nnoremap <silent> <F11> :TagbarToggle
nnoremap <silent> <F10> :TlistToggle
noremap <F12> :call FormatCode()
nnoremap <silent> <M-C-Right> :if tabpagenr() == tabpagenr("$")|tabm 0|el|exe "tabm ".tabpagenr()|en
nnoremap <silent> <M-C-Left> :if tabpagenr() == 1|exe "tabm ".tabpagenr("$")|el|exe "tabm ".(tabpagenr()-2)|en
nnoremap <C-S-Right> 5<
nnoremap <C-S-Up> 5-
nnoremap <C-S-Down> 5+
nnoremap <C-S-Left> 5>
nnoremap <silent> <C-Right> :bp
nnoremap <silent> <C-Left> :bnext
omap <C-Down> j
omap <C-Up> k
vmap <M-k> :m'<-2`>my`<mzgv`yo`z
vmap <M-j> :m'>+`<my`>mzgv`yo`z
nmap <M-k> mz:m-2`z
nmap <M-j> mz:m+`z
xnoremap <BS> x
vmap <C-Del> "*d
vmap <S-Del> "*d
vmap <C-Insert> "*y
vmap <S-Insert> "-d"*P
nmap <S-Insert> "*P
inoremap  I
cnoremap  <Home>
inoremap  A
cnoremap  <End>
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <silent> 	 =TriggerSnippet()
imap <expr> <NL> pumvisible()?"\":"\"
cnoremap  
imap <expr>  pumvisible()?"\":"\"
imap  $a
imap  <Plug>SuperTabForward
cnoremap  <Down>
imap  <Plug>SuperTabBackward
cnoremap  <Up>
inoremap <silent> 	 =ShowAvailableSnips()
imap  <Plug>Isurround
inoremap  m'gUiw`'a
inoremap  :set pastemui+mv'uV'v=:set nopaste
cmap  +
inoremap   <BS>:call InsertCloseTag()a
inoremap # X<BS>#
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cmap @vd vertical diffsplit
map ¹ 9gt
map ¸ 8gt
map · 7gt
map ¶ 6gt
map µ 5gt
map ´ 4gt
map ³ 3gt
map ² 2gt
map ± 1gt
map ° 0gt
map <silent> ­ :call EchoFuncP()
map <silent> ½ :call EchoFuncN()
nnoremap … dd
inoremap jj 
cnoremap w!! w !sudo tee % >/dev/null
iabbr writting writing
iabbr wierd weird
iabbr Wendesday Wednesday
iabbr villian villain
iabbr vegeterian vegetarian
iabbr vaccuum vacuum
iabbr ukelele ukulele
iabbr triathalon triathlon
iabbr tounge tongue
iabbr tommorrow tomorrow
iabbr thier their
iabbr suprise surprise
iabbr supercede supersede
iabbr suggestable suggestible
iabbr stagitory statutory
iabbr speach speech
iabbr sincerly sincerely
iabbr similiar similar
iabbr sieze seize
iabbr sherbert sherbet
iabbr seperate separate
iabbr seige siege
iabbr rythm rhythm
iabbr reguardless regardless
iabbr reccomend recommend
iabbr recieve receive
iabbr rasberry raspberry
iabbr publically publicly
iabbr pronounciation pronunciation
iabbr preceeding preceding
iabbr potatoe potato
iabbr Pokeman Pokémon
iabbr Pharoah Pharaoh
iabbr pertend pretend
iabbr posession possession
iabbr persue pursue
iabbr perserverance perseverance
iabbr percieve perceive
iabbr peice piece
iabbr pasttime pastime
iabbr paralell parallel
iabbr opthamologist ophthalmologist
iabbr oppurtunity opportunity
iabbr occurence occurrence
iabbr occured occurred
iabbr noticable noticeable
iabbr ninty ninety
iabbr nineth ninth
iabbr nickle nickel
iabbr neice niece
iabbr monkies monkeys
iabbr mit mitt
iabbr missle missile
iabbr mispell misspell
iabbr mischievious mischievous
iabbr miniscule minuscule
iabbr millenium millennium
iabbr masterbate masturbate
iabbr mabey maybe
iabbr lisence license
iabbr libary library
iabbr intresting interesting
iabbr innoculate inoculate
iabbr independance independence
iabbr hypocracy hypocrisy
iabbr hygeine hygiene
iabbr hunderd hundred
iabbr heros heroes
iabbr harrass harass
iabbr hampster hamster
iabbr grammer grammar
iabbr goverment government
iabbr geuss guess
iabbr geneology genealogy
iabbr freind friend
iabbr fourty forty
iabbr flouride fluoride
iabbr flourescent fluorescent
iabbr Febuary February
iabbr facist fascist
iabbr extremly extremely
iabbr expresso espresso
iabbr enviroment environment
iabbr embarass embarrass
iabbr dispell dispel
iabbr diptheria diphtheria
iabbr diety deity
iabbr desireable desirable
iabbr definately definitely
iabbr decathalon decathlon
iabbr decaffinated decaffeinated
iabbr Dalmation Dalmatian
iabbr congradulations congratulations
iabbr concieve conceive
iabbr concensus consensus
iabbr committment commitment
iabbr cemetary cemetery
iabbr Caucasion Caucasian
iabbr Britian Britain
iabbr beleive believe
iabbr befor before
iabbr autum autumn
iabbr athiest atheist
iabbr alterior ulterior
iabbr advertisment advertisement
iabbr adress address
iabbr acheive achieve
iabbr accomodation accommodation
iabbr abberration aberration
iabbr forcably forcibly
iabbr instead in stead
iabbr headsup heads up
iabbr ofcourse of course
iabbr msmpt msmtp
iabbr im I'm
iabbr defnitly definitely
iabbr lemme let me
iabbr woulda would've
iabbr wanna want to
iabbr prolly probably
iabbr outta out of
iabbr hafta have to
iabbr havent haven't
iabbr wouldnt wouldn't
iabbr wont won't
iabbr dont don't
iabbr cant can't
iabbr teh the
iabbr #d #define
iabbr #i #include
iabbr iname Rainbow.wang
iabbr r@ rainbow014112@gmail.com
iabbr igmail rainbow014112@gmail.com
iabbr imail Rainbow <rainbow014112@gmail.com>
iabbr itime =strftime("%H:%M")
iabbr idate =strftime("%Y-%m-%d")
iabbr xdate =strftime("%d/%m/%y %H:%M:%S")
iabbr lhap ???
iabbr lsad ?_?
iabbr ldis ?_?
iabbr <silent> ghs/ http://github.com/sjl/=EatChar('\s')
iabbr <silent> gh/ http://github.com/=EatChar('\s')
iabbr <silent> bbs/ http://bitbucket.org/sjl/=EatChar('\s')
iabbr <silent> bb/ http://bitbucket.org/=EatChar('\s')
iabbr <silent> sl/ http://stevelosh.com/=EatChar('\s')
let &cpo=s:cpo_save
unlet s:cpo_save
set ambiwidth=double
set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set backup
set backupdir=D:\\Vim\\tmp\\backup\\
set backupext=.bk
set browsedir=buffer
set cindent
set cinoptions=:0,(sus,u0,U1,g0,t0
set cmdheight=2
set complete=.,b,t,k
set completefunc=neocomplcache#manual_complete
set completeopt=longest,menuone,preview
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag
set cscopeverbose
set dictionary=~\\dict\\
set diffexpr=MyDiff()
set diffopt=filler,vertical
set directory=D:\\Vim\\tmp\\swap\\
set encoding=utf-8
set errorformat=%f\ \ %l\ \ %c\ \ %m
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5,euc-jp,sjis,euc-kr,ucs-2le,latin1,chinese
set fileformats=dos,unix,mac
set fillchars=diff:?
set foldlevelstart=0
set formatoptions=cqorn1
set grepprg=findstr\ /n\ /s\ /i\ /r\ /c:$*
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12:cANSI,Menlo\ for\ Powerline:h12:cANSI,Monaco:h12:cANSI
set guifontwide=Monaco:h12:cANSI,Yahei_Mono:h11,SimHei:h11
set guioptions=egtb
set guitablabel=%{ShortTabLabel()}
set helplang=cn
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set iskeyword=@,48-57,_,128-167,224-235,_,$,@,%,#,-
set nojoinspaces
set langmenu=none
set laststatus=2
set lazyredraw
set linespace=0
set listchars=tab:|\ ,nbsp:%,trail:-
set matchpairs=(:),{:},[:],<:>
set matchtime=3
set modelines=0
set path=.,,,./include;
set report=0
set ruler
set rulerformat=%15(%c%V\ %p%%%)
set runtimepath=C:\\Documents\ and\ Settings\\rambo_wang.OOZIC/vimfiles,~/,~\\bundle\\DoxygenToolkit,~\\bundle\\FormatCode.vim,~\\bundle\\SearchComplete,~\\bundle\\ShowFunc,~\\bundle\\ToggleComment,~\\bundle\\VisIncr,~\\bundle\\ZoomWin,~\\bundle\\ack,~\\bundle\\autoclose,~\\bundle\\autofix,~\\bundle\\autoload_cscope,~\\bundle\\bufexplorer,~\\bundle\\calendar,~\\bundle\\command-t,~\\bundle\\commentary,~\\bundle\\compiler,~\\bundle\\cscope_maps,~\\bundle\\ctrlp,~\\bundle\\cucumbertables.vim,~\\bundle\\easymotion,~\\bundle\\file_line.vim,~\\bundle\\fix_arrows,~\\bundle\\fontsize-0.1.1,~\\bundle\\genutils,~\\bundle\\git,~\\bundle\\git-vim,~\\bundle\\grep-operator.vim,~\\bundle\\grep-vim,~\\bundle\\gundo-vim,~\\bundle\\lib_vim,~\\bundle\\linediff,~\\bundle\\mark,~\\bundle\\marksbrowser,~\\bundle\\matchit,~\\bundle\\matchparen,~\\bundle\\matlab,~\\bundle\\matrix,~\\bundle\\mru,~\\bundle\\neocomplcache,~\\bundle\\neocomplcache-snippets-complete,~\\bundle\\nerdcommenter,~\\bundle\\nerdtree,~\\bundle\\powerline,~\\bundle\\rainbow_parentheses,~\\bundle\\renamer,~\\bundle\\rgrep,~\\bundle\\scratch.vim,~\\bundle\\showmarks,~\\bundle\\s
set scrolloff=999
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize
set shell=cmd.exe
set shiftround
set shortmess=atI
set showbreak=?
set showtabline=2
set sidescroll=1
set sidescrolloff=10
set smartcase
set smartindent
set spellfile=~\\dict\\custom-dictionary.utf-8.add
set splitbelow
set splitright
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%]\ line:%l/%L\ col:%v
set switchbuf=useopen,usetab,newtab
set tags=tags;
set termencoding=utf-8
set textwidth=80
set notimeout
set timeoutlen=500
set title
set titlestring=%f\ %h%m%r%w\ -\ %{v:progname}
set ttimeout
set ttimeoutlen=10
set virtualedit=block
set whichwrap=b,s,<,>,[,]
set wildignore=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.o,*.obj,*.exe,*.dll,*.manifest,*.spl,*.sw?,*.DS_Store,*.luac,migrations,*.pyc,*.orig,classes,lib,*.bak,*.e,*~,*.o,*.obj,.git,*.pyc,*.lst
set wildmenu
set window=48
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 .yankring_history_file_v2.txt
args .yankring_history_file_v2.txt
set lines=49 columns=127
edit .yankring_history_file_v2.txt
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,(sus,u0,U1,g0,t0
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,b,t,k
setlocal completefunc=neocomplcache#manual_complete
setlocal nocopyindent
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
setlocal foldcolumn=0
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=100
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=marker
setlocal foldminlines=1
setlocal foldnestmax=20
set foldtext=MyFoldText()
setlocal foldtext=MyFoldText()
setlocal formatexpr=
setlocal formatoptions=cqorn1
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,128-167,224-235,_,$,@,%,#,-
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
set numberwidth=5
setlocal numberwidth=5
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=~\\dict\\custom-dictionary.utf-8.add
setlocal spelllang=en
setlocal statusline=%!Pl#Statusline(0,1)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=80
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 1 - ((0 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=atI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
