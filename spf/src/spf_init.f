
: TITLE CR
  ." ANS FORTH 94" CR
  ." A.Cherezov  http://www.forth.org.ru/" CR
  ." M.Maksimov  http://www.chat.ru/~mak"  CR
;

VARIABLE TSTVAR

: TTT S" TT.F" INCLUDED ;
: ttt TTT ;

VECT TYPE ' TYPE1 TO TYPE
\ VECT EMIT ' _EMIT TO EMIT
VECT EMIT ' EMIT_M TO EMIT

\ : 0E.  0e F. ;
: SPINIT
    S0 A@ SP! ;

: THTST 1 THROW ;

: TTF S" spf/TT.F"  ;

: RRR
  1+ DUP 
  DROP ;

: COMMANDLINE ( -- ADDR LEN )
  COMMAND_LINE

  BEGIN 1+ DUP C@ BL U<= UNTIL
   ASCIIZ> \ ZCOUNT
 ;

: MM S" MM.F" ;

: NH.
\  DUP \ 0xF AND \ DUP 10 < 0= IF 7 + THEN
\ 0x30 + \ >R  4 RSHIFT
  
\ R>
 EMIT    
\  DROP
;

: INIT
\  DBG
 DECIMAL
  <'> ?SLITERAL2 TO ?SLITERAL
  <'> _QCONSTANT-CODE TO CONSTANT-CODE

 SPINIT
 
 COMMANDLINE ?DUP
   IF
     <'> EVALUATE CATCH    ?DUP
    IF <'> ERROR CATCH
      DROP \ IF 4 HALT THEN
    THEN
   ELSE DROP  TITLE
   THEN

  BEGIN
    <'> QUIT CATCH  SAVEERR
\     ." QUIT CATCH" DUP .

    ?DUP
    IF   CR
\     ." err=" .
      <'> ERROR CATCH DROP
	CR
    ELSE BYE THEN

    SPINIT \ R0 @ RP!
  AGAIN

;


