" Plugin for modifying guifont size.
" Maintainer:   Michael Henry (vim at drmikehenry.com)
" License:      This file is placed in the public domain.

if exists("loaded_fontsize")
    finish
endif
let loaded_fontsize = 1

" Save 'cpoptions' and set Vim default to enable line continuations.
let s:save_cpoptions = &cpoptions
set cpoptions&vim

if ! hasmapto("<Plug>FontsizeInc", "n")
    nmap <silent> <Leader>++  <Plug>FontsizeInc
    nmap <silent> <Leader>==  <Plug>FontsizeInc
endif

if ! hasmapto("<Plug>FontsizeDec", "n")
    nmap <silent> <Leader>--  <Plug>FontsizeDec
endif

if ! hasmapto("<Plug>FontsizeDefault", "n")
    nmap <silent> <Leader>00  <Plug>FontsizeDefault
endif

" Mappings using <SID>m_ are inspired by the bufmru.vim plugin.
" The concept is to enter a "mode" via an initial mapping.  Once
" in this mode, some mode-specific keystrokes now behave as if they
" were mapped.  After 'timeoutlen' milliseconds have elapsed, the
" new "mode" times out and the new "mappings" are effectively disabled.
"
" This emulation of a "mode" is accomplished via a clever techinque
" wherein each operation terminates with a partial mapping to <SID>m_.
" Each new keystroke completes a mapping that itself terminates with
" <SID>m_, keeping an extensible chain of mappings going as long as
" they arrive before 'timeoutlen' milliseconds elapses between keystrokes.

nmap <silent> <Plug>FontsizeInc       <SID>m_+
nmap <silent> <Plug>FontsizeDec       <SID>m_-
nmap <silent> <Plug>FontsizeDefault   <SID>m_0

nmap <silent> <SID>m_+        <SID>inc<SID>m_
nmap <silent> <SID>m_=        <SID>inc<SID>m_
nmap <silent> <SID>m_-        <SID>dec<SID>m_
nmap <silent> <SID>m_0        <SID>default<SID>m_
nmap <silent> <SID>m_!        <SID>setDefault<SID>m_
nmap <silent> <SID>m_q        <SID>quit
nmap <silent> <SID>m_<SPACE>  <SID>quit
nmap <silent> <SID>m_<CR>     <SID>quit
nmap <silent> <SID>m_         <SID>quit

nnoremap <silent> <SID>inc         :call fontsize#inc()<CR>
nnoremap <silent> <SID>dec         :call fontsize#dec()<CR>
nnoremap <silent> <SID>default     :call fontsize#default()<CR>
nnoremap <silent> <SID>setDefault  :call fontsize#setDefault()<CR>
nnoremap <silent> <SID>quit        :call fontsize#quit()<CR>

command! FontsizeInc        call fontsize#inc()
command! FontsizeDec        call fontsize#dec()
command! FontsizeDefault    call fontsize#default()
command! FontsizeSetDefault call fontsize#setDefault()

" Restore saved 'cpoptions'.
let cpoptions = s:save_cpoptions
" vim: sts=4 sw=4 tw=80 et ai:
