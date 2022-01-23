
: sType 
: sAsize
: sSize
: sState
: sNewBuff
: sWriteH
: sReadH
: /sHeader

: STRBUF-SIZE
: STR-ID
: STRLAST

: sAddr ( s -- addr )
;
: STR@ ( s -- addr u )
;
: STRHERE ( s -- addr )
;
: STRALLOT ( n s -- addr )
;
: STR+ ( addr u s -- )
;
: STR! ( addr u s -- )
;
: STRBUF ( -- s )
;
: "" ( -- s )
;
: STRFREE ( s -- )
;
: LSTRFREE ( -- )
;
: STR_EVAL ( addr u s -- )
;
: (") ( addr u -- s )
;
: _STRLITERAL ( -- s )
  R> DUP CELL+ SWAP @ 2DUP + CHAR+ >R
  (")
;
: STRBUF_

: STRLITERAL ( addr u -- )
; IMMEDIATE

: CRLF
;
: ''
;


: STR@LOCAL ( addr u -- addr u )
;
: PARSE"
;
: " ( "ccc" -- )
; IMMEDIATE

: STYPE
;
: FILE ( addr u -- addr1 u1 )
; IMMEDIATE
: S'
; IMMEDIATE

: S@ ( addr u -- addr2 u2 )
; IMMEDIATE
: EVAL-FILE ( addr u -- addr1 u1 )
; IMMEDIATE
: S! ( addr u var_addr -- )
; IMMEDIATE
: S+
ABORT ; IMMEDIATE

