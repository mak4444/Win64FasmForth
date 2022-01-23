REQUIRE [IF] _mak/CompIF1.f
REQUIRE $! _mak\place.f
REQUIRE [IFNDEF] _nn\lib\ifdef.f

[IFNDEF] PARSE-WORD
: PARSE-WORD NextWord ;
[THEN]

CREATE WANT_BUFF 0x101 ALLOT
CREATE WANT_FILE 0x101 ALLOT
  S" _mak\do_want.f"  WANT_FILE $!

: [WANT] ( addr len -- addr len | )
   2DUP PARSE-WORD COMPARE
   IF POSTPONE \ EXIT THEN
   2DROP INTERPRET \EOF ;

: WANT  ( -- )
   PARSE-WORD WANT_BUFF $!
   WANT_FILE COUNT INCLUDED ;
  
   