 
REQUIRE [IF] _MAK\CompIF1.f

C" H." FIND NIP 0=
[IF]
 : H.  BASE @ HEX SWAP U. BASE !  ;
\ OP1
[THEN]

C" FIELD" FIND NIP 0=
[IF] : FIELD -- ;
[THEN]

C" BETWEEN" FIND NIP 0=
[IF] : BETWEEN 1+ WITHIN ;
[THEN]

C" ?EXIT" FIND NIP 0=
[IF]
 : ?EXIT POSTPONE IF
         POSTPONE EXIT
         POSTPONE THEN ; IMMEDIATE
\ : ?EXIT  IF RDROP THEN ;
[THEN]

C" DUP>R" FIND NIP 0=
[IF]

: DUP>R POSTPONE DUP
        POSTPONE >R   ; IMMEDIATE
[THEN]

C" >NAME" FIND NIP 0=
[IF] : >NAME  4 - DUP BEGIN 1- 2DUP COUNT + U< 0= UNTIL NIP ;
[THEN]

C" 2," FIND NIP 0=
[IF] 
 : 2,  ( D -- )
 HERE 2! 2 CELLS ALLOT ;
[THEN]

C" C>S" FIND NIP 0=
[IF] : C>S ( c -- n )  0xFF AND [ 0x7F INVERT ] LITERAL XOR 0x80 + ;
[THEN]
