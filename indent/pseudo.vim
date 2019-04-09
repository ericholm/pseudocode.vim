setlocal indentexpr=PseudoIndent()

function! PseudoIndent()
	let line = getline(v:lnum)
	return indent(&tabstop)
endfunction
