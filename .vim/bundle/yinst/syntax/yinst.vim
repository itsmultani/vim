" Vim syntax file
" Language:     yinst config file
" Maintainer:   Bill Hails <billh@europe.yahoo-inc.com>
" Last Change:  Mon Jan  6 15:05:13 GMT 2003
" Filenames:    *.yicf

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn match YinstVersion "\<[0-9][0-9]*\(\.[0-9][0-9]*\)*\>"
syn match YinstSpecialChar "-"
syn match YinstSpecialChar "*"
syn match YinstMandatory "^PRODUCT_NAME\s*=\s*" nextgroup=YinstText skipwhite
syn match YinstMandatory "^VERSION\s*=\s*"
syn match YinstMandatory "^SHORT_DESC\s*=\s*" nextgroup=YinstText skipwhite
syn match YinstMandatory "^LONG_DESC\s*=\s*" nextgroup=YinstText skipwhite
syn match YinstMandatory "^CUSTODIAN\s*=\s*" nextgroup=YinstText skipwhite
syn match YinstMandatory "^PERM\s*=\s*"
syn match YinstMandatory "^OWNER\s*=\s*" nextgroup=YinstText skipwhite
syn match YinstMandatory "^GROUP\s*=\s*" nextgroup=YinstText skipwhite

syn match YinstOptional "^PACKAGE_OS_SPECIFIC\s*=" nextgroup=YinstText skipwhite
syn match YinstOptional "^PACKAGE_OS_VERSIONED\s*=" nextgroup=YinstText skipwhite

syn match YinstSpecial "^YINST\s*=" nextgroup=YinstPkgCfg skipwhite
syn match YinstPkgCfg /\<requires\s\+pkg\>/ contained nextgroup=YinstPkg skipwhite
syn match YinstPkg /\S\+/ contained

syn match YinstAction "^file\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^f\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^configfile\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^c\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^patchfile\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^p\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^glob\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^g\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^dir\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^d\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^symlink\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^s\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^crontab\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^fifo\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^noop\s\+" nextgroup=YinstActionSpec
syn match YinstAction "^find\s\+" nextgroup=YinstActionSpec

syn region YinstActionSpec start=/./ end=/$/ contained contains=YinstTarget,YinstVersion,YinstSpecialChar

syn region YinstComment start="^[ \t]*#" end="$"

syn region YinstString start=+'+ end=+'+
syn region YinstString start=+"+ end=+"+
syn region YinstShell start=+`+ end=+`+
syn match YinstURL "\<http://\S\+" contained
syn region YinstText start=/[^`]/ end=/$/ contained contains=YinstURL
syn match YinstTarget "[^/]\<\(bin\|conf\|doc\|etc\|include\|info\|lib\|libdata\|libexec\|logs\|man\|sbin\|share\|tmp\|var\|yinst\)/\S\+" contained


if version >= 508 || !exists("did_yinst_syntax_inits")
  if version < 508
    let did_yinst_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink YinstMandatory Statement
  HiLink YinstURL Statement
  HiLink YinstSpecial Type
  HiLink YinstOptional Type
  HiLink YinstAction Function
  HiLink YinstPkgCfg Function
  HiLink YinstComment Comment
  " HiLink YinstText Comment
  HiLink YinstTarget Statement
  " HiLink YinstPkg Comment
  HiLink YinstString Number
  HiLink YinstVersion Number
  HiLink YinstShell PreProc
  HiLink YinstSpecialChar SpecialChar

  delcommand HiLink
endif

let b:current_syntax = "yinst"

