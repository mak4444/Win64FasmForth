CR .( SFF.F)
\ ' ANSI>OEM TO ANSI><OEM 
\ ' OEM>ANSI TO ANSI><OEM 

REQUIRE DUPENDCASE _mak/case.f

CR .( DC=) ' DUPENDCASE .

REQUIRE [IF] _mak/CompIF1.f
REQUIRE [IFNDEF] _nn/lib/ifdef.f
REQUIRE (* _af/lib/comments.f


: DBG\
\ POSTPONE \
 ; IMMEDIATE

[IFDEF] YDP_FL  1 TO YDP_FL [THEN]

VARIABLE HSSSS
VARIABLE ZSSSS
0 VALUE ALITERAL-CODE

REQUIRE Z" _mak/_af/lib/c/zstr.f

[IFNDEF] PARSE-WORD : PARSE-WORD NextWord  ;
[THEN]

[IFNDEF] PSKIP  : PSKIP SKIP ;
[THEN]
\ : KEY MKEY ;: KEY? MKEY? ;
REQUIRE SEE lib/ext/disasm.f 

[IFDEF] z z : z d
[THEN]

[IFDEF] d z ; POSTPONE d d IMMEDIATE
[THEN]

WARNING 0!

S" lib/include/tools.f"                     INCLUDED

C" CELL-"  FIND NIP 0=
[IF] : CELL- 1 CELLS - ; 
[THEN]
C" U>"  FIND NIP 0=
[IF] : U> SWAP U< ; 
[THEN]
C" D-" FIND NIP 0=
[IF]
: D- ( D1 D2  -- FLAG )
      DNEGATE D+ ;
[THEN]
C" D=" FIND NIP 0=
[IF]
: D= ( D1 D2  -- FLAG )
       D- D0= ;
[THEN]

C" \S" FIND NIP 0=
[IF]
: \S            \ comment to end of file
     SOURCE-ID FILE-SIZE DROP
     SOURCE-ID REPOSITION-FILE DROP
     [COMPILE] \ ; IMMEDIATE
[THEN]

S" _mak/utils_.f"                    INCLUDED

S" lib/ext/spf-asm.f"            INCLUDED
ALSO ASSEMBLER ALSO ASM-HIDDEN
'  NOOP IS  CODE-ALIGN 
PREVIOUS PREVIOUS
\ S" _mak/asm/ASM.FRT"                   INCLUDED


S" lib/include/tools.f"          INCLUDED


C" LAST-HERE" FIND NIP 0= VALUE INLINEVAR

' DUP VALUE 'DUP
0 VALUE RESERVE
USER-HERE CONSTANT USER-HERE-SET
USER-HERE-SET 7 + -8 AND TO RESERVE

S" src/global.f"              INCLUDED
S" src/tc_spfopt.f"                  INCLUDED

' _CONSTANT-CODE	TO CONSTANT-CODE
' _CREATE-CODE		TO CREATE-CODE
' _CLITERAL-CODE	TO CLITERAL-CODE      
' _SLITERAL-CODE	TO SLITERAL-CODE      

: TOMM_SIZE TO MM_SIZE ;

 DIS-OPT
 0x0 TOMM_SIZE
VOCABULARY GSPF0

: ?HS
 HERE           CELL- @ 
 HERE HSSSS @ + CELL- @  <>
IF CR
   HERE           CELL- @ H.
   HERE HSSSS @ + CELL- @ H.
   -1  ABORT"  HSSSS "
THEN
;
: TT 0 IF THEN ;

\ : CODE ?HS CODE ;
1 ALIGN-BYTES !

ALSO GSPF0 DEFINITIONS
: >R POSTPONE >R ; IMMEDIATE
: R> POSTPONE R> ; IMMEDIATE
CR
HERE   DUP H. 
 HERE 0xF OR 1+ DP !
HERE   DUP H.  MM_SIZE H. 

  HERE ZSSSS  !   0 HSSSS  !
0x11223344 , 0x55667788 , ?HS

S" src/gspf0.f"              INCLUDED

\ CR MM_SIZE H.
PREVIOUS  DEFINITIONS
\ MM_SIZE H.
\ S" _LL"   S"_L" PLACE
CR
HERE   DUP H. 
 HERE 0xF OR 1+ DP !
HERE   DUP H.  MM_SIZE H.
 ZSSSS @ HERE - HSSSS !
0x11223344 , 0x55667788 , ?HS
S" src/gspf0.f"              INCLUDED

