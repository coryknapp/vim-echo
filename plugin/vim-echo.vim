" if exists('g:loaded_vim_echo') || v:version < 700|| &cp
"   finish
" endif
" let g:loaded_vim_echo= 1

nnoremap <silent> <Plug>(vim-echo-ze) :call EchoInsertBelow()<CR>
nmap ze <Plug>(vim-echo-ze)

" calling  expand('<sfile>') gives the name of the enclosing function, so we
" have to do it in advance
let s:ft_dir_path = expand('<sfile>:p:h').'/filetypes/'

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
	call setline('.',g:echo_prefix.line.g:echo_suffix)
endfunction

function! EchoInsertAbove()
	"get and sanitize the current line
	let line = EchoFormStatment(getline('.'))
	normal! O
	call setline('.',g:echo_prefix.line.g:echo_suffix)
endfunction

function! EchoLoadFiletype()
	let path = s:ft_dir_path.&filetype.'.vim'
	if filereadable(path)
		exec 'source '.path
	endif
endfunction

augroup vim_echo_filetype
	autocmd!
	autocmd FileType * call EchoLoadFiletype()
augroup END
