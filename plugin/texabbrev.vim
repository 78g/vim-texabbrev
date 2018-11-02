" Vim plugin for translating/abbreviating tex commands to unicode equivalents
" Last Change: 2018 Nov 18
" Maintainer: Miles Wheeler

if exists("g:loaded_texabbrev")
  finish
endif
let g:loaded_texabbrev = 1

let s:save_cpo = &cpo
set cpo&vim

" Potentially add this list of words to 'complete'
if exists("g:texabbrev_wordlist")
  let s:wordlist = g:texabbrev_wordlist
else
  let s:wordlist=fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/wordlist'
end

" Much of this list is taken from Dr. Chip's TeX syntax file
if exists("g:texabbrev_table")
  let s:texabbrev_table = g:texabbrev_table
else
  let s:texabbrev_table = [
        \ ['alpha'          , 'α' ],
        \ ['beta'           , 'β' ],
        \ ['gamma'          , 'γ' ],
        \ ['delta'          , 'δ' ],
        \ ['varepsilon'     , 'ε' ],
        \ ['epsilon'        , 'ϵ' ],
        \ ['zeta'           , 'ζ' ],
        \ ['eta'            , 'η' ],
        \ ['theta'          , 'θ' ],
        \ ['vartheta'       , 'ϑ' ],
        \ ['iota'           , 'ι' ],
        \ ['kappa'          , 'κ' ],
        \ ['lambda'         , 'λ' ],
        \ ['mu'             , 'μ' ],
        \ ['nu'             , 'ν' ],
        \ ['xi'             , 'ξ' ],
        \ ['omicron'        , 'ο' ],
        \ ['pi'             , 'π' ],
        \ ['varpi'          , 'ϖ' ],
        \ ['rho'            , 'ρ' ],
        \ ['varrho'         , 'ϱ' ],
        \ ['sigma'          , 'σ' ],
        \ ['varsigma'       , 'ς' ],
        \ ['tau'            , 'τ' ],
        \ ['upsilon'        , 'υ' ],
        \ ['phi'            , 'φ' ],
        \ ['chi'            , 'χ' ],
        \ ['psi'            , 'ψ' ],
        \ ['omega'          , 'ω' ],
        \ ['Alpha'          , 'Α' ],
        \ ['Beta'           , 'Β' ],
        \ ['Gamma'          , 'Γ' ],
        \ ['Delta'          , 'Δ' ],
        \ ['Epsilon'        , 'Ε' ],
        \ ['Zeta'           , 'Ζ' ],
        \ ['Eta'            , 'Η' ],
        \ ['Theta'          , 'Θ' ],
        \ ['Iota'           , 'Ι' ],
        \ ['Kappa'          , 'Κ' ],
        \ ['Lambda'         , 'Λ' ],
        \ ['Mu'             , 'Μ' ],
        \ ['Nu'             , 'Ν' ],
        \ ['Xi'             , 'Ξ' ],
        \ ['Omicron'        , 'Ο' ],
        \ ['Pi'             , 'Π' ],
        \ ['Rho'            , 'Ρ' ],
        \ ['Sigma'          , 'Σ' ],
        \ ['Tau'            , 'Τ' ],
        \ ['Upsilon'        , 'Υ' ],
        \ ['Phi'            , 'Φ' ],
        \ ['Chi'            , 'Χ' ],
        \ ['Psi'            , 'Ψ' ],
        \ ['Omega'          , 'Ω' ],
        \ ['nabla'          , '∇' ],
        \ ['grad'           , '∇' ],
        \ ['partial'        , '∂' ],
        \ ['dell'           , '∂' ],
        \ ['ell'            , 'ℓ' ],
        \ ['le'             , '≤' ],
        \ ['leq'            , '≤' ],
        \ ['ge'             , '≥' ],
        \ ['geq'            , '≥' ],
        \ ['ne'             , '≠' ],
        \ ['neq'            , '≠' ],
        \ ['by'             , '×' ],
        \ ['times'          , '×' ],
        \ ['in'             , '∈' ],
        \ ['pm'             , '±' ],
        \ ['mp'             , '∓' ],
        \ ['infty'          , '∞' ],
        \ ['int'            , '∫' ],
        \ ['iint'           , '∬' ],
        \ ['iiint'          , '∭' ],
        \ ['oint'           , '∮' ],
        \ ['angle'          , '∠' ],
        \ ['approx'         , '≈' ],
        \ ['ast'            , '∗' ],
        \ ['backsimeq'      , '≃' ],
        \ ['because'        , '∵' ],
        \ ['between'        , '≬' ],
        \ ['bigcap'         , '∩' ],
        \ ['bigcup'         , '∪' ],
        \ ['bigtriangledown', '∇' ],
        \ ['bigtriangleup'  , '∆' ],
        \ ['bigvee'         , '⋁' ],
        \ ['bigwedge'       , '⋀' ],
        \ ['bot'            , '⊥' ],
        \ ['bullet'         , '•' ], 
        \ ['cdot'           , '·' ],
        \ ['circ'           , '○' ],
        \ ['cong'           , '≅' ],
        \ ['coprod'         , '∐' ], 
        \ ['dagger'         , '†' ],
        \ ['dashv'          , '⊣' ],
        \ ['ddagger'        , '‡' ],
        \ ['div'            , '÷' ],
        \ ['downarrow'      , '↓' ],
        \ ['Downarrow'      , '⇓' ],
        \ ['equiv'          , '≡' ],
        \ ['eth'            , 'ð' ],
        \ ['exists'         , '∃' ],
        \ ['fallingdotseq'  , '≒' ],
        \ ['flat'           , '♭' ],
        \ ['forall'         , '∀' ],
        \ ['geqq'           , '≧' ],
        \ ['gets'           , '←' ],
        \ ['gg'             , '≫' ],
        \ ['gneqq'          , '≩' ],
        \ ['gtrless'        , '≷' ],
        \ ['gtrsim'         , '≳' ],
        \ ['heartsuit'      , '♡' ],
        \ ['hookleftarrow'  , '↩' ],
        \ ['hookrightarrow' , '↪' ],
        \ ['iff'            , '⇔' ],
        \ ['implies'        , '⇒' ],
        \ ['land'           , '∧' ],
        \ ['lceil'          , '⌈' ],
        \ ['ldots'          , '…' ],
        \ ['leftarrow'      , '←' ],
        \ ['Leftarrow'      , '⇐' ],
        \ ['leftarrowtail'  , '↢' ],
        \ ['leftharpoondown', '↽' ],
        \ ['leftharpoonup'  , '↼' ],
        \ ['leftrightarrow' , '↔' ],
        \ ['Leftrightarrow' , '⇔' ],
        \ ['leqq'           , '≦' ],
        \ ['lesssim'        , '≲' ],
        \ ['lfloor'         , '⌊' ],
        \ ['ll'             , '≪' ],
        \ ['lneqq'          , '≨' ],
        \ ['lor'            , '∨' ],
        \ ['mid'            , '∣' ],
        \ ['mp'             , '∓' ],
        \ ['nabla'          , '∇' ],
        \ ['natural'        , '♮' ],
        \ ['ncong'          , '≇' ],
        \ ['ne'             , '≠' ],
        \ ['nearrow'        , '↗' ],
        \ ['neg'            , '¬' ],
        \ ['neq'            , '≠' ],
        \ ['nexists'        , '∄' ],
        \ ['ngeq'           , '≱' ],
        \ ['ngeqq'          , '≱' ],
        \ ['ngtr'           , '≯' ],
        \ ['ni'             , '∋' ],
        \ ['nleftarrow'     , '↚' ],
        \ ['nLeftarrow'     , '⇍' ],
        \ ['nLeftrightarrow', '⇎' ],
        \ ['nleq'           , '≰' ],
        \ ['nleqq'          , '≰' ],
        \ ['nless'          , '≮' ],
        \ ['nmid'           , '∤' ],
        \ ['notin'          , '∉' ],
        \ ['nparallel'      , '∦' ],
        \ ['nrightarrow'    , '↛' ],
        \ ['nRightarrow'    , '⇏' ],
        \ ['nsim'           , '≁' ],
        \ ['nvdash'         , '⊬' ],
        \ ['nvDash'         , '⊭' ],
        \ ['nwarrow'        , '↖' ],
        \ ['odot'           , '⊙' ],
        \ ['oint'           , '∮' ],
        \ ['ominus'         , '⊖' ],
        \ ['oplus'          , '⊕' ],
        \ ['oslash'         , '⊘' ],
        \ ['otimes'         , '⊗' ],
        \ ['owns'           , '∋' ],
        \ ['partial'        , '∂' ],
        \ ['perp'           , '⊥' ],
        \ ['pm'             , '±' ],
        \ ['prime'          , '′' ],
        \ ['prod'           , '∏' ],
        \ ['propto'         , '∝' ],
        \ ['rceil'          , '⌉' ],
        \ ['rfloor'         , '⌋' ],
        \ ['rightarrow'     , '→' ],
        \ ['Rightarrow'     , '⇒' ],
        \ ['rightarrowtail' , '↣' ],
        \ ['S'              , '§' ], 
        \ ['searrow'        , '↘' ],
        \ ['sharp'          , '♯' ],
        \ ['sim'            , '∼' ],
        \ ['spadesuit'      , '♠' ],
        \ ['star'           , '⋆' ],
        \ ['subset'         , '⊂' ],
        \ ['sub'            , '⊂' ],
        \ ['subseteq'       , '⊆' ],
        \ ['subsetneq'      , '⊊' ],
        \ ['sum'            , '∑' ],
        \ ['supset'         , '⊃' ],
        \ ['supseteq'       , '⊇' ],
        \ ['supsetneq'      , '⊋' ],
        \ ['surd'           , '√' ],
        \ ['swarrow'        , '↙' ],
        \ ['therefore'      , '∴' ],
        \ ['times'          , '×' ],
        \ ['to'             , '→' ],
        \ ['top'            , '⊤' ],
        \ ['triangle'       , '∆' ],
        \ ['uparrow'        , '↑' ],
        \ ['Uparrow'        , '⇑' ],
        \ ['updownarrow'    , '↕' ],
        \ ['Updownarrow'    , '⇕' ],
        \ ['varnothing'     , '∅' ],
        \ ['emptyset'       , '∅' ],
        \ ['nothing'        , '∅' ],
        \ ['vartriangle'    , '∆' ],
        \ ['vdash'          , '⊢' ],
        \ ['vDash'          , '⊨' ], 
        \ ['langle'         , '⟨' ],
        \ ['rangle'         , '⟩' ],
        \ ['Vert'           , '║' ] ]
end

" See https://stackoverflow.com/a/1680834
function s:Backslash(default, repl)
  if getline('.')[col('.')-2]=='\'
    return "\<bs>".a:repl
  else
    return a:default
  endif
endfunction

func s:TexAbbrev()
  for pair in s:texabbrev_table
    silent execute "abbrev <buffer> ".pair[0]." <c-r>=<sid>Backslash('".pair[0]."','".pair[1]."')<CR>"
    if !exists("g:texabbrev_nocabbrev")
      silent execute "cabbrev <buffer> tex".pair[0]." ".pair[1]
    end
    if exists("g:texabbrev_tmap")
      silent execute "tmap \\".pair[0]." ".pair[1]
    end
    if !exists("g:texabbrev_nocomplete")
      silent execute 'setlocal complete+=k' . s:wordlist
    end
  endfor
endfun

func s:TexUnabbrev()
  for pair in s:texabbrev_table
    " need silent! since s:TexAbbrev may not have been called
    silent! execute "unabbrev <buffer> ".pair[0]
    if exists("g:texabbrev_tmap")
      silent! execute "tunmap \\".pair[0]." ".pair[1]
    end
    if !exists("g:texabbrev_nocabbrev")
      silent! execute "cunabbrev <buffer> tex".pair[0]." ".pair[1]
    end
    if !exists("g:texabbrev_nocomplete")
      silent execute 'setlocal complete-=k' . s:wordlist
    end
  endfor
endfun

func s:Tex2Unicode()
  for pair in s:texabbrev_table
    execute '%s/\C\\'.pair[0].'\>/'.pair[1].'/ge'
  endfor
  call s:TexAbbrev()
endfun

func s:Unicode2Tex()
  for pair in s:texabbrev_table
    execute '%s/\C'.pair[1].'\(\a\)/\\'.pair[0].' \1/ge'
    execute '%s/\C'.pair[1].'\(\A\)/\\'.pair[0].'\1/ge'
  endfor
  call s:TexUnabbrev()
endfun

command TexAbbrev call s:TexAbbrev()
command TexUnabbrev call s:TexUnabbrev()
command Tex2Unicode call s:Tex2Unicode()
command Unicode2Tex call s:Unicode2Tex()

let &cpo = s:save_cpo
unlet s:save_cpo
