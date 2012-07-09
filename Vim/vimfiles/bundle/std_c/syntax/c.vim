" Vim syntax file
" Language:     Standard C (C89, C94, and C99)
" Maintainer:   Mike Williams <mrw@eandem.co.uk>
" Filenames:    *.c,*.h
" Last Change:  24th June 2006
" URL:          http://www.eandem.co.uk/~mrw/vim/syntax
"
" Notes:
" See supplied help file on configuring and using this syntax highlight file.
"
" THIS FILE CANNOT BE INCLUDED BY OTHER SYNTAX FILES SUPPLIED WITH VIM!
"
" History:
" 1.1 Better handling of conditional operator, plus choice of highlighting for it.
" 1.2 Allow multibyte character and string constants (i.e. start with L) apart from #include.
" 1.3 Rework character constants to allow for character sequences.
" 1.4 Add functions - catches macros, including defines like #define myconst (0).
" 1.5 Add macro functions and correct #define to use Define, not Macro.
" 1.6 Add missing hi link for cComment2String.
" 1.7 Add cComment[2]String to exclude cluster for parens.
"
" 2.1 Remove cPPOperator(defined) from parens exclusion, but does add it to normal code.
" 2.2 Start adding patterns for pointer dereference '*', and address of '&'.
" 2.3 Tidy up character constant handling.
" 2.4 Add cCommentSkip to exclusion list for paren group.
"
" 3.1 Removed code to pull in extensions, can now be done with au Syntax ...
" 3.2 Add cCharacterNoError to exclusion list for paren group.
" 3.3 Allow trailing dots on fp number to be part of fp number.
" 3.4 Allow u and/or l suffixes for octal numbers.
" 3.5 Move erroneous octal numbers to highlight only if allowed octals.
" 3.6 Add printf and scanf format string highlighting.
" 3.7 Add Notes and Acknowledgements.
" 3.8 Macros starting with SIG followed by upper or _ claimed by implementation.
" 3.9 ... as are all macros starting with and _ and followed by _ or upper case.
" 3.10 Moved Standard typedefs and constants to end to override all else.
" 3.11 Rework option flags to be closer to current distribution.
" 3.12 Fix cCharacter to use smallest string upto next '.
" 3.13 Improve working of cConditionalOperator.
" 3.14 Replaced ALLBUTs with explicit groups - fewer surprises in store.
" 3.15 Split types of space error as trailing ws in pp lines already handled.
" 3.16 Add common C extensions a la c.vim (asm, #warn(ing)).
" 3.17 Add flag to allow switching to c.vim level of highlighting.
" 3.18 Add bracket content error highlighting a la c.vim
"
" 4.1 Highlight arg to goto as label, not identifier.
" 4.2 Add support to optionally flag trigraphs as errors.
" 4.3 Additions for C94 - types, constants, macros, and format specifiers.
" 4.4 Allow highlighting of character constants as integers.
" 4.5 Fix #define highlighting when line start with whitespace.
"
" 5.1 Highlight integer literal constant 0 as octal, since it is.
" 5.2 Simplify string and comment highlighting a bit.
" 5.3 Fix two or more cCharacter's on a line, where '\\' is not the last one
"
" 6.1 Fix octal zeroes with more than one 0!
" 6.2 Hex numbers ending with 'e' and followed by [-+] is invalid!
" 6.3 Correct C99 hex float constants - were horribly wrong.
" 6.4 Add C99 reserved namespaces.
" 6.5 Rework C99 integer types and constants.
" 6.6 Add C94 feature warning.
" 6.7 Rework handling of C94 and C99 warnings.
" 6.8 Update to ViM 6 standard.
" 6.9 Change trigraph pattern for ?? following change to regexp syntax.
" 6.10 Remove digraph warnings from comments and strings.
"
" 7.1 Highlight floats of the form 10f as errors - invalid Standard C!
" 7.2 Sort out C99 reserved function name warnings.
" 7.3 Add C99 printf/scanf intger format specifiers.
" 7.4 Change references from ANSI to Standard.
" 7.5 Fix C94 & C99 error highlighting.
" 7.6 Add support for c_gnu in VIM compatible mode, else warnings!
" 7.7 Correct highlighting of contained C94, C99, and GNU language features.
" 7.8 Use cCommentGroup as per distribution.
" 7.9 Fix highlighting of Octal numbers.
" 7.10 Add Posix and Maths constants from distribution as options.
" 7.11 Flag hex/octal char constants in strings as non-portable.
" 7.12 Missed __STDC_HOSTED__ from list of C99 constants.
" 7.13 Add C99 #pragma STDC commands.
" 7.14 Add handling for ... in function arg lists.
" 7.15 Make numbers and types in comments switchable.
" 7.16 Optionally highlight C++ keywords as errors.
" 7.17 Highlight common date/time formats in comments.
"
" 8.1 Fix matching of months in date patterns - just alphabetics!
" 8.2 Correct matching exact width C99 integer typedefs.
" 8.3 Correct highlighting of C99 min/max width constant macros.
" 8.4 Add more C99 library types and macro constants I missed.
" 8.5 Oops, I is a constant in C99, not a type.
" 8.6 Allow {} within paren with GCC macros - controlled by c_gnu.
" 8.7 Correct handling of C99 universal characters.
" 8.8 Optionally warn multi char integer constants.
" 8.9 Add C99 specific printf/scanf highlighting.
" 8.10 Rework scanlist highlighting including if '-' appears in wrong place.
" 8.11 Warn on chars not in basic source char set.
" 8.12 WS warnings were not working - shows I don't normally use them.
" 8.13 Start using display to speed up highlighting.
" 8.14 C99 8 digit universal character introduced by U not u.
" 8.15 Allow use of %: digraph in PP statements with c_C94 defined.
" 8.16 Implement support for c_no_utf in VIM c.vim compatible mode.
" 8.17 Correct logic for when to display spacing errors.
" 8.18 Correct logic for when to display ANSI constants.
" 8.19 Correct logic handling mixes of C94/99 highlighting and warning.
" 8.20 Use Boolean highlight group for C99 true and false.
"
" 9.0 Added supporting help file.
" 9.1 Many clarifications to the documentation.
" 9.2 Simplify effect of setting VIM C compatible mode.
" 9.3 Warn on nesting of start of /* comments.
" 9.4 Fix flagging reserved C99 library function names, use me not he.
" 9.5 Redo space error highlighting as per VIM.
" 9.6 When syntax is other than C, use standard c.vim.
" 9.7 Use unlet! instead of unlet.
" 9.8 Add fortran keyword for K&R code when c_c_vim_compatible is defined.
"
" 10.0 Can't use display with cCharacter since could contain '"'
" 10.1 Add support for $ in VMS C identifiers controlled by c_vms.
" 10.2 Zero followed by a type suffix is still an octal value.
" 10.3 Highlight digraphs in syntax based on C94 and warning settings.
" 10.4 Allow \ to continue C++ style one line comments!
" 10.4a Fix bug in highlighting [...[...]...]
" 10.5 Oops. no such token as ~= - now an error to help the unsuspecting.
" 10.6 Scanlist can have a terminating '-'.
" 10.7 Fix bugs in 10.6 changes for C94 scanlists (wide char strings)
" 10.8 Fix highlighting of pre-C99 #pragma statements.
"
" 11.0 Allow #include to specify PP names as well as "" and <> strings.
" 11.1 Fix highlighting nested C comments.
" 11.2 Fix highlighting of system include file names.
" 11.3 Argh! - fix highlighting of comments et al in #include statements
" 11.4 Error highlight character constants in hex/octal with top bit set.
"
" 12.0 Add missing C99 F printf float format specifier.
" 12.1 Add VIM 7 spelling group to comments and strings.
" 12.2 Allow braces for C99 compound literals within parens.
" 12.3 Add comment folding controllable by c_no_comment_fold.
" 12.4 Make highlighting of braces in parens as errors controllable.
" 12.5 Add syntax based folding of statement blocks as per Bram's.

" TODO
" 1. Add #if 0/1 comment highlighting
" 2. Fix macro continuation \ highlighting within parens
"

" Catch sourcing of c.vim by other syntax files and redirect to default file.
if &syntax != 'c'
  source $VIMRUNTIME/syntax/c.vim
  finish
endif

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" VIM compatible mode takes precedence over some settings.
if exists("c_c_vim_compatible")
  " VIM C highlight C99 (sort of) unless c_no_c99 set.
  let c_C94 = 1
  unlet! c_C94_warn
  unlet! c_C99_warn
  if !exists("c_no_c99")
    let c_C99 = 1
  else
    unlet! c_C99
    let c_cpp_comments = 1
  endif
  let c_posix = 1
  let c_math = 1
  let c_no_names = 1
  " Clear items not in default C syntax file
  unlet! c_vms
  unlet! c_char_is_integer
  unlet! c_no_octal
  unlet! c_impl_defined
  unlet! c_comment_numbers
  unlet! c_comment_types
  unlet! c_comment_date_time
  unlet! c_warn_nested_comment
  unlet! c_warn_trigraph
  unlet! c_warn_digraph
  unlet! c_warn_8bitchars
  unlet! c_warn_multichar
  unlet! c_cpp_warn
endif

" C94 must be on for warnings.
if exists("c_C94_warn")
  let c_C94 = 1
  let c_warn_digraph = 1
endif

if exists("c_C99_warn")
  " C99 must be on for warnings.
  let c_C99 = 1

elseif exists("c_C99") && exists("c_C94_warn")
  " Should not warn for C94 if allowing C99!
  unlet! c_C94_warn
endif


" C is case sensitive
syn case match

" Use default keyword chars
set isk&

" An empty pattern that can be used to initialise a cluster that may not have
" anything else added to it.
syn match         cEmpty            "^$"

" C basic source character set
syn match         cCharsetError     display "[^a-zA-Z0-9!"#%&'()*+,-./:;<=>?[\]^_{|}~[:space:]]"

" C language keywords.
syn keyword       c89Statement      goto break return continue
syn cluster       cStatement        contains=c89Statement
" For compilers with asm keyword - error if not c_c_vim_compatible.
syn keyword       cKRStatement      asm
syn cluster       cStatement        add=cKRStatement
if !exists("c_c_vim_compatible") || exists("c_gnu")
  syn keyword     cGNUStatement     __asm__
  syn cluster     cStatement        add=cGNUStatement
endif
syn keyword       cLabel            case default
syn keyword       cConditional      if else switch
syn keyword       cRepeat           while for do
syn cluster       cStatement        add=cLabel,cConditional,cRepeat


" C data types
syn keyword       c89Type           int long short char void signed unsigned float double
syn cluster       cType             contains=c89Type
if exists("c_C99")
  syn keyword     c99Type           _Complex _Imaginary _Bool
  " These are actually macros that expand to the above.
  syn keyword     c99Type           bool complex imaginary
  syn cluster     cType             add=c99Type
endif
if !exists("c_c_vim_compatible") || exists("c_gnu")
  syn keyword     cGnuType          __label__ __complex__ __volatile__
  syn cluster     cType             add=cGNUType
endif


" C language structures
syn keyword       cStructureType    typedef
syn keyword       cStructure        struct union enum


" C storage modifiers
syn keyword       c89StorageClass   static register auto volatile extern const
syn cluster       cStorageClass     contains=c89StorageClass
syn keyword       cKRStorageClass   fortran
syn cluster       cStorageClass     add=cKRStorageClass
if exists("c_C99")
  syn keyword     c99StorageClass   restrict inline
  syn cluster     cStorageClass     add=c99StorageClass
else
  syn keyword     cGNUStorageClass  inline
  syn cluster     cStorageClass     add=cGNUStorageClass
endif
if !exists("c_c_vim_compatible") || exists("c_gnu")
  syn keyword     cGNUStorageClass  __attribute__
  syn cluster     cStorageClass     add=cGNUStorageClass
endif


" C operators
syn keyword       cSizeofOperator   sizeof
" rainbow
" syn cluster       cOperator         contains=cSizeofOperator
if !exists("c_c_vim_compatible")
  " C math operators
  syn match       cMathOperator     display "[-+\*/%=]"
  " C pointer operators - address of and dereference are context sensitive
  syn match       cPointerOperator  display "->\|\."
  " C logical   operators - boolean results
  syn match       cLogicalOperator  display "[!<>]=\="
  syn match       cLogicalOperator  display "=="
  " C bit operators
  syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
  syn match       cBinaryOperator   display "\~"
  syn match       cBinaryOperatorError display "\~="
  " More C logical operators - highlight in preference to binary
  syn match       cLogicalOperator  display "&&\|||"
  syn match       cLogicalOperatorError display "\(&&\|||\)="

  syn cluster     cOperator         add=cMathOperator,cPointerOperator,cLogicalOperator,cBinaryOperator,cLogicalOperatorError,cBinaryOperatorError
endif
if !exists("c_c_vim_compatible") || exists("c_gnu")
  syn keyword     cGNUOperator      typeof __real__ __imag__
  syn cluster     cOperator         add=cGNUOperator
endif


" Digraph handling - highlight differently if warning, C94, or not recognised.
if exists("c_C94") && !exists("c_warn_digraph")
  syn match       cDigraph          transparent display "%:\|<[:%]\|[:%]>"
else
  syn match       cDigraph          display "%:\|<[:%]\|[:%]>"
endif

" C identifiers - variables and functions
syn cluster       cIdentifier       contains=cEmpty
syn cluster       cFunction         contains=cEmpty
if !exists("c_no_names")
  syn match       c89Identifier     display "\<\h\w*\>"
  syn cluster     cIdentifier       add=c89Identifier
  syn match       c89Function       display "\<\h\w*\>\s*("me=e-1
  syn cluster     cFunction         add=c89Function
  if exists("c_vms")
    syn match     cVMSIdentifier    display "\<\h\(\w*\$\)\+\w*\>"
    syn cluster   cIdentifier       add=cVMSIdentifier
    syn match     cVMSFunction      display "\<\h\(\w*\$\)\+\w*\>\s*("me=e-1
    syn cluster   cFunction         add=cVMSFunction
  endif
  " Ellipses can only occur appear within function argument lists!
  syn match       cEllipses         display contained ",\s*\.\.\.\s*)"ms=s+1,me=e-1
  syn match       cEllipses         display contained "^\s*\.\.\.\s*)"me=e-1
  syn match       cEllipsesError    display "\.\{2,}"
endif


" C Integer character constants
" Escaped characters
syn match         cEscapeCharError  display contained "\\[^'\"?\\abfnrtv]"
syn match         cEscapeChar       display contained "\\['\"?\\abfnrtv]"
if exists("c_c_vim_compatible") && exists("c_gnu")
  syn match       cEscapeChar       display contained "\\e"
endif
" Octal characters
syn match         cOctalChar        display contained "\\\o\{1,3}"
syn cluster       cOCtalCharContents contains=cOctalChar
syn match         cOctalCharError   display contained "\\\(2\|3\)\o\{1,2}"
" Hex characters
syn match         cHexChar          display contained "\\x\x\+"
syn cluster       cHexCharContents  contains=cHexChar
syn match         cHexCharError     display contained "\\x[89a-f]\x\+"
if exists("c_warn_8bitchars")
  " Octal and hex chars in integer character contents not portable if top bit set.
  syn cluster     cHexCharContents  add=cHexCharError
  syn cluster     cOctalCharContents add=cOctalCharError
endif
" Useful groupings of character types
syn cluster       cSpecialChar      contains=cEscapeCharError,cEscapeChar,@cOctalCharContents,@cHexCharContents
syn cluster       cSpecialCharNoError contains=cEscapeChar,cOctalChar,cHexChar
if (exists("c_c_vim_compatible") || exists("c_C99")) && !exists("c_no_utf")
  " C99 universal chars - hmm, can appear anywhere!
  syn match       cUniversalChar    display contained "\\u\x\{4}"
  syn match       cUniversalChar    display contained "\\U\x\{8}"
  syn cluster     cSpecialChar      add=cUniversalChar
  syn cluster     cSpecialCharNoError add=cUniversalChar
endif
if !exists("c_warn_multichar")
  syn match       cMultiCharacter   "L\='\(\\.\|.\)\{-2,}'" contains=@cSpecialChar
else
  syn match       cCharacterError   "L\='\(\\.\|.\)\{-2,}'"
endif
syn match         cCharacter        "L\='\(\\.\|[^\']\)'" contains=cEscapeCharError,cEscapeChar
syn match         cCharacter        display "L\='\\x\x\x\='" contains=@cHexCharContents
syn match         cCharacter        display "L\='\\\o\{1,3}'" contains=@cOctalCharContents
syn match         cCharacterError   display "L\='\([^']*$\|'\)"
syn match         cCharacterNoError display contained "L\='\(\\.\|.\)\{-}'" contains=@cSpecialCharNoError


" C String constants
syn cluster       cStringContents   contains=@cSpecialChar,cPPLineJoin,@Spell
if exists("c_warn_8bitchars")
  " Octal and hex chars in strings not portable if top bit set.
  syn cluster     cStringContents   add=cHexCharError,cOctalCharError
endif
syn cluster       cFormat           contains=cEmpty
if !exists("c_no_cformat")
  " Where behaviour is undefined in a format string it will not be highlighted!
  " This explains why the 0 flag is omitted for string print format etc.

  " Anything other than the following patterns are undefined format strings
  syn match       cFormatError      display contained "%[^"]"
  syn match       cFormatError      display contained "%\""me=e-1
  " Catch implementation defined scanlists
  syn match       cFormatError      display contained "%\*\=\(0*[1-9]\d*\)\=\[\(\^.\|[^^]\)[^]-]*-[^]]*-\=\]"

  " octal and hex print formats (can have precision and h or l size specifier)
  syn match       cPrintFormat      display contained "%[-+0 #]*\(\*\|\d\+\)\=\(\.\(\*\|\d*\)\)\=[hl]\=[oxX]"
  " intger print formats (can have precision and h or l size specifier, but no # flag)
  syn match       cPrintFormat      display contained "%[-+0 ]*\(\*\|\d\+\)\=\(\.\(\*\|\d*\)\)\=[hl]\=[diu]"
  " fp print formats (can have precision but only L size specfier)
  syn match       cPrintFormat      display contained "%[-+0 #]*\(\*\|\d\+\)\=\(\.\(\*\|\d*\)\)\=L\=[eEfgG]"
  " string print formats (can have precision but no 0 or # flags)
  syn match       cPrintFormat      display contained "%[-]*\(\*\|[1-9]\d*\)\=\(\.\(\*\|\d*\)\)\=s"
  " number chars so far print formats (h or l size specifiers but no precision 0, or # flags, should allow optional parts?)
  syn match       cPrintFormat      display contained "%[-]*\(\*\|[1-9]\d*\)\=[hl]\=n"
  " character and pointer print formats (no size specifiers, precision, 0, or # flags)
  syn match       cPrintFormat      display contained "%[-]*\(\*\|[1-9]\d*\)\=[cp]"
  syn match       cPrintFormat      display contained "%%"

  " scanf formats may not have zero integer field width!
  " integer, octal and hex scan formats
  syn match       cScanFormat       display contained "%\*\=\(0*[1-9]\d*\)\=[hl]\=[oxXdinu]"
  " fp scan formats
  syn match       cScanFormat       display contained "%\*\=\(0*[1-9]\d*\)\=[lL]\=[eEfgG]"
  " char string scan format
  syn match       cScanFormat       display contained "%\*\=\(0*[1-9]\d*\)\=\[\(\^.\|[^^]\)[^]-]*-\=\]"
  " character, string and pointer scan formats
  syn match       cScanFormat       display contained "%\*\=\(0*[1-9]\d*\)\=[csp]"

  syn cluster     cFormat           add=cPrintFormat,cScanFormat,cFormatError

  if exists("c_C94")
    " C94 has new format codes for wide chars and strings (no 0 or # flags)
    syn match     c94PrintFormat    display contained "%[-]*\(\*\|[1-9]\d*\)\=\(\.\(\*\|\d*\)\)\=ls"
    syn match     c94PrintFormat    display contained "%[-]*\(\*\|[1-9]\d*\)\=lc"
    syn match     cFormatError      display contained "%\*\=\(0*[1-9]\d*\)\=l\[\(\^.\|[^^]\)[^]-]*-[^]]*-\=\]"
    syn match     c94ScanFormat     display contained "%\*\=\(0*[1-9]\d*\)\=l\[\(\^.\|[^^]\)[^]-]*-\=\]"
    syn match     c94ScanFormat     display contained "%\*\=\(0*[1-9]\d*\)\=l[cs]"
    syn cluster   cFormat           add=c94PrintFormat,c94ScanFormat
  endif
  if exists("c_C99")
    " integer conversions have new length modifiers
    syn match     c99PrintFormat    display contained "%[-+0 #]*\(\*\|\d\+\)\=\(\.\(\*\|\d*\)\)\=\(hh\|ll\|j\|z\|t\)[oxX]"
    syn match     c99PrintFormat    display contained "%[-+0 ]*\(\*\|\d\+\)\=\(\.\(\*\|\d*\)\)\=\(hh\|ll\|j\|z\|t\)[diu]"
    " fp conversion has new format specifier, and allows l length modifier for C89 ones
    syn match     c99PrintFormat    display contained "%[-+0 #]*\(\*\|\d\+\)\=\(\.\(\*\|\d*\)\)\=l[eEfgG]"
    syn match     c99PrintFormat    display contained "%[-+0 #]*\(\*\|\d\+\)\=\(\.\(\*\|\d*\)\)\=[lL]\=[aAF]"
    " number chars so has new length modifiers
    syn match     c99PrintFormat    display contained "%[-]*\(\*\|[1-9]\d*\)\=\(hh\|j\|z\|t\)n"

    " new length modifiers for integers
    syn match     c99ScanFormat     display contained "%\*\=\(0*[1-9]\d*\)\=\(hh\|ll|\j\|z\|t\)[oxXdinu]"
    " new fp conversion specifier
    syn match     c99ScanFormat     display contained "%\*\=\(0*[1-9]\d*\)\=[lL]\=[aAF]"
    syn cluster   cFormat           add=c99PrintFormat,c99ScanFormat
  endif

  syn cluster     cStringContents   add=@cFormat
endif
syn region        cString           start=+L\="+ skip=+\\"+ end=+"+ contains=@cStringContents

" C numeric constants.
syn case ignore
" Integer
syn match         cDecimal          display "\<\d\+\(u\=l\=\|lu\)\>"
" Hex integer
syn match         cHex              display "\<0x\x\+\(u\=l\=\|lu\)\>"
syn match         cHex              display "\<\d\+\h\>"
" But there is one illegal form of hex ...
syn match         cHexError         display "\<0x\x*e[-+]"
" Octal integers
"syn match         cOctalZero        display contained "0"
"syn match         cOctal            display "\<0\+\(u\=l\=\|lu\)\>" contains=cOctalZero
if exists("c_no_octal")
  syn match       cOctalError       display "\<0\+[1-9]\d*\(u\=l\=\|lu\)\>"
else
  syn match       cOctal            display "\<0\o*\(u\=l\=\|lu\)\>" contains=cOctalZero
  syn match       cOctalError       display "\<0\o*[89]\d*\(u\=l\=\|lu\)\>"
endif
syn cluster       cInteger          contains=cDecimal,cHex,cHexError,cOctal,cOctalError,cOctalZero
syn cluster       cIntegerNoOctalErr contains=cDecimal,cHex,cHexError,cOctal
" Fp with dot, optional exponent
syn match         c89Float          display "\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
" FP starting with a dot, optional exponent
syn match         c89Float          display "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
" FP without dot, with exponent
syn match         c89Float          display "\<\d\+e[-+]\=\d\+[fl]\=\>"
syn cluster       cFloat            contains=c89Float
" Fp with no dp or exponent is invalid
syn match         cFloatError       display "\<\d\+f\>"
" Initialise boolean cluster to be empty.
syn cluster       cBoolean          contains=cEmpty

"²»ÒªÕâ¶Î
"if exists("c_C99")
  " Integers have new length qualifiers.
  "syn match       c99Decimal        display "\<\d\+\(u\=ll\|llu\)\>"
  "syn match       c99Hex            display "\<0x\x\+\(u\=ll\|llu\)\>"
  "syn cluster     cInteger          add=c99Decimal,c99Hex
  "if exists("c_no_octal")
 "  syn match     c99OctalError     display "\<0\+[1-9]\d*\(u\=ll\=\|llu\)\>"
 " else
  "  syn match     c99Octal          display "\<0\o*\(u\=ll\=\|llu\)\>" contains=cOctalZero
  "  syn match     c99OctalError     display "\<0\o*[89]\d*\(u\=ll\=\|llu\)\>"
  "  syn cluster   cInteger          add=c99Octal
  "  syn cluster   cIntegerNoOctalErr contains=c99Octal
 " endif
 " syn cluster     cInteger          add=c99OctalError
  " Fp now has a hexadecimal format
  " Fp with dot, optional fractional part
 " syn match       c99Float          display "\<0x\x\+\(\.\x*\)\=p[-+]\=\d\+[fl]\="
  " FP starting with a dot
 " syn match       c99Float          display "0x\.\x\+p[-+]\=\d\+[fl]\=\>"
 " syn cluster     cFloat            add=c99Float
"endif

" Turn case matching back on
syn case match


" Highlight trailing and/or mixed space errors
if exists("c_space_errors")
  if !exists("c_no_trail_space_error")
    syn match     cTrailSpaceError  "\s\+$"
  endif
  if !exists("c_no_tab_space_error")
    syn match     cMixedSpaceError  display " \+\t"me=e-1
  endif
endif
syn cluster       cSpaceError       contains=cTrailSpaceError,cMixedSpaceError


" C comments
syn keyword       cTodo             contained TODO FIXME XXX
syn cluster       cCommentGroup     contains=cTodo,@cSpaceError
if exists("c_comment_strings")
  " A comment can contain cString, but a "*/" inside a cString in a cComment
  " DOES end the comment!  So we need to use a special type of cString:
  " cCommentString, which also ends on "*/", and sees a "*" at the start of
  " the line as comment again.
  syn match       cCommentSkip      contained "^\s*\*\($\|\s\+\)"
  syn cluster     cCommentStringContents contains=cCharacterNoError,@cSpecialCharNoError,cCommentSkip
  syn region      cCommentString    contained start=+L\="+ skip=+\\"+ end=+"+ end=+\*\(\\\s*\n\s*\)*\/+me=s-1 contains=@cCommentStringContents
  if exists("c_comment_numbers")
    syn cluster   cCommentGroup     add=@cIntegerNoOctalErr,@cFloat,cFloatError,@cBoolean,@cConstant
  endif
  if exists("c_comment_types")
    syn cluster   cCommentGroup     add=cType,@cTypedef
  endif
  if exists("c_comment_date_time")
    " Time formats: hh:mm[:ss]
    syn match     cTime             contained "\d\{2}\(:\d\{2}\)\{1,2}"
    " Date formats: dd mmm yy[yy], dd/mmm/yy[yy], dd-mmm-yy[yy]
    syn match     cDate             contained "\d\{1,2}[ -/]\a\{3}[ -/]\(\d\{2}\)\{1,2}"
    " Date formats: dd/mm/yy[yy], dd-mm-yy[yy]
    syn match     cDate             contained "\d\{1,2}[-/]\d\{1,2}[-/]\(\d\{2}\)\{1,2}"
    " Date formats: mmm dd yyyy
    syn match     cDate             contained "\a\{3} \d\{2} \d\{4}"
    " Date formats: ISO yyyy/mm/dd
    syn match     cDate             contained "\d\{4}/\d\{2}/\d\{2}"
    syn cluster   cCommentGroup     add=cTime,cDate
  endif
endif
if exists("c_warn_nested_comments")
  " Catch start of C comments within C comments.
  syn match       cCommentStartError contained "/\*"
endif
syn match         cCommentDelim     contained "/\*\|\*/"
if exists("c_no_comment_fold")
  syn region      cComment          keepend matchgroup=cCommentDelim start="/\*" end="\*/" contains=cCommentString,cCharacterNoError,@cCommentGroup,cCommentStartError,@Spell
else
  syn region      cComment          keepend matchgroup=cCommentDelim start="/\*" end="\*/" contains=cCommentString,cCharacterNoError,@cCommentGroup,cCommentStartError,@Spell fold
endif
syn match         cCommentError     "\*/"
if exists("c_cpp_comments") || (exists("c_C99") && !exists("c_C99_warn"))
  if exists("c_comment_strings")
    " Unfortunately this doesn't very well work for // type of comments :-(
    syn region    cComment2String   contained start=+L\="+ skip=+\\"+ end=+"+ end="$" contains=@cCommentStringContents
  endif
  if exists("c_no_comment_fold")
    syn region    cComment          start="//" skip="\\$" end="$" contains=cComment2String,cCharacterNoError,@cCommentGroup,cPPLineJoin,cPPLineJoinError,@Spell
  else
    syn region    cComment          start="//" skip="\\$" end="$" contains=cComment2String,cCharacterNoError,@cCommentGroup,cPPLineJoin,cPPLineJoinError,@Spell fold
  endif
else
  syn region      cCommentError     start="//" skip="\\$" end="$"
endif
syn sync ccomment cComment

" C Conditional operatior - ?:
syn cluster       cConditionalContents contains=cEmpty
if !exists("c_c_vim_compatible")
  syn cluster     cConditionalContents add=cCharsetError,@cInteger,cOctalError,@cFloat,cFloatError,@cBoolean
  syn cluster     cConditionalContents add=cString,cCharacter,cMultiCharacter,cCharacterError,@cConstant
  syn cluster     cConditionalContents add=@cIdentifier,@cFunction,@cMacro
  syn cluster     cConditionalContents add=@cType,@cTypedef,cStructure,cConditionalOperator,@cOperator,cOperatorError
  syn cluster     cConditionalContents add=cComment,cCommentError,@cSpaceError,cParen,cBracket
  syn cluster     cConditionalContents add=@cPPCommands,cDigraph
  syn region      cConditionalOperator start="?" end=":" contains=@cConditionalContents
endif


" C pre-processor commands
syn cluster       cPPCommands       contains=cPPEmptyLine,cInclude,cPreCondit,cDefine,cUndef,cLine,cPragma,cPreProc

" Pre-processor commands only allowed spaces and tabs as whitespace
syn match         cPPWhiteSpace     display contained "\s*"
syn match         cPPSpaceError     display contained "\(\e\|\r\|\b\)\+"

" Highlight cpp joined lines and those done incorrectly
syn match         cPPLineJoin       contained "\\$"
syn match         cPPLineJoinError  contained "\\\s\+$"

" Token operator
syn match         cPPTokenOperator  contained "\(%:\|#\)\{1,2}" contains=cDigraph

" Empty cpp lines which are not join or paste operations
syn match         cPPLineStart      transparent contained "^\s*\(%:\|#\)" contains=cDigraph
syn match         cPPEmptyLine      "^\s*\(%:\|#\).*$" contains=cComment,cPPWhiteSpace,cPPSpaceError,cPPLineStart

" Almost all pre-processor lines (not include) contain the following
syn cluster       cPPCommon         contains=cComment,cCommentError,cPPSpaceError,cPPEmptyLine,cPPLineJoin,cPPLineJoinError

" File inclusion
syn match         cPPInclude        transparent contained "^\s*\(%:\|#\)\s*include\>" contains=cDigraph
syn region        cPPIncludeFile    contained start=+"+ skip=+\\"+ end=+"+ contains=cPPLineJoin,cPPLineJoinError
syn match         cPPIncludeFile    contained "<[^>]*>"
syn match         cInclude          display "^\s*\(%:\|#\)\s*include\>\s*.*$" contains=cPPSpaceError,cPPInclude,cPPIncludeFile,@cPPCommon

" Conditional code
syn match         cPPIf             transparent contained "^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\|else\|endif\)\>" contains=cDigraph
syn region        cPPIfParen        transparent start='(' end=')' contains=@cPPIfInteger,cPPIfParen
syn keyword       cPPOperator       contained defined
syn cluster       cPPIfInteger      contains=@cInteger,cOctalError,cCharacter,cMultiCharacter,cCharacterError,@cConstant,@cMacro,@cIdentifier
syn cluster       cPPIfInteger      add=cMathOperator,cLogicalOperator,cBinaryOperator,cPPOperator
syn region        cPreCondit        start="^\s*\(%:\|#\)\s*\(if\|elif\)\>" skip="\\$" end="$" contains=cPPIf,@cPPIfInteger,cPPIfParen,@cPPCommon
syn cluster       cPPIfIdentifer    contains=@cIdentifier,@cMacro
syn region        cPreCondit        start="^\s*\(%:\|#\)\s*\(ifdef\|ifndef\)\>" skip="\\$" end="$" contains=cPPIf,@cPPIfIdentifier,@cPPCommon
syn region        cPreCondit        start="^\s*\(%:\|#\)\s*\(else\|endif\)\>" skip="\\$" end="$" contains=cPPIf,@cPPCommon

" Macros
syn cluster       cDefineContents   contains=cCharsetError,@cInteger,cOctalError,@cFloat,cFloatError,@cBoolean
syn cluster       cDefineContents   add=cString,cCharacter,cMultiCharacter,cCharacterError,@cConstant
syn cluster       cDefineContents   add=@cIdentifier,@cFunction,@cMacro,cUserCont,@cStatement
syn cluster       cDefineContents   add=@cType,@cTypedef,cStructure,cStructureType,@cStorageClass,cStorageClassError
syn cluster       cDefineContents   add=cConditionalOperator,@cOperator,cOperatorError,cPPTokenOperator
syn cluster       cDefineContents   add=@cSpaceError,cDefineParen,cBracket,cDigraph
syn match         cPPDefine         transparent contained "^\s*\(%:\|#\)\s*define\>" contains=cDigraph

syn region        cDefine           start="^\s*\(%:\|#\)\s*define\>" skip="\\$" end="$" contains=cPPDefine,cPPSpaceError,@cDefineContents,@cPPCommon

syn match         cPPUndef          transparent contained "^\s*\(%:\|#\)\s*undef\>" contains=cDigraph
syn region        cUndef            start="^\s*\(%:\|#\)\s*undef\>" skip="\\$" end="$" contains=cPPUndef,cIdentifer,@cMacro,@cPPCommon

syn cluster       cMacro            contains=cEmpty
if !exists("c_no_names")
  syn match       cCMacro           display "\<\u[[:upper:][:digit:]_]*\s*("me=e-1
  syn cluster     cMacro            add=cCMacro
  if exists("c_vms")
    syn match     cVMSMacro         display "\<\u\([[:upper:][:digit:]_]*\$\)\+[[:upper:][:digit:]_]*\s*("me=e-1
    syn cluster   cMacro            add=cVMSMacro
  endif
endif

" Line control
syn match         cPPLineNumber     display contained "\<\d\+\>"
syn match         cPPLineNumberError display contained "\<0\+\>"
syn match         cPPLine           transparent contained "^\s*\(%:\|#\)\s*line\>" contains=cDigraph
syn region        cLine             start="^\s*\(%:\|#\)\s*line\>" skip="\\$" end="$" contains=cPPLine,cPPLineNumber,cPPLineNumberError,cString,@cMacro,@cIdentifier,@cPPCommon

" Error
syn match         cPPMisc           transparent contained "^\s*\(%:\|#\)\s*error\>" contains=cDigraph
syn cluster       cPPTokens         contains=@cIdentifier,cString,@cInteger
syn region        cPreProc          start="^\s*\(%:\|#\)\s*error\>" skip="\\$" end="$" contains=cPPMisc,@cPPTokens,@cPPCommon

" Pragma
syn match         cPPPragma         transparent contained "^\s*\(%:\|#\)\s*pragma\>" contains=cDigraph
syn region        cPragma           start="^\s*\(%:\|#\)\s*pragma\>" skip="\\$" end="$" contains=cPPPragma,@cPPTokens,@cPPCommon
if exists("c_C99")
  " C99 has a fixed form of #pragma also.
  syn match       c99PPPragmaError  contained "[^[:space:]]\+"
  syn match       c99PPPragmaSTDC   contained "^\s*\(%:\|#\)\s*pragma STDC\>" contains=cDigraph
  syn keyword     c99PPPragmaOperator contained FP_CONTRACT FENV_ACCESS CX_LIMITED_RANGE ON OFF DEFAULT
  syn region      c99Pragma         start="^\s*\(%:\|#\)\s*pragma STDC\>" skip="\\$" end="$" contains=c99PPPragmaSTDC,c99PPPragmaOperator,c99PPPragmaError
  syn keyword     c99Pragma         _Pragma
  syn cluster     cPPCommands       add=c99Pragma
endif

if exists("c_c_vim_compatible")
  " Some compilers may support these pp commands
  syn match       cPPWarn           transparent contained "^\s*\(%:\|#\)\s*\(warn\|warning\)\>" contains=cDigraph
  syn region      cPreProc          start="^\s*\(%:\|#\)\s*\(warn\|warning\)\>" skip="\\$" end="$" contains=cPPWarn,@cPPTokens,@cPPCommon
endif


" C statement labels
syn match         cUserLabel        display contained "\h\w*"
syn match         cUserCont         display "^\s*\h\w*\s*:\s*" contains=cUserLabel
syn match         cUserCont         display ";\s*\h\w*\s*:\s*" contains=cUserLabel
syn match         cUserCont         display "goto\s\+\h\w*"lc=4 contains=cUserLabel
if exists("c_vms")
  syn match       cUserLabel        display contained "\h\(\w*\$\)\+\w*"
  syn match       cUserCont         display "^\s*\h\(\w*\$\)\+\w*\s*:\s*" contains=cUserLabel
  syn match       cUserCont         display ";\s*\h\(\w*\$\)\+\w*\s*:\s*" contains=cUserLabel
  syn match       cUserCont         display "goto\s\+\h\(\w*\$\)\+\w*"lc=4 contains=cUserLabel
endif

" C bitfield definitions - used to prevent highlighting as a statement label
syn match         cBitField         display "^\s*\h\w*\s*:\s*[1-9]"me=e-1 contains=@cIdentifier
syn match         cBitField         display ";\s*\h\w*\s*:\s*[1-9]"me=e-1 contains=@cIdentifier


if exists("c_vms")
  syn match       cBitField         display "^\s*\h\(\w*\$\)\+\w*\s*:\s*[1-9]"me=e-1 "contains=@cIdentifier
  syn match       cBitField         display ";\s*\h\(\w*\$\)\+\w*\s*:\s*[1-9]"me=e-1 "contains=@cIdentifier
endif



" Catch errors caused by wrong parenthesis and bracketing
syn cluster       cParenContents    contains=cCharsetError,@cInteger,cOctalError,@cFloat,cFloatError,@cBoolean
syn cluster       cParenContents    add=cString,cCharacter,cMultiCharacter,cCharacterError,@cConstant
syn cluster       cParenContents    add=@cIdentifier,@cFunction,cEllipses,cEllipsesError,@cMacro,@cType,@cTypedef,cStructure,@cStorageClass,cStorageClassError
syn cluster       cParenContents    add=@cOperator,cOperatorError,cConditionalOperator
syn cluster       cParenContents    add=cComment,cCommentError,@cSpaceError
syn cluster       cParenContents    add=@cPPCommands,cDigraph
if !exists("c_no_bracket_error")
  syn match       cErrBracketInParen contained "]\|:>" contains=cDigraph
  syn match       cErrInBracket     contained "[);{}]\|<%\|%>" contains=cDigraph
  if !exists("c_C94")
    syn region    cBracket          transparent start="\[" end="]" contains=@cParenContents,cBracket,cParen,cErrInBracket
  else
    syn region    cBracket          transparent start="\[\|<%" end="]\|%>" contains=@cParenContents,cBracket,cParen,cErrInBracket
  endif
  syn match       cBracketError     "]\|%>" contains=cDigraph
endif
if (!exists("c_C99") || exists("c_C99_warn")) && !exists("c_no_curly_error")
  " Braces not allowed in parenthesise pre C99
  syn match       cErrBraceInParen  contained "{\|}\|<%\|%>" contains=cDigraph
endif
syn region        cParen            transparent start='(' end=')' contains=@cParenContents,cParen,cBracket,cErrBraceInParen,cErrBracketInParen
syn cluster       cDefineParenContents contains=@cParenContents,cDefineParen,cBracket,cErrBracketInParen
if !exists("c_c_vim_compatible") || !exists("c_gnu")
  syn cluster     cDefineParenContents add=cErrBraceInParen
endif
"rainbow removed
syn region        cDefineParen      contained transparent start='(' end=')' contains=@cDefineParenContents
syn match         cParenError       ")"

" Syntax folding of statement blocks
syn region        cBlock            start="{" end="}" transparent fold

" C typedefs
syn cluster       cTypedef          contains=cEmpty
if !exists("c_no_ansi") || exists("c_ansi_typedefs")
  syn keyword     c89Typedef        size_t wchar_t ptrdiff_t sig_atomic_t fpos_t div_t ldiv_t
  syn keyword     c89Typedef        clock_t time_t va_list jmp_buf FILE
  syn cluster     cTypedef          add=c89Typedef

  if exists("c_c_vim_compatible")
    " VIM includes following typedefs
    syn keyword   cVIMTypedef       DIR
    syn cluster   cTypedef          add=cVIMTypedef
  endif

  if exists("c_C94")
    " C94 new typedefs
    syn keyword   c94Typedef        wint_t wctrans_t wctype_t mbstate_t
    syn cluster   cTypedef          add=c94Typedef
  endif
"rainbow added

  if exists("c_C99")
    " C99 new typedefs
    syn keyword   c99Typedef        fenv_t fexcept_t float_t double_t
    syn match     c99Typedef        display "\<u\=int\(_least\|_fast\)\=\d\+_t\>"
    syn match     c99Typedef        display "\<\=int\(_least\|_fast\)\=\d\+u\>"
    syn match     c99Typedef        display "\<\=int\(_least\|_fast\)\=\d\+s\>"
    syn match     c99Typedef        display "\<\=INT\(_least\|_fast\)\=\d\+U\>"
    syn match     c99Typedef        display "\<\=INT\(_least\|_fast\)\=\d\+S\>"
    " syn match     c99Typedef        display "^\s*\h\w*\s*_t"
    syn match     c99Typedef        display "\w\+_t\>"

    syn keyword   c99Typedef        FP32 FP64 BOOLEAN
    syn keyword   c99Typedef        UINT32 UINT16 UINT8
    syn keyword   c99Typedef        intptr_t uintptr_t intmax_t uintmax_t
    syn keyword   c99Typedef        lldiv_t imaxdiv_t
    syn cluster   cTypedef          add=c99Typedef
  endif
endif


" C constants
syn cluster       cConstant         contains=cEmpty
if !exists("c_no_ansi") || exists("c_ansi_constants")
  syn keyword     c89Constant       __LINE__ __FILE__ __DATE__ __TIME__ __STDC__
  syn keyword     c89Constant       CHAR_BIT MB_LEN_MAX MB_CUR_MAX
  syn keyword     c89Constant       UCHAR_MAX UINT_MAX ULONG_MAX USHRT_MAX
  syn keyword     c89Constant       INT_MIN LONG_MIN SHRT_MIN
  syn keyword     c89Constant       CHAR_MAX INT_MAX LONG_MAX SHRT_MAX
  syn keyword     c89Constant       SCHAR_MIN SINT_MIN SLONG_MIN SSHRT_MIN
  syn keyword     c89Constant       SCHAR_MAX SINT_MAX SLONG_MAX SSHRT_MAX
  syn keyword     c89Constant       FLT_RADIX FLT_ROUNDS FLT_DIG FLT_MANT_DIG FLT_EPSILON
  syn keyword     c89Constant       FLT_MIN FLT_MAX FLT_MIN_EXP FLT_MAX_EXP FLT_MIN_10_EXP FLT_MAX_10_EXP
  syn keyword     c89Constant       DBL_MIN DBL_MAX DBL_MIN_EXP DBL_MAX_EXP DBL_MIN_10_EXP DBL_MAX_10_EXP
  syn keyword     c89Constant       DBL_DIG DBL_MANT_DIG DBL_EPSILON
  syn keyword     c89Constant       LDBL_MIN LDBL_MAX LDBL_MIN_EXP LDBL_MAX_EXP LDBL_MIN_10_EXP LDBL_MAX_10_EXP
  syn keyword     c89Constant       LDBL_DIG LDBL_MANT_DIG LDBL_EPSILON
  syn keyword     c89Constant       HUGE_VAL EDOM ERANGE CLOCKS_PER_SEC NULL
  syn keyword     c89Constant       LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY LC_NUMERIC LC_TIME
  syn keyword     c89Constant       SIG_DFL SIG_ERR SIG_IGN SIGABRT SIGFPE SIGILL SIGINT SIGSEGV SIGTERM
  syn keyword     c89Constant       _IOFBF _IOLBF _IONBF BUFSIZ EOF FOPEN_MAX FILENAME_MAX L_tmpnam
  syn keyword     c89Constant       SEEK_CUR SEEK_END SEEK_SET TMP_MAX stderr stdin stdout
  syn keyword     c89Constant       EXIT_FAILURE EXIT_SUCCESS RAND_MAX
  syn cluster     cConstant         add=c89Constant

  " C94 additional constants
  if exists("c_C94")
    syn keyword   c94Constant       EILSEQ WEOF WCHAR_MAX WCHAR_MIN __STDC_VERSION__
    syn cluster   cConstant         add=c94Constant
  endif

  " C99 additional constants
  if exists("c_C99")
    syn keyword   c99Boolean        true false
    syn cluster   cBoolean          add=c99Boolean
    syn keyword   c99Constant       __STDC_HOSTED__ __STDC_IEC_559__ __STDC_IEC_559_COMPLEX__ __STDC_ISO_10646__
    syn keyword   c99Constant       __VA_ARGS__
    syn keyword   c99Constant       __func__ __bool_true_false_are_defined
    syn keyword   c99Constant       FE_DIVBYZERO FE_INEXACT FE_INVALID FE_OVERFLOW FE_UNDERFLOW FE_ALL_EXCEPT
    syn keyword   c99Constant       FE_DOWNWARD FE_TONEAREST FE_TOWARDZERO FE_UPWARD FE_DFL_ENV
    syn keyword   c99Constant       HUGE_VALF HUGE_VALL INFINITY NAN
    syn keyword   c99Constant       FP_INFINITE FP_NAN FP_NORMAL FP_SUBNORMAL FP_ZERO
    syn keyword   c99Constant       FP_FAST_FMA FP_FAST_FMAF FP_FAST_FMAL FP_ILOGB0 FP_ILOGBNAN
    syn keyword   c99Constant       MATH_ERRNO MATH_ERREXCEPT math_errhandling
    syn match     c99Constant       display "\<INT\(_LEAST\|_FAST\)\=\d\+_\(MIN\|MAX\)\>"
    syn match     c99Constant       display "\<UINT\(_LEAST\|_FAST\)\=\d\+_MAX\>"
    syn keyword   c99Constant       INTPTR_MIN INTPTR_MAX UINTPTR_MAX INTMAX_MIN INTMAX_MAX UINTMAX_MAX
    syn keyword   c99Constant       PTRDIFF_MIN PTRDIFF_MAX SIG_ATOMIC_MIN SIG_ATOMIC_MAX SIZE_MAX
    syn keyword   c99Constant       WINT_MIN WINT_MAX LLONG_MIN LLONG_MAX ULLONG_MAX
    syn keyword   c99Constant       _Complex_I _Imaginary_I I
    syn cluster   cConstant         add=c99Constant
  endif

  if !exists("c_c_vim_compatible") || exists("c_gnu")
    " GNU constants
    syn keyword   cGNUConstant      __GNUC__ __FUNCTION__ __PRETTY_FUNCTION__
    syn cluster   cConstant         add=cGNUConstant
  endif
  if exists("c_posix")
    " POSIX signals and errors
    syn keyword cPosixConstant      SIGALRM SIGCHLD SIGCONT SIGHUP SIGKILL SIGPIPE SIGQUIT
    syn keyword cPosixConstant      SIGSTOP SIGTRAP SIGTSTP SIGTTIN SIGTTOU SIGUSR1 SIGUSR2
    syn keyword cPosixConstant      E2BIG EACCES EAGAIN EBADF EBADMSG EBUSY
    syn keyword cPosixConstant      ECANCELED ECHILD EDEADLK EEXIST EFAULT
    syn keyword cPosixConstant      EFBIG EINPROGRESS EINTR EINVAL EIO EISDIR
    syn keyword cPosixConstant      EMFILE EMLINK EMSGSIZE ENAMETOOLONG ENFILE ENODEV
    syn keyword cPosixConstant      ENOENT ENOEXEC ENOLCK ENOMEM ENOSPC ENOSYS
    syn keyword cPosixConstant      ENOTDIR ENOTEMPTY ENOTSUP ENOTTY ENXIO EPERM
    syn keyword cPosixConstant      EPIPE EROFS ESPIPE ESRCH ETIMEDOUT EXDEV
    syn cluster cConstant           add=cPosixConstant
  endif
  if exists("c_math")
    " Math.h constants
    syn keyword cMathConstant       M_E M_LOG2E M_LOG10E M_LN2 M_LN10 M_PI M_PI_2 M_PI_4
    syn keyword cMathConstant       M_1_PI M_2_PI M_2_SQRTPI M_SQRT2 M_SQRT1_2
    syn cluster cConstant           add=cMathConstant
  endif
endif

if (!exists("c_no_ansi") && exists("c_impl_defined")) || !exists("c_no_names")
  " Highlight compiler implemented reserved macros
  syn match       c89Macro          display "\<_[[:upper:]_]\w*\>"
  syn match       c89Macro          display "\<\(LC_\|SIG_\)\u\w*\>"
  syn cluster     cMacro            add=c89Macro
  if exists("c_vms")
    syn match     cVMSMacro         display "\<_[[:upper:]_]\(\w*\$\)\+\w*\>"
    syn match     cVMSMacro         display "\<\(LC_\|SIG_\)\u\(\w*\$\)\+\w*\>"
    syn cluster   cMacro            add=cVMSMacro
  endif
  if exists("c_C99")
    syn match     c99Macro          display "\<U\=INT\d\+_C\>"
    syn keyword   c99Macro          INTMAX_C UINTMAX_C
    syn match     c99Macro          display "\<E@\(\u\|\d\)\w*\>"
    " printf/scanf format conversion macros
    syn match     c99Macro          display "\(PRI\|SCN\)[diouxX]\(LEAST\|FAST\)\d\+"
    syn match     c99Macro          display "\(PRI\|SCN\)[diouxX]\(MAX\|PTR\)"
    syn cluster   cMacro            add=c99Macro
    syn match     c99MacroError     display "\(PRI\|SCN\)[^diouxX]\(LEAST\|FAST\)\d\+"
    syn match     c99MacroError     display "\(PRI\|SCN\)[^diouxX]\(MAX\|PTR\)"
  endif
  if exists("c_C99_warn")
    " C99 reserved function identifiers!
    syn keyword   c99Function       strcpy strncpy strcat strncat strcmp strcoll strncmp strxfrm
    syn keyword   c99Function       strchr strcspn strpbrk strrchr strspn strstr strtok strerror strlen
    syn keyword   c99Function       strtoimax strtoumax
    syn keyword   c99Function       strtod strtof strtold strtol strtoll strtoul strtoull
    syn keyword   c99Function       memcpy memmove memcmp memchr memset
    syn keyword   c99Function       wcstod wcstof wcstold wcstol wcstoll wcstoull
    syn keyword   c99Function       wcscpy wcsncpy wcscat wcsncat wcscmp wcscoll wcsncmp wcsxfrm
    syn keyword   c99Function       wcschr wcscspn wcspbrk wcsrchr wcsspn wcsstr wcstok wcserror wcslen
    syn keyword   c99Function       wcstoimax wcstoumax
    syn keyword   c99Function       tolower toupper
    syn keyword   c99Function       towlower towupper towctrans
    syn keyword   c99Function       isalnum isalpha isblank iscntrl isdigit isgraph islower isprint ispunct isspace isupper isxdigit
    syn keyword   c99Function       isfinite isinf isnan isnormal
    syn keyword   c99Function       isgreater isgreaterequal isless islessequal islessgreater isunordered
    syn keyword   c99Function       iswalnum iswalpha iswblank iswcntrl iswdigit iswgraph iswlower iswprint iswpunct iswspace iswupper iswxdigit
    syn keyword   c99Function       iswctype
    syn cluster   cFunction         add=c99Function
    " Try and catch future Standard library function names.
    syn match     cC99Error         "\<\(str\|mem\|wcs\|to\|is\)\l\w*\>\s*("me=e-1
    syn keyword   cC99Error         cerf cerfc cexp2 cexpm1 clog10 clog1p clog2 clgamme ctgamma
    syn keyword   cC99Error         cerff cerfcf cexp2f cexpm1f clog10f clog1pf clog2f clgammef ctgammaf
    syn keyword   cC99Error         cerfl cerfcl cexp2l cexpm1l clog10l clog1pl clog2l clgammel ctgammal
  endif
endif

if exists("c_warn_trigraph")
  " Highlight trigraphs as errors
  "syn match       cTrigraphError    "\?\?[=(/)'<!>-]"
  syn match     cTrigraphError      display "??[=(/)'<!>-]"
  syn cluster   cParenContents      add=cTrigraphError
  syn cluster   cDefineContents     add=cTrigraphError
  syn cluster   cConditionalContents add=cTrigraphError
  syn cluster   cCommentGroup       add=cTrigraphError
  syn cluster   cCommentStringContents add=cTrigraphError
  syn cluster   cStringContents     add=cTrigraphError
endif

if exists("c_C94")
  " C94 iso646 macros
  syn keyword   c94Macro            and and_eq bitand bitor compl not not_eq or or_eq xor xor_eq

  " Add iso646 errors to appropriate highlight clusters
  syn cluster   cParenContents      add=c94Macro
  syn cluster   cDefineContents     add=c94Macro
  syn cluster   cConditionalContents add=c94Macro
endif


if exists("c_cpp_warn")
  " C++ reserved words that must not be used if compiling with a C++ compiler
  syn keyword   cCPPError           new delete this throw try catch namespace using public protected private friend
  syn keyword   cCPPError           mutable class template typename virtual explicit operator typeid
  syn match     cCPPError           display "\<\(const\|static\|dynamic\|reinterpret\)_cast\>"

  " Add to contained groups
  syn cluster   cParenContents      add=cCPPError
  syn cluster   cDefineContents     add=cCPPError
  syn cluster   cConditionalContents add=cCPPError
endif


" Highlight re-syncing distance.
if exists("c_minlines")
  let b:c_minlines = c_minlines
else
  let b:c_minlines = 15
endif
exec "syn sync ccomment cComment minlines=" . b:c_minlines

"========================================================
" Highlight All Function
"========================================================
"syn match   cFunction "/<[a-zA-Z_][a-zA-Z_0-9]*/>[^()]*)("me=e-2
"syn match   cFunction "/<[a-zA-Z_][a-zA-Z_0-9]*/>/s*("me=e-1
" syn match cFuncDef   "\h[\w\[\]\*(),]\{,40}\n\{,1}\s*\zs\<\(if\|while\|switch\|do\|for\|case\|return\|break\|continue\|goto\|asm\|volatile\|section\>\)\@!\h\w*\>\ze\s*(\h\_[^;{}]\{,300})\_s*{"
	" hi def link cFuncDef Type
"hi cFunction        gui=NONE guifg=#800000
syn keyword cMC			__DI __EI __asm __set_il
syn keyword cMC			__wait_nop __mul __div __mod __mulu __divu __modu
syn keyword cAnsiFunction	MULU_ DIVU_ MODU_ MUL_ DIV_ MOD_
syn keyword cAnsiFunction	main typeof
syn keyword cAnsiFunction	open close read write lseek dup dup2
syn keyword cAnsiFunction	fcntl ioctl
syn keyword cAnsiFunction	wctrans towctrans towupper
syn keyword cAnsiFunction	towlower wctype iswctype
syn keyword cAnsiFunction	iswxdigit iswupper iswspace
syn keyword cAnsiFunction	iswpunct iswprint iswlower
syn keyword cAnsiFunction	iswgraph iswdigit iswcntrl
syn keyword cAnsiFunction	iswalpha iswalnum wcsrtombs
syn keyword cAnsiFunction	mbsrtowcs wcrtomb mbrtowc
syn keyword cAnsiFunction	mbrlen mbsinit wctob
syn keyword cAnsiFunction	btowc wcsfxtime wcsftime
syn keyword cAnsiFunction	wmemset wmemmove wmemcpy
syn keyword cAnsiFunction	wmemcmp wmemchr wcstok
syn keyword cAnsiFunction	wcsstr wcsspn wcsrchr
syn keyword cAnsiFunction	wcspbrk wcslen wcscspn
syn keyword cAnsiFunction	wcschr wcsxfrm wcsncmp
syn keyword cAnsiFunction	wcscoll wcscmp wcsncat
syn keyword cAnsiFunction	wcscat wcsncpy wcscpy
syn keyword cAnsiFunction	wcstoull wcstoul wcstoll
syn keyword cAnsiFunction	wcstol wcstold wcstof
syn keyword cAnsiFunction	wcstod ungetwc putwchar
syn keyword cAnsiFunction	putwc getwchar getwc
syn keyword cAnsiFunction	fwide fputws fputwc
syn keyword cAnsiFunction	fgetws fgetwc wscanf
syn keyword cAnsiFunction	wprintf vwscanf vwprintf
syn keyword cAnsiFunction	vswscanf vswprintf vfwscanf
syn keyword cAnsiFunction	vfwprintf swscanf swprintf
syn keyword cAnsiFunction	fwscanf fwprintf zonetime
syn keyword cAnsiFunction	strfxtime strftime localtime
syn keyword cAnsiFunction	gmtime ctime asctime
syn keyword cAnsiFunction	time mkxtime mktime
syn keyword cAnsiFunction	difftime clock strlen
syn keyword cAnsiFunction	strerror memset strtok
syn keyword cAnsiFunction	strstr strspn strrchr
syn keyword cAnsiFunction	strpbrk strcspn strchr
syn keyword cAnsiFunction	memchr strxfrm strncmp
syn keyword cAnsiFunction	strcoll strcmp memcmp
syn keyword cAnsiFunction	strncat strcat strncpy
syn keyword cAnsiFunction	strcpy memmove memcpy
syn keyword cAnsiFunction	wcstombs mbstowcs wctomb
syn keyword cAnsiFunction	mbtowc mblen lldiv
syn keyword cAnsiFunction	ldiv div llabs
syn keyword cAnsiFunction	labs abs qsort
syn keyword cAnsiFunction	bsearch system getenv
syn keyword cAnsiFunction	exit atexit abort
syn keyword cAnsiFunction	realloc malloc free
syn keyword cAnsiFunction	calloc srand rand
syn keyword cAnsiFunction	strtoull strtoul strtoll
syn keyword cAnsiFunction	strtol strtold strtof
syn keyword cAnsiFunction	strtod atoll atol
syn keyword cAnsiFunction	atoi atof perror
syn keyword cAnsiFunction	ferror feof clearerr
syn keyword cAnsiFunction	rewind ftell fsetpos
syn keyword cAnsiFunction	fseek fgetpos fwrite
syn keyword cAnsiFunction	fread ungetc puts
syn keyword cAnsiFunction	putchar putc gets
syn keyword cAnsiFunction	getchar getc fputs
syn keyword cAnsiFunction	fputc fgets fgetc
syn keyword cAnsiFunction	vsscanf vsprintf vsnprintf
syn keyword cAnsiFunction	vscanf vprintf vfscanf
syn keyword cAnsiFunction	vfprintf sscanf sprintf
syn keyword cAnsiFunction	snprintf scanf printf
syn keyword cAnsiFunction	fscanf fprintf setvbuf
syn keyword cAnsiFunction	setbuf freopen fopen
syn keyword cAnsiFunction	fflush fclose tmpnam
syn keyword cAnsiFunction	tmpfile rename remove
syn keyword cAnsiFunction	offsetof va_start va_end
syn keyword cAnsiFunction	va_copy va_arg raise signal
syn keyword cAnsiFunction	longjmp setjmp isunordered
syn keyword cAnsiFunction	islessgreater islessequal isless
syn keyword cAnsiFunction	isgreaterequal isgreater fmal
syn keyword cAnsiFunction	fmaf fma fminl
syn keyword cAnsiFunction	fminf fmin fmaxl
syn keyword cAnsiFunction	fmaxf fmax fdiml
syn keyword cAnsiFunction	fdimf fdim nextafterxl
syn keyword cAnsiFunction	nextafterxf nextafterx nextafterl
syn keyword cAnsiFunction	nextafterf nextafter nanl
syn keyword cAnsiFunction	nanf nan copysignl
syn keyword cAnsiFunction	copysignf copysign remquol
syn keyword cAnsiFunction	remquof remquo remainderl
syn keyword cAnsiFunction	remainderf remainder fmodl
syn keyword cAnsiFunction	fmodf fmod truncl
syn keyword cAnsiFunction	truncf trunc llroundl
syn keyword cAnsiFunction	llroundf llround lroundl
syn keyword cAnsiFunction	lroundf lround roundl
syn keyword cAnsiFunction	roundf round llrintl
syn keyword cAnsiFunction	llrintf llrint lrintl
syn keyword cAnsiFunction	lrintf lrint rintl
syn keyword cAnsiFunction	rintf rint nearbyintl
syn keyword cAnsiFunction	nearbyintf nearbyint floorl
syn keyword cAnsiFunction	floorf floor ceill
syn keyword cAnsiFunction	ceilf ceil tgammal
syn keyword cAnsiFunction	tgammaf tgamma lgammal
syn keyword cAnsiFunction	lgammaf lgamma erfcl
syn keyword cAnsiFunction	erfcf erfc erfl
syn keyword cAnsiFunction	erff erf sqrtl
syn keyword cAnsiFunction	sqrtf sqrt powl
syn keyword cAnsiFunction	powf pow hypotl
syn keyword cAnsiFunction	hypotf hypot fabsl
syn keyword cAnsiFunction	fabsf fabs cbrtl
syn keyword cAnsiFunction	cbrtf cbrt scalblnl
syn keyword cAnsiFunction	scalblnf scalbln scalbnl
syn keyword cAnsiFunction	scalbnf scalbn modfl
syn keyword cAnsiFunction	modff modf logbl
syn keyword cAnsiFunction	logbf logb log2l
syn keyword cAnsiFunction	log2f log2 log1pl
syn keyword cAnsiFunction	log1pf log1p log10l
syn keyword cAnsiFunction	log10f log10 logl
syn keyword cAnsiFunction	logf log ldexpl
syn keyword cAnsiFunction	ldexpf ldexp ilogbl
syn keyword cAnsiFunction	ilogbf ilogb frexpl
syn keyword cAnsiFunction	frexpf frexp expm1l
syn keyword cAnsiFunction	expm1f expm1 exp2l
syn keyword cAnsiFunction	exp2f exp2 expl
syn keyword cAnsiFunction	expf exp tanhl
syn keyword cAnsiFunction	tanhf tanh sinhl
syn keyword cAnsiFunction	sinhf sinh coshl
syn keyword cAnsiFunction	coshf cosh atanhl
syn keyword cAnsiFunction	atanhf atanh asinhl
syn keyword cAnsiFunction	asinhf asinh acoshl
syn keyword cAnsiFunction	acoshf acosh tanl
syn keyword cAnsiFunction	tanf tan sinl
syn keyword cAnsiFunction	sinf sin cosl
syn keyword cAnsiFunction	cosf cos atan2l
syn keyword cAnsiFunction	atan2f atan2 atanl
syn keyword cAnsiFunction	atanf atan asinl
syn keyword cAnsiFunction	asinf asin acosl
syn keyword cAnsiFunction	acosf acos signbit
syn keyword cAnsiFunction	isnormal isnan isinf
syn keyword cAnsiFunction	isfinite fpclassify localeconv
syn keyword cAnsiFunction	setlocale wcstoumax wcstoimax
syn keyword cAnsiFunction	strtoumax strtoimax feupdateenv
syn keyword cAnsiFunction	fesetenv feholdexcept fegetenv
syn keyword cAnsiFunction	fesetround fegetround fetestexcept
syn keyword cAnsiFunction	fesetexceptflag feraiseexcept fegetexceptflag
syn keyword cAnsiFunction	feclearexcept toupper tolower
syn keyword cAnsiFunction	isxdigit isupper isspace
syn keyword cAnsiFunction	ispunct isprint islower
syn keyword cAnsiFunction	isgraph isdigit iscntrl
syn keyword cAnsiFunction	isalpha isalnum creall
syn keyword cAnsiFunction	crealf creal cprojl
syn keyword cAnsiFunction	cprojf cproj conjl
syn keyword cAnsiFunction	conjf conj cimagl
syn keyword cAnsiFunction	cimagf cimag cargl
syn keyword cAnsiFunction	cargf carg csqrtl
syn keyword cAnsiFunction	csqrtf csqrt cpowl
syn keyword cAnsiFunction	cpowf cpow cabsl
syn keyword cAnsiFunction	cabsf cabs clogl
syn keyword cAnsiFunction	clogf clog cexpl
syn keyword cAnsiFunction	cexpf cexp ctanhl
syn keyword cAnsiFunction	ctanhf ctanh csinhl
syn keyword cAnsiFunction	csinhf csinh ccoshl
syn keyword cAnsiFunction	ccoshf ccosh catanhl
syn keyword cAnsiFunction	catanhf catanh casinhl
syn keyword cAnsiFunction	casinhf casinh cacoshl
syn keyword cAnsiFunction	cacoshf cacosh ctanl
syn keyword cAnsiFunction	ctanf ctan csinl
syn keyword cAnsiFunction	csinf csin ccosl
syn keyword cAnsiFunction	ccosf ccos catanl
syn keyword cAnsiFunction	catanf catan casinl
syn keyword cAnsiFunction	casinf casin cacosl
syn keyword cAnsiFunction	cacosf cacos assert
syn keyword cAnsiFunction	UINTMAX_C INTMAX_C UINT64_C
syn keyword cAnsiFunction	UINT32_C UINT16_C UINT8_C
syn keyword cAnsiFunction	INT64_C INT32_C INT16_C INT8_C

syn keyword	cMC		__interrupt __nosavereg
syn keyword	cAnsiName	PRId8 PRIi16 PRIo32 PRIu64
syn keyword	cAnsiName	PRId16 PRIi32 PRIo64 PRIuLEAST8
syn keyword	cAnsiName	PRId32 PRIi64 PRIoLEAST8 PRIuLEAST16
syn keyword	cAnsiName	PRId64 PRIiLEAST8 PRIoLEAST16 PRIuLEAST32
syn keyword	cAnsiName	PRIdLEAST8 PRIiLEAST16 PRIoLEAST32 PRIuLEAST64
syn keyword	cAnsiName	PRIdLEAST16 PRIiLEAST32 PRIoLEAST64 PRIuFAST8
syn keyword	cAnsiName	PRIdLEAST32 PRIiLEAST64 PRIoFAST8 PRIuFAST16
syn keyword	cAnsiName	PRIdLEAST64 PRIiFAST8 PRIoFAST16 PRIuFAST32
syn keyword	cAnsiName	PRIdFAST8 PRIiFAST16 PRIoFAST32 PRIuFAST64
syn keyword	cAnsiName	PRIdFAST16 PRIiFAST32 PRIoFAST64 PRIuMAX
syn keyword	cAnsiName	PRIdFAST32 PRIiFAST64 PRIoMAX PRIuPTR
syn keyword	cAnsiName	PRIdFAST64 PRIiMAX PRIoPTR PRIx8
syn keyword	cAnsiName	PRIdMAX PRIiPTR PRIu8 PRIx16
syn keyword	cAnsiName	PRIdPTR PRIo8 PRIu16 PRIx32
syn keyword	cAnsiName	PRIi8 PRIo16 PRIu32 PRIx64

syn keyword	cAnsiName	PRIxLEAST8 SCNd8 SCNiFAST32 SCNuLEAST32
syn keyword	cAnsiName	PRIxLEAST16 SCNd16 SCNiFAST64 SCNuLEAST64
syn keyword	cAnsiName	PRIxLEAST32 SCNd32 SCNiMAX SCNuFAST8
syn keyword	cAnsiName	PRIxLEAST64 SCNd64 SCNiPTR SCNuFAST16
syn keyword	cAnsiName	PRIxFAST8 SCNdLEAST8 SCNo8 SCNuFAST32
syn keyword	cAnsiName	PRIxFAST16 SCNdLEAST16 SCNo16 SCNuFAST64
syn keyword	cAnsiName	PRIxFAST32 SCNdLEAST32 SCNo32 SCNuMAX
syn keyword	cAnsiName	PRIxFAST64 SCNdLEAST64 SCNo64 SCNuPTR
syn keyword	cAnsiName	PRIxMAX SCNdFAST8 SCNoLEAST8 SCNx8
syn keyword	cAnsiName	PRIxPTR SCNdFAST16 SCNoLEAST16 SCNx16
syn keyword	cAnsiName	PRIX8 SCNdFAST32 SCNoLEAST32 SCNx32
syn keyword	cAnsiName	PRIX16 SCNdFAST64 SCNoLEAST64 SCNx64
syn keyword	cAnsiName	PRIX32 SCNdMAX SCNoFAST8 SCNxLEAST8
syn keyword	cAnsiName	PRIX64 SCNdPTR SCNoFAST16 SCNxLEAST16
syn keyword	cAnsiName	PRIXLEAST8 SCNi8 SCNoFAST32 SCNxLEAST32
syn keyword	cAnsiName	PRIXLEAST16 SCNi16 SCNoFAST64 SCNxLEAST64
syn keyword	cAnsiName	PRIXLEAST32 SCNi32 SCNoMAX SCNxFAST8
syn keyword	cAnsiName	PRIXLEAST64 SCNi64 SCNoPTR SCNxFAST16
syn keyword	cAnsiName	PRIXFAST8 SCNiLEAST8 SCNu8 SCNxFAST32
syn keyword	cAnsiName	PRIXFAST16 SCNiLEAST16 SCNu16 SCNxFAST64
syn keyword	cAnsiName	PRIXFAST32 SCNiLEAST32 SCNu32 SCNxMAX
syn keyword	cAnsiName	PRIXFAST64 SCNiLEAST64 SCNu64 SCNxPTR
syn keyword	cAnsiName	PRIXMAX SCNiFAST8 SCNuLEAST8
syn keyword	cAnsiName	PRIXPTR SCNiFAST16 SCNuLEAST16

syn keyword	cAnsiName	errno environ
syn keyword	cAnsiName	stdout stdin stderr

syn keyword	cAnsiName	STDC CX_LIMITED_RANGE
syn keyword	cAnsiName	STDC FENV_ACCESS
syn keyword	cAnsiName	STDC FP_CONTRACT

syn keyword	cAnsiName	acos sqrt fmod nearbyint
syn keyword	cAnsiName	asin fabs frexp nextafter
syn keyword	cAnsiName	atan atan2 tgamma nextafterx
syn keyword	cAnsiName	acosh cbrt hypot remainder
syn keyword	cAnsiName	asinh ceil ilogb remquo
syn keyword	cAnsiName	atanh copysign ldexp rint
syn keyword	cAnsiName	cos erf lgamma round
syn keyword	cAnsiName	sin erfc llrint scalbn
syn keyword	cAnsiName	tan exp2 llround scalbln
syn keyword	cAnsiName	cosh expm1 log10 trunc
syn keyword	cAnsiName	sinh fdim log1p carg
syn keyword	cAnsiName	tanh floor log2 cimag
syn keyword	cAnsiName	exp fma logb conj
syn keyword	cAnsiName	log fmax lrint cproj
syn keyword	cAnsiName	pow fmin lround creal

syn keyword	cAnsiName	and bitor not_eq xor
syn keyword	cAnsiName	and_eq compl or xor_eq
syn keyword	cAnsiName	bitand not or_eq

" A bunch of useful C keywords
"syn keyword	cStatement	goto
syn keyword	cStatement	break return continue asm
syn keyword	cLabel		default
syn keyword	cLabel		case
syn keyword	cConditional	if else switch
syn keyword	cRepeat		while for do

syn keyword	cTodo		contained TODO FIXME XXX
syn match	cTodo		contained "///[A-Z]!*"
syn keyword	cOperator	sizeof

if exists("c_gnu")
  syn keyword	cStatement	__asm__
  syn keyword	cOperator	typeof __real__ __imag__
endif
syn keyword	cType		int long short char void
syn keyword	cType		signed unsigned float double
if !exists("c_no_ansi") || exists("c_ansi_typedefs")
  syn keyword   cType		size_t ssize_t wchar_t ptrdiff_t sig_atomic_t fpos_t
  syn keyword   cType		clock_t time_t va_list jmp_buf FILE DIR div_t ldiv_t
  syn keyword   cType		mbstate_t wctrans_t wint_t wctype_t
  syn keyword   cType		lldiv_t float_t double_t fenv_t fexcept_t
endif
if !exists("c_no_c99") " ISO C99
  syn keyword	cType		bool complex imaginary
  syn keyword	cType		int8_t int16_t int32_t int64_t
  syn keyword	cType		uint8_t uint16_t uint32_t uint64_t
  syn keyword	cType		int_least8_t int_least16_t int_least32_t int_least64_t
  syn keyword	cType		uint_least8_t uint_least16_t uint_least32_t uint_least64_t
  syn keyword	cType		int_fast8_t int_fast16_t int_fast32_t int_fast64_t
  syn keyword	cType		uint_fast8_t uint_fast16_t uint_fast32_t uint_fast64_t
  syn keyword	cType		intptr_t uintptr_t
  syn keyword	cType		intmax_t uintmax_t
endif
if exists("c_gnu")
  syn keyword	cType		__label__ __complex__ __volatile__
endif

syn keyword	cStructure	struct union enum typedef
syn keyword	cStorageClass	static register auto volatile extern const VOL
if exists("c_gnu")
  syn keyword	cStorageClass	inline __attribute__
endif
if !exists("c_no_c99")
  syn keyword	cStorageClass	inline restrict
endif

if !exists("c_no_ansi") || exists("c_ansi_constants") || exists("c_gnu")
  if exists("c_gnu")
    syn keyword cConstant __GNUC__ __FUNCTION__ __PRETTY_FUNCTION__
  endif
  syn keyword cConstant __LINE__ __FILE__ __DATE__ __TIME__ __STDC__ __func__
  syn keyword cConstant __STDC_VERSION__
  syn keyword cConstant CHAR_BIT MB_LEN_MAX MB_CUR_MAX
  syn keyword cConstant UCHAR_MAX UINT_MAX ULONG_MAX USHRT_MAX
  syn keyword cConstant CHAR_MIN INT_MIN LONG_MIN SHRT_MIN
  syn keyword cConstant CHAR_MAX INT_MAX LONG_MAX SHRT_MAX
  syn keyword cConstant SCHAR_MIN SINT_MIN SLONG_MIN SSHRT_MIN
  syn keyword cConstant SCHAR_MAX SINT_MAX SLONG_MAX SSHRT_MAX
  if !exists("c_no_c99")
    syn keyword cConstant LLONG_MIN LLONG_MAX ULLONG_MAX
    syn keyword cConstant INT8_MIN INT16_MIN INT32_MIN INT64_MIN
    syn keyword cConstant INT8_MAX INT16_MAX INT32_MAX INT64_MAX
    syn keyword cConstant UINT8_MAX UINT16_MAX UINT32_MAX UINT64_MAX
    syn keyword cConstant INT_LEAST8_MIN INT_LEAST16_MIN INT_LEAST32_MIN INT_LEAST64_MIN
    syn keyword cConstant INT_LEAST8_MAX INT_LEAST16_MAX INT_LEAST32_MAX INT_LEAST64_MAX
    syn keyword cConstant UINT_LEAST8_MAX UINT_LEAST16_MAX UINT_LEAST32_MAX UINT_LEAST64_MAX
    syn keyword cConstant INT_FAST8_MIN INT_FAST16_MIN INT_FAST32_MIN INT_FAST64_MIN
    syn keyword cConstant INT_FAST8_MAX INT_FAST16_MAX INT_FAST32_MAX INT_FAST64_MAX
    syn keyword cConstant UINT_FAST8_MAX UINT_FAST16_MAX UINT_FAST32_MAX UINT_FAST64_MAX
    syn keyword cConstant INTPTR_MIN INTPTR_MAX UINTPTR_MAX
    syn keyword cConstant INTMAX_MIN INTMAX_MAX UINTMAX_MAX
    syn keyword cConstant PTRDIFF_MIN PTRDIFF_MAX SIG_ATOMIC_MIN SIG_ATOMIC_MAX
    syn keyword cConstant SIZE_MAX WCHAR_MIN WCHAR_MAX WINT_MIN WINT_MAX
  endif
  syn keyword cConstant FLT_RADIX FLT_ROUNDS
  syn keyword cConstant FLT_DIG FLT_MANT_DIG FLT_EPSILON
  syn keyword cConstant DBL_DIG DBL_MANT_DIG DBL_EPSILON
  syn keyword cConstant LDBL_DIG LDBL_MANT_DIG LDBL_EPSILON
  syn keyword cConstant FLT_MIN FLT_MAX FLT_MIN_EXP FLT_MAX_EXP
  syn keyword cConstant FLT_MIN_10_EXP FLT_MAX_10_EXP
  syn keyword cConstant DBL_MIN DBL_MAX DBL_MIN_EXP DBL_MAX_EXP
  syn keyword cConstant DBL_MIN_10_EXP DBL_MAX_10_EXP
  syn keyword cConstant LDBL_MIN LDBL_MAX LDBL_MIN_EXP LDBL_MAX_EXP
  syn keyword cConstant LDBL_MIN_10_EXP LDBL_MAX_10_EXP
  syn keyword cConstant HUGE_VAL CLOCKS_PER_SEC NULL _NO_LEAP_SECONDS _LOCALTIME
  syn keyword cConstant LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY
  syn keyword cConstant LC_NUMERIC LC_TIME
" syn keyword cConstant SIG_DFL SIG_ERR SIG_IGN
  syn keyword cAnsiFuncPtr SIG_DFL SIG_ERR SIG_IGN
  syn keyword cConstant SIGABRT SIGFPE SIGILL SIGHUP SIGINT SIGSEGV SIGTERM
  syn keyword cConstant INFINITY     FP_SUBNORMAL FP_ILOGB0
  syn keyword cConstant NAN          FP_ZERO      FP_ILOGBNAN
  syn keyword cConstant FP_INFINITE  FP_FAST_FMA
  syn keyword cConstant HUGE_VALF    FP_NAN       FP_FAST_FMAF
  syn keyword cConstant HUGE_VALL    FP_NORMAL    FP_FAST_FMAL
  syn keyword cConstant FE_OVERFLOW      FE_TOWARDZERO
  syn keyword cConstant FE_UNDERFLOW     FE_UPWARD
  syn keyword cConstant FE_DIVBYZERO     FE_ALL_EXCEPT    FE_DFL_ENV
  syn keyword cConstant FE_INEXACT       FE_DOWNWARD
  syn keyword cConstant FE_INVALID       FE_TONEAREST
  syn keyword cConstant	_Complex_I _Imaginary_I
  " Add POSIX signals as well...
  syn keyword cConstant SIGABRT SIGALRM SIGCHLD SIGCONT SIGFPE SIGHUP
  syn keyword cConstant SIGILL SIGINT SIGKILL SIGPIPE SIGQUIT SIGSEGV
  syn keyword cConstant SIGSTOP SIGTERM SIGTRAP SIGTSTP SIGTTIN SIGTTOU
  syn keyword cConstant SIGUSR1 SIGUSR2
  syn keyword cConstant _IOFBF _IOLBF _IONBF BUFSIZ EOF WEOF
  syn keyword cConstant FOPEN_MAX FILENAME_MAX L_tmpnam
  syn keyword cConstant SEEK_CUR SEEK_END SEEK_SET
  syn keyword cConstant TMP_MAX stderr stdin stdout
  syn keyword cConstant EXIT_FAILURE EXIT_SUCCESS RAND_MAX
  " Add POSIX errors as well
  syn keyword cConstant E2BIG EACCES EAGAIN EBADF EBADMSG EBUSY
  syn keyword cConstant ECANCELED ECHILD EDEADLK EDOM EEXIST EFAULT
  syn keyword cConstant EFBIG EILSEQ EINPROGRESS EINTR EINVAL EIO EISDIR
  syn keyword cConstant EMFILE EMLINK EMSGSIZE ENAMETOOLONG ENFILE ENODEV
  syn keyword cConstant ENOENT ENOEXEC ENOLCK ENOMEM ENOSPC ENOSYS
  syn keyword cConstant ENOTDIR ENOTEMPTY ENOTSUP ENOTTY ENXIO EPERM
  syn keyword cConstant EPIPE ERANGE EROFS ESPIPE ESRCH ETIMEDOUT EXDEV
  " math.h
  syn keyword cConstant M_E M_LOG2E M_LOG10E M_LN2 M_LN10 M_PI M_PI_2 M_PI_4
  syn keyword cConstant M_1_PI M_2_PI M_2_SQRTPI M_SQRT2 M_SQRT1_2
endif

if !exists("c_no_c99") " ISO C99
  syn keyword cConstant true false __bool_true_false_are_defined
endif
syn keyword	cType		CHAR byte BYTE uchar ushort uint ulong
syn keyword	cType		WORD DWORD QWORD INT INT2 INT4 UNS UNS2 UNS4 INT8 UNS8
syn keyword	cType		CFG_t cfap_t cBYTE cvoid
syn keyword	cType		_Bool _Complex _Imaginary __int64
if !exists("c_no_ansi") || exists("c_ansi_typedefs")
  syn keyword   cMC	__near __far FAR __io __direct DIR
endif


" Define the default highlighting.
" Only used when an item doesn't have highlighting yet

hi def link cEmpty                 Normal
hi def link cTodo                  Todo

hi def link cStatement             Statement
hi def link c89Statement           cStatement

if exists("c_c_vim_compatible")
  hi def link cKRStatement         cStatement
  hi def link cKRStorageClass      cStorageClass
else
  hi def link cKRStatement         cError
  hi def link cKRStorageClass      cError
endif

hi def link cLabel                 Label
hi def link cUserLabel             cLabel
hi def link cConditional           Conditional
hi def link cRepeat                Repeat

hi def link cOperator              Operator
" hi def link cSizeofOperator        cOperator
" rainbow
hi def link cSizeofOperator        keyword
hi def link cMathOperator          cOperator
hi def link cPointerOperator       cOperator
hi def link cLogicalOperator       cOperator
hi def link cBinaryOperator        cOperator
if exists("c_conditional_is_operator")
  hi def link cConditionalOperator cOperator
else
  hi def link cConditionalOperator cConditional
endif

hi def link cType                  Type
hi def link c89Type                cType
hi def link cTypedef               Typedef
hi def link c89Typedef             cTypedef
if exists("c_c_vim_compatible")
  hi def link cVIMTypedef          cTypedef
endif
hi def link cStructure             Structure
hi def link cStructureType         cStructure
hi def link cStorageClass          StorageClass
hi def link c89StorageClass        cStorageClass
hi def link cIdentifier            Identifier
hi def link c89Identifier          cIdentifier
hi def link cEllipses              c89Identifier
hi def link cFunction              Function
hi def link c89Function            cFunction

if exists("c_char_is_integer")
  hi def link cCharacter           cInteger
else
  hi def link cCharacter           Character
endif
hi def link cMultiCharacter        cCharacter
hi def link cCharacterNoError      cCharacter
hi def link cSpecialChar           SpecialChar
hi def link cEscapeChar            cSpecialChar
hi def link cOctalChar             cSpecialChar
hi def link cHexChar               cSpecialChar
hi def link cString                String
hi def link cSpecial               cSpecialChar
hi def link cFormat                cSpecial
hi def link cPrintFormat           cFormat
hi def link cScanFormat            cFormat

hi def link cNumber                Number
hi def link cInteger               cNumber
hi def link cDecimal               cInteger
hi def link cOctal                 cInteger
hi def link cOctalZero             cInteger "PreProc
hi def link cHex                   cInteger

hi def link cBoolean               Boolean
hi def link cFloat                 Float
hi def link c89Float               cFloat

hi def link cConstant              Constant
hi def link c89Constant            cConstant

hi def link cComment               Comment
hi def link cCommentDelim          cComment
hi def link cCommentString         cString
hi def link cComment2String        cString
hi def link cCommentSkip           cComment
hi def link cTime                  cNumber
hi def link cDate                  cString

hi def link cError                 Error
hi def link cCharsetError          cError
hi def link cStatementError        cError
hi def link cStorageClassError     cError
hi def link cOperatorError         cError
hi def link cOctalError            cError
hi def link cFloatError            cError
hi def link cParenError            cError
hi def link cBracketError          cError
if !exists("c_C99") || exists("c_C99_warn")
  hi def link cErrBraceInParen     cError
endif
hi def link cErrBracketInParen     cError
hi def link cErrInBracket          cError
hi def link cCommentStartError     cError
hi def link cCommentError          cError
hi def link cTrailSpaceError       cError
hi def link cMixedSpaceError       cError
hi def link cCharacterError        cError
hi def link cEscapeCharError       cError
hi def link cOctalCharError        cError
hi def link cHexCharError          cError
hi def link cLogicalOperatorError  cError
hi def link cBinaryOperatorError   cError
hi def link cTrigraphError         cError
hi def link cFormatError           cError
hi def link cHexError              cError
hi def link cEllipsesError         cError

hi def link cPreProc               PreProc
hi def link cPPEmptyLine           cPreProc
hi def link cPPLineJoin            cPreProc
hi def link cInclude               Include
hi def link cPPIncludeFile         cString
hi def link cDefine                Define
hi def link cUndef                 cDefine
hi def link cPragma                cPreProc
hi def link cMacro                 Macro
hi def link cCMacro                cMacro
hi def link c89Macro               cMacro
hi def link cPreCondit             PreCondit
hi def link cLine                  PreProc
hi def link cPPLineNumber          cInteger
hi def link cPPOperator            cOperator
hi def link cPPTokenOperator       cPPOperator
hi def link cPPPragmaOperator      cPPOperator
hi def link cPPOut                 cComment
hi def link cPPOut2                cPPOut
hi def link cPPSkip                cPPOut

hi def link cPPError               cError
hi def link cPreProcError          cPPError
hi def link cPPLineNumberError     cPPError
hi def link cPPSpaceError          cPPError
hi def link cPPLineJoinError       cPPError
hi def link cPPWarnError           cPPError
hi def link cPPPragmaError         cPPError

if exists("c_vms")
  hi def link cVMSIdentifier       cIdentifier
  hi def link cVMSFunction         cFunction
  hi def link cVMSMacro            cMacro
endif

if exists("c_cpp_warn")
  hi def link cCPPError            cError
endif

if exists("c_warn_digraph")
  hi def link cDigraph             cError
endif

if exists("c_C94")
  if !exists("c_C94_warn")
    hi def link c94Macro           cMacro
    hi def link c94Constant        cConstant
    hi def link c94PrintFormat     cPrintFormat
    hi def link c94ScanFormat      cScanFormat
    hi def link c94Typedef         cTypedef
    hi def link c94PPTokenOperator cPPOperator
    hi def link c94PPInclude       cInclude

  else
    hi def link cC94Error          cError
    hi def link c94Macro           cC94Error
    hi def link c94Constant        cC94Error
    hi def link c94PrintFormat     cC94Error
    hi def link c94ScanFormat      cC94Error
    hi def link c94Typedef         cC94Error
    hi def link c94PPTokenOperator cC94Error
    hi def link c94PPInclude       cC94Error
  endif
endif

if exists("c_C99")
  hi def link c99Function          cFunction
  if !exists("c_C99_warn")
    hi def link c99Type            cType
    hi def link c99Typedef         cTypedef

    hi def link c99StorageClass    cStorageClass
    hi def link c99Macro           cMacro
    hi def link c99MacroError      cError
    hi def link cUniversalChar     cSpecialChar
    hi def link c99Decimal         cDecimal
    hi def link c99Hex             cHex
    hi def link c99OctalError      cOctalError
    hi def link c99Octal           cOctal
    hi def link c99Boolean         cBoolean
    hi def link c99Float           cFloat
    hi def link c99Constant        cConstant
    hi def link c99PrintFormat     cPrintFormat
    hi def link c99ScanFormat      cScanFormat
    hi def link c99Pragma          cPreProc
    hi def link c99PPPragmaSTDC    cPreProc
    hi def link c99PPPragmaOperator cPPOperator
    hi def link c99PPPragmaError   cPPError

  else
    hi def link cC99Error          cError
    hi def link c99Type            cC99Error
    hi def link c99Typedef         cC99Error
    hi def link c99StorageClass    cC99Error
    hi def link c99Macro           cC99Error
    hi def link c99MacroError      cC99Error
    hi def link cUniversalChar     cC99Error
    hi def link c99Decimal         cC99Error
    hi def link c99Hex             cC99Error
    hi def link c99OctalError      cC99Error
    hi def link c99Octal           cC99Error
    hi def link c99Boolean         cC99Error
    hi def link c99Float           cC99Error
    hi def link c99Constant        cC99Error
    hi def link c99PrintFormat     cC99Error
    hi def link c99ScanFormat      cC99Error
    hi def link c99Pragma          cC99Error
    hi def link c99PPPragmaSTDC    cC99Error
    hi def link c99PPPragmaOperator cC99Error
    hi def link c99PPPragmaError   cC99Error
  endif
endif

if exists("c_c_vim_compatible")
  if exists("c_gnu")
    hi def link cGNUType           cType
    hi def link cGNUStatement      c89Statement
    hi def link cGNUOperator       cOperator
    hi def link cGNUStorageClass   cStorageClass
    hi def link cGNUConstant       cConstant
  endif
  if !exists("c_no_utf")
    hi def link cUniversalChar     cSpecialChar
  endif
  hi def link cPosixConstant       cConstant
  hi def link cMathConstant        cConstant

else
  hi def link cGNUError            cError
  hi def link cGNUStatement        cGNUError
  hi def link cGNUOperator         cGNUError
  hi def link cGNUType             cGNUError
  hi def link cGNUStorageClass     cGNUError
  hi def link cGNUConstant         cGNUError
endif

let b:current_syntax = "c"

" vim:et:ff=unix:
" EOF c.vim
