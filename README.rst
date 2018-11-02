texabbrev: abbreviate tex commands to unicode characters
================================================================================

Use tex commands like ``\alpha`` or ``\subseteq`` as insert mode abbreviations
for unicode counterparts ``α`` and ``⊆``. By default, adds ``alpha`` to
``'complete'``, and creates a command-line mode abbreviation for ``texalpha``,
but this can be disabled. Also provides commands for performing related
substitutions.

Related plugins include:

* unicoder_: The same idea, probably better implemented and better documented.
  Doesn't provide commands for toggling the abbreviations though, or for making
  substitutions.
* latex-unicoder_: Provides a mapping which prompts for the tex commands and
  then inserts the unicode character. Uses a `much more extensive`_ list of tex
  commands / unicode symbols.

.. contents::

Commands
--------------------------------------------------------------------------------

The plugin provides the following commands:

TexAbbrev         
   Enable all of the abbreviations.

TexUnAbbrev       
   Disable all of the abbreviations.

Tex2Unicode       
   Enable all of the abbreviations and also globally substitute the tex commands
   with their unicode equivalents.

Unicode2Tex       
   Disable all of the abbreviations and also globally substitute the unicode
   characters by the corresponding tex commands. When multiple tex commands
   correspond to the same character, the one appearing first in
   ``g:texabbrev_table`` will be used.

My main use of the plugin is to enable ``Tex2Unicode`` while editing a tex file,
and then to run ``Unicode2Tex`` before sharing it with others.

Configuration
------------------------------------------------------------------------------

If ``g:texabbrev_nocomplete`` exists then ``'complete'`` will not be altered. If
``g:texabbrev_nocabbrev`` exists then no command-line abbreviations will be set.
If ``g:texabbrev_tmap`` exists then mappings for ``:terminal`` will be created.

The default tex commands and unicode equivalents can be overriden by defining
_`g:texabbrev_table`  (see below for the default value) 

.. code-block:: vim

   let g:texabbrev_table = [['alpha','α'],['beta','β']]

Similarly the wordlist file to be added to ``'complete'`` can be overriden by
defining ``g:texabbrev_wordlist``

.. code-block:: vim

   let g:texabbrev_wordlist = "path/to/wordlist"

If anyone has a simple idea for how this process can be automated, I'm all ears.

Default symbol table
------------------------------------------------------------------------------

The default value of g:texabbrev_table_ is 

.. code-block:: vim

    let g:texabbrev_table = [  
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

This is partly cribbed from Dr. Chip's excellent TeX syntax file, but slightly
modified and trimmed down to match my own tastes and the unicode coverage of
my favorite fonts.

A potential tex setup
------------------------------------------------------------------------------
Regardless of the tex engine used, entering unicode characters in math mode does
not seem to work for me out of the box. Using the unicode-math_ package solves
this, but has many other side effects. Instead I use the newunicodechar_
package, and put the following lines in my preamble (really as an option in my
personal .sty file):

.. code-block:: tex

    \usepackage{newunicodechar}
    \newunicodechar{ö}{\"o}
    \newunicodechar{é}{\'e}
    \newunicodechar{α}{\alpha}
    \newunicodechar{β}{\beta}
    \newunicodechar{γ}{\gamma}
    \newunicodechar{δ}{\delta}
    \newunicodechar{ε}{\varepsilon}
    \newunicodechar{ϵ}{\epsilon}
    \newunicodechar{ζ}{\zeta}
    \newunicodechar{η}{\eta}
    \newunicodechar{θ}{\theta}
    \newunicodechar{ϑ}{\vartheta}
    \newunicodechar{ι}{\iota}
    \newunicodechar{κ}{\kappa}
    \newunicodechar{λ}{\lambda}
    \newunicodechar{μ}{\mu}
    \newunicodechar{ν}{\nu}
    \newunicodechar{ξ}{\xi}
    \newunicodechar{ο}{\omicron}
    \newunicodechar{π}{\pi}
    \newunicodechar{ϖ}{\varpi}
    \newunicodechar{ρ}{\rho}
    \newunicodechar{ϱ}{\varrho}
    \newunicodechar{σ}{\sigma}
    \newunicodechar{ς}{\varsigma}
    \newunicodechar{τ}{\tau}
    \newunicodechar{υ}{\upsilon}
    \newunicodechar{φ}{\phi}
    \newunicodechar{χ}{\chi}
    \newunicodechar{ψ}{\psi}
    \newunicodechar{ω}{\omega}
    \newunicodechar{Α}{\Alpha}
    \newunicodechar{Β}{\Beta}
    \newunicodechar{Γ}{\Gamma}
    \newunicodechar{Δ}{\Delta}
    \newunicodechar{Ε}{\Epsilon}
    \newunicodechar{Ζ}{\Zeta}
    \newunicodechar{Η}{\Eta}
    \newunicodechar{Θ}{\Theta}
    \newunicodechar{Ι}{\Iota}
    \newunicodechar{Κ}{\Kappa}
    \newunicodechar{Λ}{\Lambda}
    \newunicodechar{Μ}{\Mu}
    \newunicodechar{Ν}{\Nu}
    \newunicodechar{Ξ}{\Xi}
    \newunicodechar{Ο}{\Omicron}
    \newunicodechar{Π}{\Pi}
    \newunicodechar{Ρ}{\Rho}
    \newunicodechar{Σ}{\Sigma}
    \newunicodechar{Τ}{\Tau}
    \newunicodechar{Υ}{\Upsilon}
    \newunicodechar{Φ}{\Phi}
    \newunicodechar{Χ}{\Chi}
    \newunicodechar{Ψ}{\Psi}
    \newunicodechar{Ω}{\Omega}
    \newunicodechar{∇}{\grad}
    \newunicodechar{∇}{\nabla}
    \newunicodechar{∂}{\dell}
    \newunicodechar{∂}{\partial}
    \newunicodechar{ℓ}{\ell}
    \newunicodechar{≤}{\le}
    \newunicodechar{≤}{\leq}
    \newunicodechar{≥}{\ge}
    \newunicodechar{≥}{\geq}
    \newunicodechar{≠}{\ne}
    \newunicodechar{≠}{\neq}
    \newunicodechar{×}{\by}
    \newunicodechar{×}{\times}
    \newunicodechar{∈}{\in}
    \newunicodechar{±}{\pm}
    \newunicodechar{∓}{\mp}
    \newunicodechar{∞}{\infty}
    \newunicodechar{∫}{\int}
    \newunicodechar{∬}{\iint}
    \newunicodechar{∭}{\iiint}
    \newunicodechar{∮}{\oint}
    \newunicodechar{∠}{\angle}
    \newunicodechar{≈}{\approx}
    \newunicodechar{∗}{\ast}
    \newunicodechar{≃}{\backsimeq}
    \newunicodechar{∖}{\backslash}
    \newunicodechar{∵}{\because}
    \newunicodechar{≬}{\between}
    \newunicodechar{∩}{\bigcap}
    \newunicodechar{○}{\bigcirc}
    \newunicodechar{∪}{\bigcup}
    \newunicodechar{∇}{\bigtriangledown}
    \newunicodechar{∆}{\bigtriangleup}
    \newunicodechar{⋁}{\bigvee}
    \newunicodechar{⋀}{\bigwedge}
    \newunicodechar{∎}{\blacksquare}
    \newunicodechar{⊥}{\bot}
    \newunicodechar{•}{\bullet}
    \newunicodechar{∩}{\cap}
    \newunicodechar{·}{\cdot}
    \newunicodechar{∘}{\circ}
    \newunicodechar{∁}{\complement}
    \newunicodechar{≅}{\cong}
    \newunicodechar{∐}{\coprod}
    \newunicodechar{∪}{\cup}
    \newunicodechar{†}{\dagger}
    \newunicodechar{⊣}{\dashv}
    \newunicodechar{‡}{\ddagger}
    \newunicodechar{÷}{\div}
    \newunicodechar{↓}{\downarrow}
    \newunicodechar{⇓}{\Downarrow}
    \newunicodechar{∅}{\emptyset}
    \newunicodechar{≡}{\equiv}
    \newunicodechar{ð}{\eth}
    \newunicodechar{∃}{\exists}
    \newunicodechar{≒}{\fallingdotseq}
    \newunicodechar{♭}{\flat}
    \newunicodechar{∀}{\forall}
    \newunicodechar{≧}{\geqq}
    \newunicodechar{←}{\gets}
    \newunicodechar{≫}{\gg}
    \newunicodechar{≩}{\gneqq}
    \newunicodechar{≷}{\gtrless}
    \newunicodechar{≳}{\gtrsim}
    \newunicodechar{♡}{\heartsuit}
    \newunicodechar{↩}{\hookleftarrow}
    \newunicodechar{↪}{\hookrightarrow}
    \newunicodechar{⇔}{\iff}
    \newunicodechar{⇒}{\implies}
    \newunicodechar{∧}{\land}
    \newunicodechar{⌈}{\lceil}
    \newunicodechar{…}{\ldots}
    \newunicodechar{←}{\leftarrow}
    \newunicodechar{⇐}{\Leftarrow}
    \newunicodechar{↢}{\leftarrowtail}
    \newunicodechar{↽}{\leftharpoondown}
    \newunicodechar{↼}{\leftharpoonup}
    \newunicodechar{↔}{\leftrightarrow}
    \newunicodechar{⇔}{\Leftrightarrow}
    \newunicodechar{≦}{\leqq}
    \newunicodechar{≲}{\lesssim}
    \newunicodechar{⌊}{\lfloor}
    \newunicodechar{≪}{\ll}
    \newunicodechar{≨}{\lneqq}
    \newunicodechar{∨}{\lor}
    \newunicodechar{∣}{\mid}
    \newunicodechar{∓}{\mp}
    \newunicodechar{∇}{\nabla}
    \newunicodechar{♮}{\natural}
    \newunicodechar{≇}{\ncong}
    \newunicodechar{≠}{\ne}
    \newunicodechar{↗}{\nearrow}
    \newunicodechar{¬}{\neg}
    \newunicodechar{≠}{\neq}
    \newunicodechar{∄}{\nexists}
    \newunicodechar{≱}{\ngeq}
    \newunicodechar{≱}{\ngeqq}
    \newunicodechar{≯}{\ngtr}
    \newunicodechar{∋}{\ni}
    \newunicodechar{↚}{\nleftarrow}
    \newunicodechar{⇍}{\nLeftarrow}
    \newunicodechar{⇎}{\nLeftrightarrow}
    \newunicodechar{≰}{\nleq}
    \newunicodechar{≰}{\nleqq}
    \newunicodechar{≮}{\nless}
    \newunicodechar{∤}{\nmid}
    \newunicodechar{∉}{\notin}
    \newunicodechar{∦}{\nparallel}
    \newunicodechar{↛}{\nrightarrow}
    \newunicodechar{⇏}{\nRightarrow}
    \newunicodechar{≁}{\nsim}
    \newunicodechar{⊬}{\nvdash}
    \newunicodechar{⊭}{\nvDash}
    \newunicodechar{↖}{\nwarrow}
    \newunicodechar{⊙}{\odot}
    \newunicodechar{∮}{\oint}
    \newunicodechar{⊖}{\ominus}
    \newunicodechar{⊕}{\oplus}
    \newunicodechar{⊘}{\oslash}
    \newunicodechar{⊗}{\otimes}
    \newunicodechar{∋}{\owns}
    \newunicodechar{∂}{\partial}
    \newunicodechar{⊥}{\perp}
    \newunicodechar{±}{\pm}
    \newunicodechar{′}{\prime}
    \newunicodechar{∏}{\prod}
    \newunicodechar{∝}{\propto}
    \newunicodechar{⌉}{\rceil}
    \newunicodechar{⌋}{\rfloor}
    \newunicodechar{→}{\rightarrow}
    \newunicodechar{⇒}{\Rightarrow}
    \newunicodechar{↣}{\rightarrowtail}
    \newunicodechar{§}{\S}
    \newunicodechar{↘}{\searrow}
    \newunicodechar{∖}{\setminus}
    \newunicodechar{♯}{\sharp}
    \newunicodechar{∼}{\sim}
    \newunicodechar{♠}{\spadesuit}
    \newunicodechar{⋆}{\star}
    \newunicodechar{⊂}{\subset}
    \newunicodechar{⊆}{\subseteq}
    \newunicodechar{⊊}{\subsetneq}
    \newunicodechar{∑}{\sum}
    \newunicodechar{⊃}{\supset}
    \newunicodechar{⊇}{\supseteq}
    \newunicodechar{⊋}{\supsetneq}
    \newunicodechar{√}{\surd}
    \newunicodechar{↙}{\swarrow}
    \newunicodechar{∴}{\therefore}
    \newunicodechar{×}{\times}
    \newunicodechar{→}{\to}
    \newunicodechar{⊤}{\top}
    \newunicodechar{∆}{\triangle}
    \newunicodechar{⌜}{\ulcorner}
    \newunicodechar{↑}{\uparrow}
    \newunicodechar{⇑}{\Uparrow}
    \newunicodechar{↕}{\updownarrow}
    \newunicodechar{⇕}{\Updownarrow}
    \newunicodechar{⌝}{\urcorner}
    \newunicodechar{∅}{\varnothing}
    \newunicodechar{∆}{\vartriangle}
    \newunicodechar{⊢}{\vdash}
    \newunicodechar{⊨}{\vDash}
    \newunicodechar{∨}{\vee}
    \newunicodechar{∧}{\wedge}
    \newunicodechar{⟨}{\langle}
    \newunicodechar{⟩}{\rangle}
    \newunicodechar{║}{\Vert}

If anyone has a better idea (which doesn't involve messing with fonts), I'd be
happy to hear it.

.. _unicoder: https://github.com/arthurxavierx/vim-unicoder
.. _unicode-math: https://ctan.org/pkg/unicode-math
.. _newunicodechar: https://ctan.org/pkg/newunicodechar
.. _latex-unicoder: https://github.com/joom/latex-unicoder.vim
.. _much more extensive: http://milde.users.sourceforge.net/LUCR/Math/
