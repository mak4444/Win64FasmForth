\ $Id: patch.f,v 1.3 2008/10/29 05:52:47 ygreks Exp $

\ : REL@ DUP @ + ; 

: REPLACE-WORD ( by-xt what-xt ) 
    \ http://n2.nabble.com/Прямая-компиляция-векторных-вызовов-td672884.html
    DUP C@ 0xE8 = IF \ if we're replacing defer'red word 
        DUP 1+ DUP L@ + 4 + ['] _VECT-CODE = IF 
            >BODY L! EXIT 
        THEN 
    THEN 

    0xE9 OVER C!  \ JMP ... 
    1+ DUP >R 
    4 + - 
    R> L! 
;

\ from gforth
\ : REPLACE-WORD ( by-xt what-xt )
\     [ HEX ] E9 [ DECIMAL ] OVER C!  \ JMP ...
\     1+ DUP >R
\     CELL+ -
\     R> !
\ ;
