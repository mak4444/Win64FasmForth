
REQUIRE PLACE  _mak/place.f 
REQUIRE [IF] _mak/CompIF1.f
REQUIRE DISASSEMBLER lib/ext/disasm.f 

C" STREAM-FILE" FIND NIP
[IF]
: FROM_SOURCE-ID SOURCE-ID  STREAM-FILE ;
: TO_SOURCE-ID FILE>RSTREAM TO SOURCE-ID ;
[ELSE]
: FROM_SOURCE-ID SOURCE-ID ;
: TO_SOURCE-ID TO SOURCE-ID ;
[THEN]

: INST [ ALSO DISASSEMBLER ] INST 
       [ PREVIOUS ]  ;

C" -CELL" FIND NIP 0=
[IF] -1 CELLS CONSTANT -CELL
[THEN]

CREATE  FILE_NAME_L 120 ALLOT

CREATE   HERE-TAB  5000 CELLS ALLOT
HERE CELL-  CONSTANT HERE-TAB-MAX
VARIABLE HERE-TAB-CUR
HERE-TAB HERE-TAB-CUR !
VARIABLE S_STATE 

: HERE-TAB-CUR+
  HERE-TAB-CUR @  CELL+ HERE-TAB-MAX UMIN
  HERE-TAB-CUR
 !
\ [ .( XXXX) DIS-OPT KEY DROP ]
 ;

: HERE-TO-TAB DP @ HERE-TAB-CUR @ ! HERE-TAB-CUR+ ;


CREATE   SHERE-TAB  800 CELLS ALLOT
HERE CELL-  CONSTANT SHERE-TAB-MAX
VARIABLE SHERE-TAB-CUR
SHERE-TAB SHERE-TAB-CUR !

: SHERE-TAB-CUR+
  SHERE-TAB-CUR @  CELL+ SHERE-TAB-MAX UMIN
  SHERE-TAB-CUR ! ;

: SHERE-TO-TAB DP @ SHERE-TAB-CUR @ ! SHERE-TAB-CUR+ ;

80 VALUE DUMP_MAX 

: MDUMP ( addr u -- )
  DUP 0= IF 2DROP EXIT THEN
  BASE @ >R HEX
  BEGIN
    CR OVER BASE-ADDR - 4 .0 SPACE
    2DUP 0x10 MIN 
    2DUP 0 DO I 4 MOD 0= IF SPACE THEN
             DUP C@ 2 .0 SPACE 1+
           LOOP DROP
    DUP >R PTYPE
    R@ - SWAP R> + SWAP DUP 0=
  UNTIL  2DROP
  R> BASE ! CR
;

: .LIST ( ADDR  ADDR1 -- ADDR1' ) 
          S_STATE @
          IF
             SWAP
             BEGIN  2DUP U> 
             WHILE  INST CR
             REPEAT  NIP
          ELSE
            TUCK   
            OVER - DUP
            IF   DUP DUMP_MAX U>

                IF  >R DUMP_MAX DUMP 
                    CR DUP U.  R> DUMP_MAX - U. ." bytes"
                ELSE  MDUMP
                THEN CR
            ELSE 2DROP
            THEN
          THEN
;
VECT INCLUDED$

' INCLUDED TO INCLUDED$
: INCLUDED_L
   ['] <PRE> >BODY @ >R
   ['] HERE-TO-TAB TO <PRE>
     HERE-TAB  HERE-TAB-CUR !
    SHERE-TAB SHERE-TAB-CUR ! 
  2DUP 2>R  INCLUDED$  2R>  R> TO <PRE>
 -1 SHERE-TAB-CUR @ !  SHERE-TAB-CUR+
    HERE-TO-TAB 
    HERE-TO-TAB       -CELL HERE-TAB-CUR +!
    HERE-TAB-CUR @ @  -CELL HERE-TAB-CUR +!
    BEGIN HERE-TAB-CUR @ HERE-TAB <>
    WHILE  HERE-TAB-CUR @ @ UMIN DUP HERE-TAB-CUR @ !
          -CELL HERE-TAB-CUR +!
    REPEAT DROP
    S_STATE 0!
    SHERE-TAB SHERE-TAB-CUR ! 

    2DUP FILE_NAME_L  PLACE
  S" _L" FILE_NAME_L +PLACE  
  R/O OPEN-FILE  THROW
  FILE_NAME_L COUNT 2DUP + 0!
  W/O CREATE-FILE THROW

  TIB >R >IN @ >R #TIB @ >R SOURCE-ID >R BLK @ >R CURSTR @ >R
  H-STDOUT >R  BASE @ >R HEX
  C/L 2 + ALLOCATE THROW TO TIB  BLK 0!
  TO H-STDOUT
  ." ZZ=" DUP .
  TO_SOURCE-ID
  CURSTR 0! HERE-TAB-CUR @ @
  BEGIN    REFILL
  WHILE
        SOURCE TYPE CR
        BEGIN  SHERE-TAB-CUR @ @ HERE-TAB-CUR @ CELL+ @ U<
        WHILE  SHERE-TAB-CUR @ @ .LIST   SHERE-TAB-CUR+
                 S_STATE @ INVERT S_STATE !
        REPEAT  HERE-TAB-CUR+ HERE-TAB-CUR @ @ .LIST
  REPEAT  DROP
  TIB FREE THROW
  FROM_SOURCE-ID
  ." ZZ=" DUP .
 CLOSE-FILE THROW ( ������ �������� ����� )
  H-STDOUT CLOSE-FILE THROW ( ������ �������� ����� )
  R> BASE ! R> TO H-STDOUT
  R> CURSTR ! R> BLK ! R> TO SOURCE-ID R> #TIB ! R> >IN ! R> TO TIB
;

: REQUIRED_L ( waddr wu laddr lu -- )
  2SWAP SFIND
  IF DROP 2DROP EXIT
  ELSE 2DROP INCLUDED_L THEN
;

[UNDEFINED] PSKIP [IF]
  : PSKIP SKIP ;
[THEN]

: REQUIRE_L ( "word" "libpath" -- )
  BL PSKIP BL PARSE
  BL PSKIP BL PARSE 2DUP + 0 SWAP C!
  REQUIRED_L
;

: : : SHERE-TO-TAB ;

: ; POSTPONE ; SHERE-TO-TAB ; IMMEDIATE

: SSSS
     HERE-TAB  HERE-TAB-CUR !
    SHERE-TAB SHERE-TAB-CUR ! 
;
