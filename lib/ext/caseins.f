\ $Id: caseins.f,v 1.6 2008/03/23 18:56:10 ygreks Exp $
( Case insensitivity for SP-FORTH )
( CASE-INS - case sensitivity switcher )
( just include this lib :)

REQUIRE REPLACE-WORD lib/ext/patch.f
REQUIRE ON           lib/ext/onoff.f
REQUIRE [IF]         lib/include/tools.f \ должно быть подключено до caseins-варианта
REQUIRE [else]       lib/ext/caseins-tools.f

VARIABLE CASE-INS \ switcher
CASE-INS ON

: USEARCH-WORDLIST ( c-addr u wid -- 0 | xt 1 | xt -1 )
  CASE-INS @ 0= IF
    [ ' SEARCH-WORDLIST DEFER@ COMPILE, ] EXIT
  THEN
	L@
	BEGIN   DUP \ CR ." S=" DUP H.
	WHILE
	>R 2DUP
		R@ \ DUP H.
	 COUNT \ 2DUP TYPE \ KEY DROP
     CEQUAL-U
		IF	2DROP
			R@ NAME> 
			R> NAME>F  L@ 1 AND 1- 1 OR \ DUP H.
			 EXIT
		THEN 	R> CDR
	REPEAT
	2DROP DROP 0 \ Not found.

;

' USEARCH-WORDLIST TO SEARCH-WORDLIST
CR .( CCC=)
S" RRRR" S" RRRR"    CEQUAL-U .
S" RRRR" S" rrrr"    CEQUAL-U .  CASE-INS @  .

cr .( www=) 3 h.

: UDIGIT ( C N1 -- N2 -1|0 ) 
\ N2 - значение литеры C как
\ цифры в системе счисления по основанию N1
\ hex-цифры могут быть строчными
  SWAP
  DUP [CHAR] 0 [CHAR] 9 1+ WITHIN
  IF \ within 0..9
     [CHAR] 0 -
  ELSE
     DUP [CHAR] A 1- >
     IF
       DUP [CHAR] a 1- > 
       IF 
         CASE-INS @ IF [CHAR] a ELSE 2DROP 0 EXIT THEN
       ELSE [CHAR] A THEN
       - 10 +
     ELSE 2DROP 0 EXIT THEN
  THEN
  TUCK > DUP 0= IF NIP THEN
;

' UDIGIT ' DIGIT REPLACE-WORD

