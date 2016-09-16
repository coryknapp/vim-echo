" if exists('g:loaded_vim_echo') || v:version < 700|| &cp
"   finish
" endif
" let g:loaded_vim_echo= 1

nnoremap <silent> <Plug>(vim-echo-ze) :call EchoInsertBelow()<CR>
nmap ze <Plug>(vim-echo-ze)

function! EchoStandardSanitizeLine(line)
	let line = substitute(a:line, "\\", "\\\\", 'g')
	let line = substitute(a:line, "\"", "\\\"", 'g')	
	return a:line
endfunction

function! EchoFormStatment(line)
	let line = EchoSanitizeLine(a:line)
	return line
endfunction

function! EchoInsertBelow()
	"get and sanitize the current line
	let line = EchoFormStatment(getline('.'))
	normal! o
	call setline('.',s:echo_prefix.line.s:echo_suffix)
endfunction

function! EchoInsertAbove()
	"get and sanitize the current line
	let line = EchoFormStatment(getline('.'))
	normal! O
	call setline('.',s:echo_prefix.line.s:echo_suffix)
endfunction

function! EchoLoadFiletype()
	let path = expand('<sfile>:p:h').'/filetypes/'.&filetype.'.vim'
	if filereadable(path)
		exec 'source '.expand('<sfile>:p:h').'/filetypes/cpp.vim'
	endif
endfunction

augroup vim_echo_filetype
	autocmd!
	autocmd FileType * call EchoLoadFiletype()
augroup END
