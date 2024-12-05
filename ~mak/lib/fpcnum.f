REQUIRE [IF] ~mak\CompIF.f

REQUIRE [IFNDEF] ~nn/lib/ifdef.f

\ REQUIRE _INF_MOD ~mak\infix3.f 

[IFNDEF] /STRING : /STRING DUP >R - SWAP R> + SWAP ;
[THEN]

[IFNDEF] 0>  : 0> 0 > ;
[THEN]

[IFNDEF] R>DROP : R>DROP POSTPONE RDROP ; IMMEDIATE
[THEN]

[IFNDEF] DUP>R : DUP>R POSTPONE DUP POSTPONE >R ; IMMEDIATE
[THEN]

[IFNDEF] UPC
: UPC  ( c -- c' )
   DUP [CHAR] Z U>
   IF  0xDF AND
   THEN   ;
[THEN]

0 VALUE DOUBLE?

-1 VALUE DP-LOCATION

0 VALUE ?MINUS

: NUMBER?       ( addr len -- d1 f1 )
                FALSE TO DOUBLE?                \ initially not a double #
                -1 TO DP-LOCATION
                OVER C@ [CHAR] - =
                OVER SWAP 0< AND DUP>R
                IF      1 /STRING
                THEN
                DUP 0=
                IF      R>DROP      FALSE TO ?MINUS
                        2DROP 0 0 FALSE EXIT   \ always return zero on failure
                THEN
                0 0 2SWAP >NUMBER
                OVER C@ [CHAR] . =              \ next char is a '.'
                OVER SWAP 0< AND                     \ more chars to look at
                IF      DUP 1- TO DP-LOCATION
			BEGIN
                        1 /STRING >NUMBER
                        DUP 0=
                        IF      TRUE TO DOUBLE? \ mark as a double number
                        THEN
  OVER C@ [CHAR] . <>			UNTIL 
                THEN    NIP 0=
                R> ?MINUS XOR
                IF      >R DNEGATE R>
                THEN  FALSE TO ?MINUS
;

: SNUMBER ( addr len -- d1 )
 NUMBER? THROW ;
 

: NUMBER ( a1 -- d1 )
\ Convert count delimited string at a1 into a double number.

\  0 0 ROT COUNT >NUMBER THROW DROP

 COUNT
 NUMBER? 0=
 THROW ;

: NUMBER,      ( d -- )
                DOUBLE? 0= IF DROP THEN
                STATE @
                IF      DOUBLE? IF  SWAP  [COMPILE] LITERAL  THEN
                        [COMPILE] LITERAL
                THEN
;

: XXX-SLITERAL ( addr u -> d true | false ) 
   NUMBER?
 IF NUMBER, TRUE  EXIT
 THEN
   2DROP FALSE
;

: BIN-SLITERAL ( addr u -> d true | false )
  BASE @ >R 2 BASE !
  XXX-SLITERAL
  R> BASE !
;

: HHH-SLITERAL ( addr u -> d true | false )
  BASE @ >R HEX
  2- SWAP 2+ SWAP
  XXX-SLITERAL
  R> BASE !
;

: ?SLITERAL3_H  ( c-addr u -- ... )
    
  DUP 1 >
     IF
	 2DUP 2>R
         OVER C@ [CHAR] - = DUP  TO ?MINUS
         IF    1 /STRING 
         THEN

         OVER W@ 0x7830 ( 0x) = 
         IF     HHH-SLITERAL
		IF RDROP RDROP
		ELSE -2001 THROW
		THEN EXIT
         THEN

          OVER C@ [CHAR] $ = 
         IF 1+ SWAP 1- SWAP HHH-SLITERAL
		IF RDROP RDROP
		ELSE -2001 THROW
		THEN EXIT
         THEN
              2DUP + 1- C@ UPC [CHAR] H =
         IF  1+  SWAP 2- SWAP  HHH-SLITERAL
		IF RDROP RDROP  EXIT
		THEN	2R@
         THEN

             2DUP + 1- C@ UPC [CHAR] B = BASE @ 0x10 <> AND
         IF   1- BIN-SLITERAL
		IF RDROP RDROP  EXIT
		THEN	2R@
         THEN

             OVER @ 0xFF00FF  AND 0x270027 ( '\0')  = 
             OVER 3 = AND
         IF  DROP @ 8 RSHIFT 0xFF AND
            STATE @ IF LIT, THEN RDROP RDROP  EXIT
         THEN 
         2DROP 2R>
  THEN
  2DUP 2>R 
 XXX-SLITERAL 0= \ ['] ?SLITERAL1 CATCH
  IF
(
 0 \   2R@ + 1- C@ [CHAR] # =
     IF
[ ALSO _INF_MOD ]

      S"  _INF_  { " _INF_BUFF $!
            2R> 1-   _INF_BUFF $+!
              S"  }" _INF_BUFF $+!
	    _INF_BUFF COUNT
	    TRUE TO _INF_FLAG
	  STATE @ >R POSTPONE [
	 ['] EVALUATE CATCH
	   FALSE TO _INF_FLAG  THROW
	 R> DUP STATE !  IF LIT, THEN

[ PREVIOUS ]

     ELSE )
       2R>
       OVER C@ [CHAR] " = OVER 2 > AND
       IF 2 - SWAP 1+ SWAP THEN
       2DUP + 0 SWAP C!
\       2dup type
       ['] INCLUDED CATCH
       DUP 2 = OVER 3 = OR OVER 161 = OR
       
       IF  -2003 THROW \ ABORT"  -???"
       ELSE  THROW THEN
\     THEN
  ELSE RDROP RDROP
  THEN
;



 ' ?SLITERAL3_H TO ?SLITERAL 


