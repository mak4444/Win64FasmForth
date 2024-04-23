\ HSSSS H.

[IFNDEF] BREAK
  : BREAK POSTPONE EXIT POSTPONE THEN ; IMMEDIATE
[THEN]

C" VECT-CODE" FIND NIP 0=
[IF]	' _VECT-CODE VALUE	VECT-CODE
[ELSE]	' _VECT-CODE	TO	VECT-CODE
[THEN]
C" USER-CODE" FIND NIP 0=
[IF]	' _USER-CODE VALUE	USER-CODE
[ELSE]	' _USER-CODE	TO	USER-CODE
[THEN]
C" USER-VALUE-CODE" FIND NIP 0=
[IF]	' _USER-VALUE-CODE VALUE	USER-VALUE-CODE
[ELSE]	' _USER-VALUE-CODE	TO	USER-VALUE-CODE
[THEN]

\ ' _CONSTANT-CODE	TO CONSTANT-CODE
\ ' _CREATE-CODE		TO CREATE-CODE
\ ' _CLITERAL-CODE	TO CLITERAL-CODE
\ ' _SLITERAL-CODE	TO SLITERAL-CODE

BASE @ HEX

: DUP5B?0      ( C -- C FLAG )
  DUP   0C7 AND   5 =    \  ADD|OR|ADC|SBB|AND|SUB|XOR|CMP  EAX, # X
  OVER  0FC AND 0B8 = OR \  MOV EAX|EBX|ECX|EDX, # X
;

: DUP5B?1      ( C -- C FLAG )
  DUP  0FD AND 0A1 =   \  MOV EAX, X  | X , EAX
;

: DUP6B?0      ( W -- W FLAG )
  DUP  C3FF AND C081 = \ ADD|OR|ADC|SBB|AND|SUB|XOR|CMP  EAX, # X
  OVER   0C7 = OR \ MOV [EAX], # X
\  OVER  878B = OR \ MOV EAX, X [EDI]
\  OVER  878D = OR \ LEA EAX, X [EDI]
\  OVER  873B = OR \ CMP EAX, X [EDI]
;

: DUP6B?1      ( W -- W FLAG )
  DUP  00501 =    \ ADD  X , EAX
  OVER  053B = OR \ CMP  EAX,  X

\ X00X.X101 1000.10X1
  OVER  67FD AND 0589 = OR  \ MOV X {[EBP]}, E(ACDB)X | E(ACDB)X , X {[EBP]}
  OVER  0589 = OR \ MOV X , EAX
  OVER  058D = OR \ MOV EAX,  X
  OVER  1D8D = OR \ MOV EBX,  X
  OVER  808B = OR \ MOV EAX, X [EAX]
  OVER  05FF = OR \ INC X
\  OVER  FCFF AND C0C7 = OR \ MOV EAX|EBX|ECX|EDX, # X
;

: UV> ' >BODY @ TlsIndex@ + POSTPONE LITERAL ; IMMEDIATE

: .EDI   ( ADDR n -- ADDR1 )
  ." ["
   DROP 2+ DUP @ TlsIndex@ +
   CASE
R0       OF ." T_R0" ENDOF
S0       OF ." T_S0" ENDOF
WARNING  OF ." T_WARNING" ENDOF	
STATE    OF ." T_STATE" ENDOF
BLK      OF ." T_BLK" ENDOF
CURFILE  OF ." T_CURFILE" ENDOF
HANDLER  OF ." T_HANDLER" ENDOF
HLD      OF ." T_HLD" ENDOF
BASE     OF ." T_BASE" ENDOF
PAD      OF ." T_PAD" ENDOF		
ER-A     OF ." T_ERminusA" ENDOF	
ER-U     OF ." T_ERminusU" ENDOF	
DOES>A   OF ." T_DOESgreatA" ENDOF
#TIB     OF ." T_nTIB" ENDOF		
>IN      OF ." T_greatIN" ENDOF
UV> TIB  OF ." T_TIB" ENDOF		
ATIB     OF ." T_ATIB" ENDOF
UV> SOURCE-ID OF ." T_SOURCEminusID" ENDOF
CURSTR   OF ." T_CURSTR" ENDOF	
CURRENT  OF ." T_CURRENT" ENDOF
S-O    OF ." T_SminusO" ENDOF	
UV> CONTEXT  OF ." T_CONTEXT" ENDOF
>OUT OF ." T_greatOUT" ENDOF	
W-CNT  OF ." T_WminusCNT" ENDOF	

\ NNN OF ." T_NNN" ENDOF		
\ TlsIndex@ - RESERVE  - DUP 0< IF CR ." (%edi) RESERVE " ABORT THEN
     ." reserve+0x" H. ." +edi]" CELL+  EXIT
    ENDCASE  ." -main_task+edi]" CELL+

;

\  RESERVE  -  DUP 0< IF CR  ." (%edi) RESERVE "
\  TlsIndex@ H. RESERVE  H.  TlsIndex@ - H. H. ABORT THEN

\     ." reserve+0x" GGGX ." +edi]" CELL+  EXIT
\     ." reserve+0x" TlsIndex@ - H. RESERVE  H. ." +edi]" CELL+  EXIT
\    ENDCASE  ." -main_task+edi]" CELL+ ;

: H.-H  ." 0" BASE @ HEX SWAP U>D (D.) TYPE BASE ! ." H" ;

: 1_GD_STEP ( ADDR n -- ADDR1 )
   CR ."  DB "  0xFF AND  H.-H 1+ ;

: 2_GD_STEP ( ADDR -- ADDR1 )
  1_GD_STEP ." ,"  DUP C@ H.-H 1+ ;

: 3_GD_STEP ( ADDR -- ADDR1 )
  2_GD_STEP ." ,"  DUP C@ H.-H 1+ ;

: 4_GD_STEP ( ADDR -- ADDR1 )
  3_GD_STEP ." ,"  DUP C@ H.-H 1+ ;

[IFNDEF] OCTAL : OCTAL 8 BASE ! ;
[THEN]

: \ooo.        ( n1 -- )
	BASE @ >R  DECIMAL
	0 (D.) TYPE	
	R> BASE ! ;

: ATYPE ( arrd len -- )
  DUP 0= IF 2DROP BREAK
  [CHAR] ' EMIT
  0 ?DO COUNT DUP [CHAR] ' = IF ." '" THEN EMIT
     LOOP DROP
  [CHAR] ' EMIT
 ;

0x5F535953 CONSTANT 'SYS_'

: GTYPE
   OVER @  'SYS_' = IF 4 - SWAP 4 + SWAP TYPE BREAK
  ." cfa_"
	2DUP S" CONTEXT"	COMPARE 0= IF 2DROP ." _CONTEXT"	BREAK
	2DUP S" WORD"	COMPARE 0= IF 2DROP ." _WORD"	BREAK
	2DUP S" LEAVE"	COMPARE 0= IF 2DROP ." _LEAVE"	BREAK
	2DUP S" REPEAT"	COMPARE 0= IF 2DROP ." _REPEAT"	BREAK
	2DUP S" exit"	COMPARE 0= IF 2DROP ." _exit"	BREAK
	2DUP S" CHAR"	COMPARE 0= IF 2DROP ." _CHAR"	BREAK
	2DUP S" IF"	COMPARE 0= IF 2DROP ." _IF"	BREAK
	2DUP S" ELSE"	COMPARE 0= IF 2DROP ." _ELSE"	BREAK
	2DUP S" WHILE"	COMPARE 0= IF 2DROP ." _WHILE"	BREAK
	2DUP S" RESIZE"	COMPARE 0= IF 2DROP ." _RESIZE"	BREAK
	2DUP S" free"	COMPARE 0= IF 2DROP ." _free"	BREAK
	2DUP S" write"	COMPARE 0= IF 2DROP ." _write"	BREAK
	2DUP S" KEY_EVENT"	COMPARE 0= IF 2DROP ." _KEY_EVENT"	BREAK
	2DUP S" PAGE"	COMPARE 0= IF 2DROP ." _PAGE"	BREAK
	2DUP S" PAGE_EXECUTE_READWRITE"	COMPARE 0= IF 2DROP ." _PAGE_EXECUTE_READWRITE"	BREAK
	2DUP S" MEM_COMMIT"	COMPARE 0= IF 2DROP ." _MEM_COMMIT"	BREAK
	2DUP S" MEM_RESERVE"	COMPARE 0= IF 2DROP ." _MEM_RESERVE"	BREAK
	2DUP S" INVALID_HANDLE_VALUE"	COMPARE 0= IF 2DROP ." _INVALID_HANDLE_VALUE"	BREAK
	2DUP S" FILE_ATTRIBUTE_ARCHIVE"	COMPARE 0= IF 2DROP ." _FILE_ATTRIBUTE_ARCHIVE"	BREAK
	2DUP S" CREATE_ALWAYS"	COMPARE 0= IF 2DROP ." _CREATE_ALWAYS"	BREAK
	2DUP S" OPEN_EXISTING"	COMPARE 0= IF 2DROP ." _OPEN_EXISTING"	BREAK
	2DUP S" FILE_BEGIN"	COMPARE 0= IF 2DROP ." _FILE_BEGIN"	BREAK
	2DUP S" FILE_CURRENT"	COMPARE 0= IF 2DROP ." _FILE_CURRENT"	BREAK
	2DUP S" EXTERN"	COMPARE 0= IF 2DROP ." _EXTERN"	BREAK
	2DUP S" EXPORT"	COMPARE 0= IF 2DROP ." _EXPORT"	BREAK
	2DUP S" BREAK"	COMPARE 0= IF 2DROP ." _BREAK"	BREAK
	2DUP S" ERR"	COMPARE 0= IF 2DROP ." _ERR"	BREAK

  0 DO  COUNT
      CASE
      [CHAR] @ OF ." _ld" ENDOF
      [CHAR] ! OF ." save" ENDOF
      [CHAR] = OF ." _equ" ENDOF
      [CHAR] < OF ." less" ENDOF
      [CHAR] > OF ." great" ENDOF
      [CHAR] + OF ." plus" ENDOF
      [CHAR] - OF ." minus" ENDOF
      [CHAR] * OF ." _mul" ENDOF
      [CHAR] / OF ." _div" ENDOF
      [CHAR] . OF ." dot" ENDOF
      [CHAR] : OF ." dcoma" ENDOF
      [CHAR] ; OF ." _end" ENDOF
      [CHAR] ? OF ." que" ENDOF
      [CHAR] ( OF ." _c" ENDOF
      [CHAR] ) OF ." cend" ENDOF
      [CHAR] [ OF ." _x" ENDOF
      [CHAR] ] OF ." _y" ENDOF
      [CHAR] { OF ." lsk" ENDOF
      [CHAR] } OF ." rsk" ENDOF
      [CHAR] , OF ." com" ENDOF
      [CHAR] ' OF ." tic" ENDOF
      [CHAR] ~ OF ." til" ENDOF
      [CHAR] ^ OF ." pic" ENDOF
      [CHAR] " OF ." dtic" ENDOF
      [CHAR] | OF ." l" ENDOF
      [CHAR] # OF ." n" ENDOF
      [CHAR] $ OF ." dol" ENDOF
      [CHAR] \ OF ." sl" ENDOF
      [CHAR] & OF ." and_" ENDOF
	I IF EMIT ENDOF
      [CHAR] 0 OF ." _0" ENDOF
      [CHAR] 1 OF ." _1" ENDOF
      [CHAR] 2 OF ." _2" ENDOF
      [CHAR] 3 OF ." _3" ENDOF
      [CHAR] 4 OF ." _4" ENDOF
      [CHAR] 5 OF ." _5" ENDOF
      [CHAR] 6 OF ." _6" ENDOF
      [CHAR] 7 OF ." _7" ENDOF
      [CHAR] 8 OF ." _8" ENDOF
      [CHAR] 9 OF ." _9" ENDOF 
               EMIT
    0 ENDCASE
     LOOP DROP ;

0 VALUE #GN

: GN.  ( ADDR -- )
  DUP 0x80 + 0xFFFFFF00 AND 0=  \  ABS  0x7F <
  IF H.-H EXIT THEN
  DUP HERE U<
  IF   DUP         WordByAddr
        OVER >R GTYPE ." +"
        R> 1- NAME> - DUP TO #GN H.-H
  ELSE NEGATE DUP  WordByAddr
        >R >R
        R@ 1- NAME> - DUP TO #GN H.-H
        ." -" R> R>  GTYPE
  THEN 
 ;

: .INT ( ADDR -- ADDR1 )
 CR   DUP HSSSS @ +
 @ OVER @ \ ." I=" 2DUP H. H. CR
 =
 IF   ."  DD " DUP @ H.-H
 ELSE ."  DD "   DUP @ ." (" GN.  ." ) and 0ffffffffh"
 THEN  CELL+ ;

: .LONG ( ADDR -- ADDR1 )
\  CR ."  DD " DUP @ H.-H CELL+ ." ," DUP @ H.-H CELL+
 CR   DUP HSSSS @ +
 @ OVER @ \ ." I=" 2DUP H. H. CR
 =
 IF   ."  DD " DUP @ H.-H  ." ," CELL+  DUP @ H.-H
 ELSE ."  DQ "   DUP @ ." (" GN.  ." ) and 0ffffffffh"
 THEN  CELL+ ;

: .ADR ( ADDR -- ADDR1 )
\   CR ."  DD "   DUP @ ." ("  GN.  ." ) and 0ffffffffh"
   CR ."  DD "   DUP @ GN.
 CELL+ ;

: .QADR ( ADDR -- ADDR1 )
\   CR ."  DD "   DUP @ ." ("  GN.  ." ) and 0ffffffffh"
   CR ."  DQ "   DUP @ GN.
 CELL+ CELL+ ;

: .ADR68 ( ADDR -- ADDR1 )
   CR ."  DD 68 "   DUP @ DUP H. GN. CELL+ ;

: 5_GD_STEP0 ( ADDR -- ADDR1 )
  1_GD_STEP .INT ;

: 5_GD_STEP1 ( ADDR -- ADDR1 )
  1_GD_STEP .ADR ;

: 6_GD_STEP0 ( ADDR -- ADDR1 )
  2_GD_STEP  .INT ;

: 6_GD_STEP1 ( ADDR -- ADDR1 )
  2_GD_STEP .ADR ;

: 7_GD_STEP  ( ADDR -- ADDR1 )
  3_GD_STEP  .ADR ;

: 1A_GD_STEP ( ADDR c -- ADDR1 )
   DROP   1+ DUP REL@ CELL+ GN. CELL+  ;

: 2A_GD_STEP ( ADDR W -- ADDR1 )
   CR ."  DW "
     H.-H   2+ DUP REL@ CELL+
   CR ."  DD "  GN. ." -$-4" CELL+  ;
C" C>S" FIND NIP 0=
[IF] : C>S ( c -- n )  0xFF AND [ 0x7F INVERT ] LITERAL XOR 0x80 + ;
[THEN]

: J_GD_STEP_
  0x70 - 3 *
  C" jo jnojb jaeje jnejbeja js jnsjp jnpjl jgejlejg " 1+ +
   CR 3    TYPE ."  " 1+  DUP C@ C>S OVER + 1+ GN. 1+
 ; \ short 

: J_GD_STEP
  DUP >R
  0x70 - 3 *
  C" jo jnojb jaeje jnejbeja js jnsjp jnpjl jgejlejg " 1+ +
   CR ." ;" 3   TYPE ."  " 1+  DUP C@ C>S OVER + 1+ GN. 1+
   2- R> 
   #GN IF 2_GD_STEP EXIT THEN
   J_GD_STEP_
 ; \ short 

: GD-STEP  (  CFA  -- CFA+N )
\  DUP 9 EMIT H.
  DUP   C@      \  CFA  N'
  DUP   0C3 = IF  1_GD_STEP  EXIT THEN  \ RET
  DUP   066 = IF  1_GD_STEP  EXIT THEN  \ D16:
  DUP   064 = IF  1_GD_STEP  EXIT THEN  \ FS:
  DUP   068 = IF  1_GD_STEP .INT  EXIT THEN  \ push X
\ LOOPNZ X LOOPZ X LOOP X JECXZ X IN AL, 0 IN EAX, 0 OUT 0 , AL OUT 0 , EAX
\ 1110.0XXX
  DUP 0F8 AND 0E0 = IF 2_GD_STEP EXIT THEN
\ 010X.XXXX
  DUP 0E0 AND 040 = IF 1_GD_STEP EXIT THEN  \ INC|DEC|PUSH|POP  E_X
\ 0111.0XXX
  DUP 0F0 AND 070 = IF J_GD_STEP EXIT THEN  \ JO   short
  DUP         0EB = IF 2_GD_STEP EXIT THEN  \ JMP
  DUP   090 = IF  1_GD_STEP  EXIT THEN  \  !!!!!
  DUP   099 = IF  1_GD_STEP  EXIT THEN  \  CDQ
  DUP   0A4 = IF  1_GD_STEP  EXIT THEN  \
  DUP   0A5 = IF  1_GD_STEP  EXIT THEN  \
  DUP   0A6 = IF  1_GD_STEP  EXIT THEN  \
  DUP   0AA = IF  1_GD_STEP  EXIT THEN  \
  DUP   0AB = IF  1_GD_STEP  EXIT THEN  \
  DUP   0AC = IF  1_GD_STEP  EXIT THEN  \
  DUP   0AE = IF  1_GD_STEP  EXIT THEN  \
  DUP   0B8 = IF ( ." SSS=")  1_GD_STEP .LONG  EXIT THEN  \ MOV RAX, # 1 
  DUP   024 = IF  2_GD_STEP  EXIT THEN  \ AND  AL , # 1
  DUP   02C = IF  2_GD_STEP  EXIT THEN  \ SUB  AL , # 1
  DUP   03C = IF  2_GD_STEP  EXIT THEN  \ CMP  AL , # 1
  DUP   0CD = IF  2_GD_STEP  EXIT THEN  \ INT	X
  DUP   0B0 = IF  2_GD_STEP  EXIT THEN  \
  DUP   0F2 = IF  1_GD_STEP  EXIT THEN  \
  DUP   0F3 = IF  2_GD_STEP  EXIT THEN  \ REPZ CMPSB
  DUP   0FC = IF  1_GD_STEP  EXIT THEN  \ CLD
  DUP   0FD = IF  1_GD_STEP  EXIT THEN  \ STD
  DUP   09C = IF  1_GD_STEP  EXIT THEN  \ PUSHFD
  DUP   09D = IF  1_GD_STEP  EXIT THEN  \ POPFD
  DUP5B?0     IF  5_GD_STEP0 EXIT THEN
  DUP5B?1     IF  5_GD_STEP1 EXIT THEN

   DUP   0E9 = IF CR ."  DB 0E9H"
                  CR ."  DD " 1A_GD_STEP ." -$-4" EXIT THEN  \  JMP
   DUP   0E8 = IF CR ."  call " 1A_GD_STEP
                 DUP CELL- REL@ CELL+ 
                 DUP USER-VALUE-CODE =
                 OVER      USER-CODE = OR
                 IF CR ."  DD reserve+"
                    DROP DUP @ RESERVE -  H.-H CELL+
                       EXIT
                 THEN          

                     CONSTANT-CODE =
                 IF   .INT EXIT
                 THEN          
                  DUP CELL- REL@ CELL+
                   ['] XLIT   =
                 IF   .INT EXIT
                 THEN          

                 DUP CELL- REL@ CELL+ 
                 CREATE-CODE  = 
                 IF   .LONG 2DUP U>
                   IF   DUP C@ 1_GD_STEP
                        BEGIN  2DUP U>
                        WHILE  DUP 7 AND
			IF ." ,"
			ELSE CR ."  DB "
			THEN DUP C@ H.-H 1+				
                        REPEAT
                   THEN  EXIT
                 THEN          

                 DUP CELL- REL@ CELL+ 
                 DUP  CLITERAL-CODE =
                 OVER ALITERAL-CODE = OR
                 SWAP SLITERAL-CODE = OR
                 IF  CR ."  DB " DUP COUNT DUP>R DUP H.-H
                     CR ."  DB " ATYPE ." ,0"
                     R> + 2+ EXIT
                 THEN          
                 DUP CELL- REL@ CELL+ 
                 VECT-CODE  =
                 IF   .ADR  EXIT
                 THEN

                 DUP CELL- REL@ CELL+ 
                 ['] YDO  =
                 IF   .QADR  EXIT
                 THEN

                 DUP CELL- REL@ CELL+ 
                 ['] YQDO  =
                 IF   .QADR  EXIT
                 THEN

                 DUP CELL- REL@ CELL+ 
                 '<'>  =
                 IF  CR ."  call " DUP 1A_GD_STEP  EXIT
                 THEN

                 DUP CELL- REL@ CELL+ 
                 VALUE-CODE  =
                 IF   .INT  EXIT
                 THEN

                 DUP CELL- REL@ CELL+ 
                 QVALUE-CODE  =
                 IF   .INT  EXIT
                 THEN

                 DUP CELL- REL@ CELL+ 
                 QTOVALUE-CODE  =
                 IF   .INT  .INT  EXIT
                 THEN


            EXIT THEN  \  CALL
\ 1110.11XX
  DUP FC AND EC = IF 1_GD_STEP EXIT THEN  \ IN|OUT  EAX AL, DX | DX, EAX EL

  DROP
  DUP W@ \ CR ." G=" DUP H.
  DUP3B?[EBP]   IF  3_GD_STEP   EXIT THEN
  DUP3B?        IF  3_GD_STEP   EXIT THEN
  DUP2B?        IF  2_GD_STEP   EXIT THEN
  DUP 0C601 =   IF  2_GD_STEP   EXIT THEN  \ add    %eax,%esi
  DUP 0C701 =   IF  2_GD_STEP   EXIT THEN  \ add    %eax,%edi
  DUP 0DB0A =   IF  2_GD_STEP   EXIT THEN  \ OR  BL, BL
  DUP 0C90A =   IF  2_GD_STEP   EXIT THEN  \ OR  CL, CL
  DUP 0038B =   IF  2_GD_STEP   EXIT THEN  \ MOV  EAX, [EBX]
  DUP 0EC87 =   IF  2_GD_STEP   EXIT THEN  \
  DUP 0188A =   IF  2_GD_STEP   EXIT THEN  \ MOV BL, [EAX]
  DUP 07D8B =   IF  3_GD_STEP   EXIT THEN  \ MOV EDI, X [EBP]
  DUP 0C58B =   IF  2_GD_STEP   EXIT THEN  \ MOV EAX,  EBP
  DUP 0E08B =   IF  2_GD_STEP   EXIT THEN  \ MOV EAX,  EBP
  DUP 0E88B =   IF  2_GD_STEP   EXIT THEN  \ MOV EBP,  EAX
  DUP 0E58B =   IF  2_GD_STEP   EXIT THEN  \ MOV ESP,  EBP
  DUP 0458F =   IF  3_GD_STEP   EXIT THEN  \ POP  X [EBP]
  DUP 075FF =   IF  3_GD_STEP   EXIT THEN  \ PUSH X [EBP]
  DUP 0C009 =   IF  2_GD_STEP   EXIT THEN  \ OR   EAX, EAX
  DUP 0E3FF =   IF  2_GD_STEP   EXIT THEN  \ JMP  EBX
\  DUP 0D2FF =   IF  2_GD_STEP   EXIT THEN  \ JMP  EDX
  DUP 0E2FF =   IF  2_GD_STEP   EXIT THEN  \ JMP  EDX
  DUP 0D0FF =   IF  2_GD_STEP   EXIT THEN  \ CALL EAX
  DUP 0D2FF =   IF  2_GD_STEP   EXIT THEN  \ CALL EDX
  DUP 0D3FF =   IF  2_GD_STEP   EXIT THEN  \ CALL EBX
  DUP 023FF =   IF  2_GD_STEP   EXIT THEN  \ JMP [EBX]
  DUP 0E903 =   IF  2_GD_STEP   EXIT THEN  \ ADD EBP, ECX
  DUP 0F903 =   IF  2_GD_STEP   EXIT THEN  \ ADD EDI, ECX
  DUP 0F103 =   IF  2_GD_STEP   EXIT THEN  \ ADD ESI, ECX
  DUP 0F003 =   IF  2_GD_STEP   EXIT THEN  \ ADD ESI, EAX
  DUP 0D703 =   IF  2_GD_STEP   EXIT THEN  \ ADD EDX, EDI
  DUP 0C703 =   IF  2_GD_STEP   EXIT THEN  \ ADD EAX, EDI
  DUP 0DF03 =   IF  2_GD_STEP   EXIT THEN  \ ADD EBX, EDI
  DUP 0E103 =   IF  2_GD_STEP   EXIT THEN  \ ADD ESP, ECX
  DUP 0E303 =   IF  2_GD_STEP   EXIT THEN  \ ADD ESP, EBX
  DUP 0E803 =   IF  2_GD_STEP   EXIT THEN  \ ADD  EBP, EAX
  DUP 0EB03 =   IF  2_GD_STEP   EXIT THEN
  DUP 0F803 =   IF  2_GD_STEP   EXIT THEN  \ ADD EDI, EAX
  DUP 0E903 =   IF  2_GD_STEP   EXIT THEN  \ ADD EBP, ECX
  DUP  0523 =   IF  2_GD_STEP .INT  EXIT THEN  \ AND EAX , 55C18F
  DUP  052B =   IF  2_GD_STEP .INT  EXIT THEN  \ SUB EAX , 55C18F
  DUP 0C72B =   IF  2_GD_STEP   EXIT THEN  \ SUB EAX, EDI
  DUP 0CD2B =   IF  2_GD_STEP   EXIT THEN  \ SUB ECX, EBP
  DUP 0CF2B =   IF  2_GD_STEP   EXIT THEN  \ SUB ECX, EDI
  DUP 0D72B =   IF  2_GD_STEP   EXIT THEN  \ SUB EDX, EDI
  DUP 0F22B =   IF  2_GD_STEP   EXIT THEN  \ SUB ESI, EDX
  DUP 0DE2B =   IF  2_GD_STEP   EXIT THEN  \ SUB  EBX, ESI
  DUP 0E32B =   IF  2_GD_STEP   EXIT THEN  \ SUB  ESP, EBX
  DUP 0E82B =   IF  2_GD_STEP   EXIT THEN  \ SUB  EBP, EAX
  DUP 0FF33 =   IF  2_GD_STEP   EXIT THEN  \ xor EDI, EDI
  DUP 0D233 =   IF  2_GD_STEP   EXIT THEN  \ xor EDX, EDX
  DUP 0F33B =   IF  2_GD_STEP   EXIT THEN  \ CMP ESI, EBX
  DUP 0C13A =   IF  2_GD_STEP   EXIT THEN  \ CMP  AL,  CL
  DUP 0C23A =   IF  2_GD_STEP   EXIT THEN  \ CMP  AL,  DL
  DUP 0D83A =   IF  2_GD_STEP   EXIT THEN  \ CMP  BL,  AL
  DUP 0EB80 =   IF  3_GD_STEP   EXIT THEN  \ SUB  BL, # X
  DUP 0FB80 =   IF  3_GD_STEP   EXIT THEN  \ CMP  BL, # X
  DUP 0C0C6 =   IF  3_GD_STEP   EXIT THEN  \ MOV AL, # 0
  DUP 00081 =   IF  2_GD_STEP .INT  EXIT THEN  \ ADD [EAX] , # 800 
  DUP  0581 =	IF  2_GD_STEP .ADR .INT  EXIT THEN  \ ADD X , # Y
  DUP 0E181 =   IF  2_GD_STEP .INT  EXIT THEN  \ AND ECX, # FF
  DUP 0E281 =   IF  2_GD_STEP .INT  EXIT THEN  \ AND EDX, # FF
  DUP 0F981 =   IF  2_GD_STEP .INT  EXIT THEN  \ CMP ECX, # 1 
  DUP 0B848 =   IF ." SSS="  2_GD_STEP .LONG  EXIT THEN  \ MOV RAX, # 1 
  DUP 04583 =   IF  4_GD_STEP   EXIT THEN  \ ADD     F8 [EBP] , # 2 
  DUP 0EB83 =   IF  3_GD_STEP   EXIT THEN  \ SUB EBX, # X
  DUP 0FB83 =   IF  3_GD_STEP   EXIT THEN  \ CMP EBX, # X
  DUP 0EE83 =   IF  3_GD_STEP   EXIT THEN  \ SUB ESI, # X
  DUP 0C183 =   IF  3_GD_STEP   EXIT THEN  \ ADD ECX, # X
  DUP 0E183 =   IF  3_GD_STEP   EXIT THEN  \ AND ECX, # 3
  DUP 0E383 =   IF  3_GD_STEP   EXIT THEN  \ AND EBX, # 3
  DUP 0EC83 =   IF  3_GD_STEP   EXIT THEN
  DUP 0F9C1 =   IF  3_GD_STEP   EXIT THEN  \ SAR ECX, # 2
  DUP 0E1C1 =   IF  3_GD_STEP   EXIT THEN  \ SHL ECX, # 2
  DUP 01889 =   IF  2_GD_STEP   EXIT THEN  \ MOV   [EAX], EBX
  DUP 04889 =   IF  3_GD_STEP   EXIT THEN  \ MOV X [EAX], ECX
  DUP 04289 =   IF  3_GD_STEP   EXIT THEN  \ MOV 4 [EDX], EAX
  DUP 04B89 =   IF  3_GD_STEP   EXIT THEN  \ MOV 2 [EBX], ECX
  DUP 0468A =   IF  3_GD_STEP   EXIT THEN  \ MOV  AL, X [ESI]
  DUP 0088A =   IF  2_GD_STEP   EXIT THEN  \ MOV  CL, [EAX]
  DUP 0068B =   IF  2_GD_STEP   EXIT THEN  \ MOV EAX,   [ESI]
  DUP 01B8B =   IF  2_GD_STEP   EXIT THEN  \ MOV EBX,   [EBX]
  DUP 0188B =   IF  2_GD_STEP   EXIT THEN  \ MOV EBX,   [EAX]
  DUP  DF8B =   IF  2_GD_STEP   EXIT THEN  \ MOV EBX, EDI
  DUP  EC8B =   IF  2_GD_STEP   EXIT THEN
  DUP 05089 =   IF  3_GD_STEP   EXIT THEN  \ MOV X [EAX] , EDX 
  DUP 0368B =   IF  2_GD_STEP   EXIT THEN  \ MOV ESI,   [ESI]
  DUP 0758B =   IF  3_GD_STEP   EXIT THEN  \ MOV ESI, X [EBP]
  DUP 0408B =   IF  3_GD_STEP   EXIT THEN  \ MOV EAX, X [EAX]
  DUP 0498B =   IF  3_GD_STEP   EXIT THEN  \ MOV ECX, FC [ECX] 
  DUP 04B8B =   IF  3_GD_STEP   EXIT THEN  \ MOV  ECX, 12 [EBX]
  DUP 0E58B =   IF  2_GD_STEP   EXIT THEN
  DUP 06D8D =   IF  3_GD_STEP   EXIT THEN  \ LEA  EBP, OFF-EBP [EBP]
  DUP 0C583 =   IF  3_GD_STEP   EXIT THEN  \ ADD  EBP, # OFF-EBP
  DUP 0ED83 =   IF  3_GD_STEP   EXIT THEN  \ SUB  EBP, # X
  DUP 0C483 =   IF  3_GD_STEP   EXIT THEN  \ ADD  ESP, # X
  DUP 0FA83 =   IF  3_GD_STEP   EXIT THEN  \ CMP EDX, # 3
  DUP 07D83 =   IF  4_GD_STEP   EXIT THEN  \ CMP X [EBP] , # Y
  DUP 07D89 =   IF  3_GD_STEP   EXIT THEN  \ MOV  X [EBP], EDI
  DUP 0F089 =   IF  2_GD_STEP   EXIT THEN  \ mov    %esi,%eax
  DUP 0688B =   IF  3_GD_STEP   EXIT THEN  \ MOV  EBP, 4 [EAX]
  DUP 0CC8B =   IF  2_GD_STEP   EXIT THEN
  DUP 0F58B =   IF  2_GD_STEP   EXIT THEN
  DUP 0FC8B =   IF  2_GD_STEP   EXIT THEN

  DUP 0C6FF =   IF  2_GD_STEP   EXIT THEN \ inc  %esi
  DUP 0C7FF =   IF  2_GD_STEP   EXIT THEN \ inc  %edi

  DUP 0F0FF AND
      0800F =   IF  2A_GD_STEP  EXIT THEN  \ JNO  X
  DUP 075F7 =   IF  3_GD_STEP   EXIT THEN  \  DIV DWORD [EBP]
  DUP 0D9F7 =   IF  2_GD_STEP   EXIT THEN  \ NEG  ECX
  DUP 0DBF7 =   IF  2_GD_STEP   EXIT THEN  \ NEG  EBX
  DUP 0E3F7 =   IF  2_GD_STEP   EXIT THEN  \  MUL EBX 
  DUP 0EBF7 =   IF  2_GD_STEP   EXIT THEN  \ IMUL EBX
  DUP 0FBF7 =   IF  2_GD_STEP   EXIT THEN  \ IDIV EBX
  DUP 0F3F7 =   IF  2_GD_STEP   EXIT THEN  \  DIV EBX
  DUP 0F60B =   IF  2_GD_STEP   EXIT THEN  \ OR   ESI, ESI
  DUP 0CE8B =   IF  2_GD_STEP   EXIT THEN  \ MOV  ECX, ESI
  DUP 0C48B =   IF  2_GD_STEP   EXIT THEN  \ MOV  EAX, ESP
  DUP 0F18B =   IF  2_GD_STEP   EXIT THEN  \ MOV  ESI, ECX
  DUP 0F08B =   IF  2_GD_STEP   EXIT THEN  \ MOV  ESI, EAX
  DUP 0D58B =   IF  2_GD_STEP   EXIT THEN  \ MOV EDX, EBP
  DUP 0D78B =   IF  2_GD_STEP   EXIT THEN  \ MOV EDX, EDI
  DUP 0DD8B =   IF  2_GD_STEP   EXIT THEN  \ MOV  EBX, EBP
  DUP 0FA8B =   IF  2_GD_STEP   EXIT THEN  \ MOV EDI, EDX
  DUP 01A8B =   IF  2_GD_STEP   EXIT THEN  \ MOV EBX, [EDX]
  DUP 0028B =   IF  2_GD_STEP   EXIT THEN  \ MOV EAX, [EDX]
  DUP 0078B =   IF  2_GD_STEP   EXIT THEN  \ MOV EAX, [EDI]
  DUP  088B =   IF  2_GD_STEP   EXIT THEN  \ MOV ECX, [EAX] 
  DUP  098B =   IF  2_GD_STEP   EXIT THEN  \ MOV ECX, [ECX] 
  DUP  0A8B =   IF  2_GD_STEP   EXIT THEN  \ MOV ECX, [EDX] 
  DUP  00C6 =   IF  3_GD_STEP   EXIT THEN  \ MOV [EAX] , # x
  DUP 0768D =   IF  3_GD_STEP   EXIT THEN  \ LEA ESI , FC [ESI] 
  DUP 0688D =   IF  3_GD_STEP   EXIT THEN  \ LEA EBP,  4 [EAX]
  DUP 0428D =   IF  3_GD_STEP   EXIT THEN  \ LEA EAX , FE [EDX] 
  DUP 0498D =   IF  3_GD_STEP   EXIT THEN  \ LEA ECX, -1 [ECX]
  DUP 0488D =   IF  3_GD_STEP   EXIT THEN  \ LEA ECX , FC [EAX] 

  DUP 07F8D =   IF  3_GD_STEP   EXIT THEN  \ LEA EDI, -1 [EDI]
  DUP 0528D =   IF  3_GD_STEP   EXIT THEN  \ LEA EDX, -4 [EDX]
\  DUP 01C8D =   IF  3_GD_STEP   EXIT THEN  \ LEA  EBX,  [EDX] [EAX]
  DUP 0038F =   IF  2_GD_STEP   EXIT THEN  \ POP  [EBX]
  DUP 05DD1 =   IF  3_GD_STEP   EXIT THEN  \ RCR [EBP], # 1
  DUP 0D0D1 =   IF  2_GD_STEP   EXIT THEN  \ RCL EAX, # 1
  DUP 065D1 =   IF  3_GD_STEP   EXIT THEN  \ SHL [EBP], # 1
  DUP 0C0C1 =   IF  3_GD_STEP   EXIT THEN  \ ROL [EBP], # 1
  DUP  45FF =   IF  3_GD_STEP   EXIT THEN  \ INC     0 [EBP]
  DUP 0310F =   IF  2_GD_STEP   EXIT THEN  \ RDTSC
  DUP  873B =   IF CR ."  cmp " ." eax," .EDI  EXIT THEN  \ CMP EAX, X [EDI]
  DUP  878B =   IF CR ."  mov " ." eax," .EDI  EXIT THEN  \ MOV EAX, X [EDI]
  DUP  8F8B =   IF CR ."  mov " ." ecx," .EDI  EXIT THEN  \ MOV ECX, X [EDI]
  DUP  878D =   IF CR ."  lea " ." eax," .EDI  EXIT THEN  \ LEA EAX, X [EDI]
  DUP  87FF =   IF CR ."  inc DWORD" .EDI           EXIT THEN  \ INC   19F9 [EDI] 
  DUP  8788 =   IF CR ."  mov al,"  .EDI      EXIT THEN  \ MOV     19F9 [EDI] , AL 
  DUP  8789 =   IF CR ."  mov " .EDI ." ,eax"     EXIT THEN  \ MOV X [EDI], EAX
  DUP  8703 =   IF CR ."  add eax," .EDI      EXIT THEN  \ ADD EAX , X [EDI]
  DUP  8733 =   IF CR ."  xor eax," .EDI      EXIT THEN  \ XOR EAX , X [EDI]
  DUP  87C7 =   IF CR ."  mov " DROP DUP 6 + @
                             H. ." ,"  DUP @ .EDI 6 + EXIT THEN  \ MOV X [EDI], # Y
  DUP  45C7 =   IF 3_GD_STEP .INT    EXIT THEN  \ MOV X [EBP], # X 
  DUP  3D83 =   IF 2_GD_STEP .ADR DUP C@ 1_GD_STEP EXIT THEN  \ MOV X [EBP], # X 
  DUP  0533 =   IF 2_GD_STEP .ADR EXIT THEN  \ XOR X [EBP], X 
  DUP  0503 =   IF 2_GD_STEP .ADR EXIT THEN  \ ADD    EAX , X
  DUP  1501 =   IF 2_GD_STEP .ADR EXIT THEN  \ ADD    X , EDX  
  DUP  050B =   IF 2_GD_STEP .ADR EXIT THEN  \ OR     EAX , X
  DUP  0D3B =   IF 2_GD_STEP .ADR EXIT THEN  \ CMP    ECX , x
  DUP  2DF7 =   IF 2_GD_STEP .ADR EXIT THEN  \ IMUL   x
  DUP  808D =   IF 2_GD_STEP .INT EXIT THEN  \ LEA  EAX, 8700 [EAX]
  DUP  9A8D =   IF 2_GD_STEP .INT EXIT THEN  \ LEA  EBX, 55C298 [EDX] 
  DUP  888D =   IF 2_GD_STEP .INT EXIT THEN  \ LEA  ECX, XXX [EAX]
  DUP  01C7 =   IF 2_GD_STEP .INT EXIT THEN  \ MOV [ECX] , # 424648D 
  DUP 0C0C7 =   IF 2_GD_STEP .INT EXIT THEN  \ MOV EAX, # X
  DUP 0C1C7 =   IF 2_GD_STEP .INT EXIT THEN  \ MOV ECX, # X
  DUP 0C069 =   IF 2_GD_STEP .INT EXIT THEN  \ IMUL    EAX , EAX , # 4 
  DUP 0C3C7 =   IF 2_GD_STEP .INT EXIT THEN  \ MOV EBX, # X
  DUP 0C6C7 =   IF 2_GD_STEP .INT EXIT THEN  \ MOV ESI, # X
  DUP  05C7 =   IF 2_GD_STEP .ADR .INT  EXIT THEN  \ MOV     5746E5  ( OPT?+5  ) , # FFFFFFFF 
  DUP6B?0       IF  6_GD_STEP0  EXIT THEN  \ MOV  EAX, # X
  DUP6B?1       IF  6_GD_STEP1  EXIT THEN
  DUP 00583 =   IF  6_GD_STEP1 
         DUP C@     1_GD_STEP   EXIT THEN
  DROP
  DUP @ FFFFFF AND
  DUP 021C8D = IF 3_GD_STEP	EXIT THEN
  DUP 240401 = IF 3_GD_STEP	EXIT THEN \ ADD [ESP] , EAX
  DUP C09D0F = IF 3_GD_STEP	EXIT THEN \ SETGE  AL
  DUP C09E0F = IF 3_GD_STEP	EXIT THEN \ SETLE  AL
  DUP 8D1C8D = IF 7_GD_STEP	EXIT THEN \ LEA  EBX, [ECX*4]
\ CMPXCHG [EAX] , AL| EAX
\ LSS     EAX , [EAX]
\ BTR     [EAX] , EAX
\ LFS     EAX , [EAX]
\ LGS     EAX , [EAX]
\ MOVZX   EAX , BYTE|WORD  PTR [EAX]
\ 0000.0000 1011.1XXX 0000.1111
  DUP FFF8FF 
  AND 00B00F = IF 3_GD_STEP      EXIT THEN

  DUP 24442B = IF 4_GD_STEP      EXIT THEN \ SUB  EAX, X [ESP]
  DUP 240487 = IF 4_GD_STEP      EXIT THEN \ XCHG EAX, X [ESP]
  DUP 24648D = IF 4_GD_STEP      EXIT THEN \ LEA  ESP, X [ESP]
\ MOV|LEA  EAX, X [E__] [E__*X]
\ MOV|LEA  X [E__] [E__*X], EAX
\ POP      X [E__] [E__*X]
\ XXXX.X1XX 0100.0100 1000.1XX1
  DUP 04FFF9 
  AND 044489 = IF 4_GD_STEP      EXIT THEN
  DUP 035C8D = IF 4_GD_STEP      EXIT THEN \ MOV   EBX, X  [EBX] [EAX]
  DUP 03448B = IF 4_GD_STEP      EXIT THEN \ MOV   EAX, X  [EBX] [EAX]
  DUP 03B60F = IF 3_GD_STEP      EXIT THEN \ MOVZX EAX, BYTE PTR [EBX]
  DUP 18B60F = IF 3_GD_STEP      EXIT THEN \ MOVZX EBX, BYTE PTR [EAX]
  DUP 31348B = IF 3_GD_STEP      EXIT THEN \ MOV ESI, [ESI+ECX]
  DUP 40B60F = IF 4_GD_STEP      EXIT THEN \ MOVZX   EAX , BYTE PTR x [EAX]
  DUP 345C8B = IF 4_GD_STEP      EXIT THEN \ LEA     EAX , [EAX] [ECX*4] 
  DUP 0E348B = IF 3_GD_STEP      EXIT THEN \ MOV ESI, [ESI] [ECX]
  DUP 03048D = IF 3_GD_STEP      EXIT THEN \ LEA EAX, [EBX] [EAX]
  DUP 355C89 = IF 4_GD_STEP      EXIT THEN \ MOV  EBX, [ESI+ESP-4]
  DUP 30748B = IF 4_GD_STEP      EXIT THEN \ MOV ESI, [1+ESI+EAX]
DUP 01048D = IF 3_GD_STEP      EXIT THEN \ LEA EAX, [ECX] [EAX]
  DUP 88048D = IF 3_GD_STEP      EXIT THEN \ LEA EAX , [EAX] [ECX*4] 
  DUP 02048D = IF 3_GD_STEP      EXIT THEN \ LEA EAX, [EDX] [EAX] 
  DUP 03048D = IF 3_GD_STEP      EXIT THEN \ LEA EAX, [EBX] [EAX]
  DUP 08048D = IF 3_GD_STEP      EXIT THEN \ LEA EAX, [EAX] [ECX]
  DUP 88048D = IF 3_GD_STEP      EXIT THEN \ LEA EAX , [EAX] [ECX*4] 
  DUP 06748B = IF 4_GD_STEP      EXIT THEN \ MOV ESI, 1 [ESI] [EAX]
  DUP 245C8B = IF 4_GD_STEP      EXIT THEN \ MOV EBX, 8 [ESP]
  DUP 244C8B = IF 4_GD_STEP      EXIT THEN \ MOV ECX, 8 [ESP]
  DUP 2E5C89 = IF 4_GD_STEP      EXIT THEN \ MOV  -4 [ESI] [EBP], EBX
  DUP 045C89 = IF 4_GD_STEP      EXIT THEN \ MOV  4 [ESP] [EAX], EBX
  DUP 2E74FF = IF 4_GD_STEP      EXIT THEN \ PUSH -4 [ESI] [EBP]
  DUP 3574FF = IF 4_GD_STEP      EXIT THEN \ PUSH -4 [EBP] [ESI]
  DUP 240CFF = IF 3_GD_STEP      EXIT THEN \ DEC     [ESP] 
  DUP 08B70F = IF 3_GD_STEP      EXIT THEN \ MOVZX   ECX , WORD PTR [EAX]
  DUP 09B70F = IF 3_GD_STEP      EXIT THEN \ MOVZX   ECX , WORD PTR [ECX]
  DUP 40B70F = IF 3_GD_STEP DUP C@ 1_GD_STEP EXIT THEN \ MOVZX   EAX , WORD PTR X [EAX] 
  DUP 42B60F = IF 4_GD_STEP	 EXIT THEN \ MOVZX   EAX , WORD PTR X [EDX] 
  DUP 24048B = IF 3_GD_STEP      EXIT THEN \ MOV   EAX, 0  [ESP]
  DUP 240C8B = IF 3_GD_STEP      EXIT THEN \ MOV   ECX , [ESP] 
  DUP  1048B = IF 3_GD_STEP      EXIT THEN \ MOV   EAX , [ECX] [EAX] 

  DUP 01048D = IF 3_GD_STEP      EXIT THEN \ LEA   EAX , [ECX] [EAX] 
  DUP C0BE0F = IF 3_GD_STEP      EXIT THEN \ MOV   EAX, AL 
  DUP 0045C7 = IF 3_GD_STEP .INT EXIT THEN \ MOV  0 [EBP], # 0
  DUP 240481 = IF 3_GD_STEP .INT EXIT THEN \ ADD     [ESP] , # 4 

  DUP B5348D = IF 3_GD_STEP .INT EXIT THEN \ LEA  ESI, [ESI*4]
  DUP 8D0C8D = IF 3_GD_STEP .INT EXIT THEN \ LEA  ECX, [ECX*4]
  DUP 84248D = IF 3_GD_STEP      EXIT THEN \ LEA  ESP, [ESP] [EAX*4]


  DUP 244C2B = IF 4_GD_STEP      EXIT THEN \   SUB     ECX , 4 [ESP] 
  DUP 04B60F = IF 4_GD_STEP      EXIT THEN \   MOVZX EAX, BYTE [EDI] [ESI]
  DUP 243C83 = IF 4_GD_STEP      EXIT THEN \   CMP     [ESP] , # 0 
  DUP7B?       IF 7_GD_STEP      EXIT THEN
  DUP 2404FF = IF 3_GD_STEP      EXIT THEN \ INC [ESP]
  DUP 241C8B = IF 3_GD_STEP      EXIT THEN \ MOV  EBX, [ESP]
  DUP 240403 = IF 3_GD_STEP      EXIT THEN \ ADD  EAX , [ESP] 
  DUP 87B60F = IF CR ."  movzx eax,BYTE" DROP 1+ DUP .EDI  EXIT THEN  \ MOVZX   EAX , BYTE PTR 19E3 [EDI] 
  CR H. TRUE ABORT" UNKNOWN CODE"
;

: GDIS ( A-limit A-init -- )
\   CR ." VV=" 2DUP H. H. 2DUP - .
    BEGIN 
\	H-STDOUT  1 TO H-STDOUT ." ." TO H-STDOUT
	GD-STEP  2DUP U> 0=
    UNTIL  2DROP ;
 BASE !
