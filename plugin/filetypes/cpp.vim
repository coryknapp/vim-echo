let g:loaded_vim_echo_filetype = 1

let g:echo_prefix = "std::cout << \""
let g:echo_suffix = "\" << std::endl"

function! EchoSanitizeLine(line)
	return EchoStandardSanitizeLine(a:line)
endfunction
