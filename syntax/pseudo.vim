" Match language specific keywords
syntax keyword psKeywords IF BEGIN END NEXT DIM RETURN Let
syntax keyword psConditionals IF ENDIF ELSE CASEWHERE ENDCASE THEN
syntax keyword psRepeat WHILE FOR NEXT ENDIF ENDWHILE
syntax keyword psBoolean true false
syntax match psFunction "(?<=BEGIN )([a-zA-Z_{1}][a-zA-Z0-9_]+)"

syntax match psNumber "\v<\d+>"
syntax match psNumber "\v<\d+\.\d+>"
syntax match psNumber "\v<\d*\.?\d+([Ee]-?)?\d+>"
syntax match psNumber "\v<0x\x+([Pp]-?)?\x+>"
syntax match psNumber "\v<0b[01]+>"
syntax match psNumber "\v<0o\o+>"

syntax match psComment "\/\/.*$"

syntax region swiftString start=/"/ skip=/\\"/ end=/"/ oneline contains=swiftInterpolatedWrapper
syntax region swiftInterpolatedWrapper start="\v\\\(\s*" end="\v\s*\)" contained containedin=swiftString contains=swiftInterpolatedString
syntax match swiftInterpolatedString "\v\w+(\(\))?" contained containedin=swiftInterpolatedWrapper

highlight default link psComment Comment
highlight default link psFunction String 
highlight default link psKeywords Keyword
highlight default link swiftString String
highlight default link psNumber Number
highlight default link psBoolean Boolean
highlight default link psConditionals Conditional
highlight default link psRepeat Repeat
