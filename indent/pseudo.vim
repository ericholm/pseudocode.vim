setlocal indentexpr=PseudoIndent()

function! PseudoIndent()
	let line = getline(v:lnum)
	let previousNum = prevnonblank(v:lnum - 1)
	let previous = getline(previousNum)
	if previous =~ "BEGIN" && line !~ "END"
		return indent(previousNum) + &tabstop
	endif
	
	if previous =~ "FOR" && line !~ "NEXT"
		return indent(previousNum) + &tabstop
	endif

	if previous =~ "WHILE" && previous !~ "ENDWHILE" && line !~ "ENDWHILE"
		return indent(previousNum) + &tabstop
	endif

	
	if previous =~ "IF" && previous !~ "ENDIF" && (line !~ "ENDIF" || line !~ "ELSE") 
		return indent(previousNum) + &tabstop
	endif


	if previous =~ "ELSE" && line !~ "ENDIF"
		return indent(previousNum) + &tabstop
	endif





	return indent(previousNum)
endfunction
