let g:loaded_vim_echo_filetype = 1

let g:echo_prefix = "System.out.println(\""
let g:echo_suffix = "\");"

function! EchoSanitizeLine(line)
	return EchoStandardSanitizeLine(a:line)
endfunction
