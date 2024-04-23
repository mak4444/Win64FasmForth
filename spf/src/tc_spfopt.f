\ REQUIRE INCLUDED_L ~mak/listing3.f 
\ S" _mak/djgpp/gdis.f" INCLUDED
: XLIT
  R> DUP CELL+ >R @ ;

: _VALUE-CODE  >R @ ;

: _QVALUE-CODE >R 4 + 5 + @ ;
: _QTOVALUE-CODE >R  ! ;
: ABORT<'> ABORT ;

' _QVALUE-CODE VALUE QVALUE-CODE
' _QTOVALUE-CODE VALUE QTOVALUE-CODE
' _VALUE-CODE  VALUE VALUE-CODE
' ABORT<'>  VALUE '<'>

REQUIRE GTYPE _mak/djgpp/gdis.f

0 VALUE TOUSER-VALUE-CODE
0 VALUE ---CODE

0 VALUE DO-OFF
0 VALUE ?DO-OFF

0 VALUE OFF-LOOP
0 VALUE OFF-+LOOP

0 VALUE  'DUP_V
0 VALUE 'DROP_V

' DUP TO 'DUP_V
' DROP TO 'DROP_V

:  'DUP  'DUP_V ;
: 'DROP 'DROP_V ;

: M\  POSTPONE \  ; IMMEDIATE
: OS\ POSTPONE \ ; IMMEDIATE

: [>T]  ; IMMEDIATE
:  >T   ; IMMEDIATE

TRUE VALUE J_OPT?
: TT ;

DIS-OPT
\ S" src/macroopt.f" INCLUDED
: INLINE, ABORT ; IMMEDIATE

 TRUE TO ?C-JMP
\ 0    TO ?C-JMP

: TC-COMPILE,  \ 94 CORE EXT
\ �������������: ��������� �� ����������.
\ ����������: ( xt -- )
\ �������� ��������� ���������� �����������, �������������� xt, �
\ ��������� ���������� �������� �����������.
\    CON>LIT 
\    IF  INLINE?
\      IF     INLINE,
\      ELSE
         _COMPILE,
\      THEN
\    THEN
;

: _DABS ( d -- ud ) \ 94 DOUBLE
\ ud ���������� �������� d.
  DUP 0< IF DNEGATE THEN
;



: DABS ( d -- ud ) \ 94 DOUBLE
\ ud ���������� �������� d.
  DUP 0< IF DNEGATE THEN
;

0 VALUE TSAVE_LIMIT

: TSAVE (  ADDR LEN -- )
 H-STDOUT  >R R/W  CREATE-FILE    THROW
 TO H-STDOUT
  UNIX-LINES
 CR ." MUSEROFFS EQU " USER-HERE 7 + -8 AND  RESERVE - 2 MAX .
 CR
 HERE >R
 CONTEXT @ @
 BEGIN
 CR ." AHEADER "
 DUP 1- C@ .   ." ,"
 DUP COUNT ATYPE ." ,"
 DUP COUNT GTYPE
 CR
 R> OVER NAME> \ ." ZZ=<" 2DUP H. H.
 GDIS
 DUP
[IFDEF] YDP_FL
 NAME>
[ELSE]
 NAME>C
[THEN]
\  DUP H.  ." >"
  >R
 CDR 
 DUP
[IFDEF] YDP_FL
 NAME>
[THEN]

 TSAVE_LIMIT \ ." TSL=" 2DUP H. H.
 U<
 UNTIL DROP RDROP CR
 H-STDOUT CLOSE-FILE  THROW R> TO H-STDOUT 
;

: RN> CHAR SWAP WordByAddr DROP C! ;

' CR CONSTANT '_CR

: LOOP   \ 94
  ?COMP 
  0x24 0x4FF W, C, \ inc dword [esp]
  HERE 2+ - DUP SHORT?   SetOP SetJP
  IF
    0x71 C, C, \ jno short 
  ELSE
    4 - 0xF C, 0x81 C, , \ jno near
  THEN    SetOP
  0x48 C, 0x1824648D , \ lea 0x18(%rsp),%rsp
  DP @ SWAP !
; IMMEDIATE

: XDO
[
 0xBA C, 0x80000000 , 
 0x2B C, 0x55 C, 0x0 C, 
 0x8D C, 0x1C C, 0x2 C, 
 0x8B C, 0x45 C, 0x4 C,
 0x48 C, 0x8D C, 0x6D C, 0x8 C,
 ]
 ;

: DO
 ['] XDO _COMPILE, 
   0x68 C, DP @ 4 ALLOT
   0x52 C,    \ PUSH EDX
   0x53 C,    \ PUSH EBX
  4 ALIGN-NOP
  DP @ \ DUP TO :-SET
; IMMEDIATE

: ?DO 
  ?COMP 

  0x48 C, 0x8D C, 0x6D C, 16 C,  \  lea    0x8*2(%rbp),%rbp
  0xBB C, HERE 4 ALLOT			\  mov        ,%ebx
  
  0x3B C, 0x45 C, -16 C,       \  cmp    -0x8(%rbp),%eax  

  0x75 C, 0x5 C,				\ jne
  0x8B C, 0x45 C, -8 C,       \ mov    -0x4(%rbp),%eax
  0xFF C, 0xE3 C,				\ jmpq   *%rbx
  0x53 C,						\ push   %rbx
  0xBB C,  0x80000000 ,         \ mov    $0x80000000,%ebx 
  0x2B C, 0x5D C, -16 C,       \ sub    -0x8(%rbp),%ebx
  0x53 C,						\ push   %rbx
  0x3 C, 0xD8 C, 				\ add    %eax,%ebx
  0x53 C,						\ push   %rbx
   0x48 C,  0x8B C, 0x45 C, -8 C, 		\ mov    -0x4(%rbp),%rax
  
  DP @ \ DUP TO :-SET
; IMMEDIATE

: ?PAIRS        \ x1 x1 --
  XOR IF -22 THROW THEN ;

3 CONSTANT DO_FLAG1

: L, , ;
: Q,  , 0 , ;

: DO            \ Run: n1|u1 n2|u2 -- ; R: -- loop-sys           6.1.1240
\ *G Begin a *\fo{DO ... LOOP} construct. Takes the end-value and
\ ** start-value from the stack.
 ['] YDO _COMPILE,  HERE 0 Q, HERE DO_FLAG1
; IMMEDIATE

: ?DO           \ Run: n1|u1 n2|u2 -- ; R: -- | loop-sys ; 6.2.0620
\ *G Compile a *\fo{DO} which will only begin loop execution if
\ ** the loop parameters do not specify an interation count of 0.
 ['] YQDO _COMPILE, HERE 0 Q, HERE DO_FLAG1
; IMMEDIATE

: LOOP          \ Run: -- ; R: loop-sys1 -- | loop-sys2         6.1.1800
\ *G The closing statement of a *\fo{DO ... LOOP} construct.
\ ** Increments the index and terminates when the index crosses
\ ** the limit.
  DO_FLAG1 ?PAIRS
 0x49 C, 0xC6FF W, \ inc r14
 0x49 C, 0xC7FF W, \ inc r15
  HERE 2+ -  DUP SHORT? \  SetOP SetJP
  IF
    0x71 C, C, \ jno short 
  ELSE
    4 - 0xF C, 0x81 C, L, \ jno near
  THEN  \ SetOP
  0x5E41 W, \ pop r14
  0x5F41 W, \ pop r15
  0x59 C, \ pop rcx
  HERE SWAP !
 ; IMMEDIATE

: +LOOP         \ Run: n -- ; R: loop-sys1 -- | loop-sys2       6.1.0140
\ *G As *\fo{LOOP} except that you specify the increment on the
\ ** stack. The action of *\fo{n +LOOP} is peculiar when n is
\ ** negative:
\ *C   -1 0 ?DO  i .  -1 +LOOP
\ *P prints *\fo{0 -1}, whereas:
\ *C   0 0 ?DO  i .  -1 +LOOP
\ *P prints nothing. This a result of the mathematical trick used
\ ** to detect the terminating condition. To prevent confusion
\ ** avoid using *\fo{n +LOOP} with negative *\i{n}.
  DO_FLAG1 ?PAIRS
	0x49 C, 0xC601 W, OPT	\   	add    %rax,%r14
	0x49 C, 0xC701 W, OPT	\	add    %rax,%r15
     	['] DROP _COMPILE,
  HERE 2+ -  DUP SHORT? \  SetOP SetJP
  IF
    0x71 C, C, \ jno short 
  ELSE
    4 - 0xF C, 0x81 C, L, \ jno near
  THEN  \ SetOP
  0x5E41 W, \ pop r14
  0x5F41 W, \ pop r15
  0x59 C, \ pop rcx
  HERE SWAP !
 ; IMMEDIATE

: I   \ 94
  R> 2R@  - SWAP >R ;

: 2RDROP
 0x48 C, 0x83 C, 0xC4 C, 0x10 C, \	add    $0x10,%rsp
;   IMMEDIATE

: UNLOOP
  0x48 C, 0x1824648D , \ lea 0x18(%rsp),%rsp
; IMMEDIATE

: LEAVE    \ 94
  0x48 C, 0x1024648D , \ lea esp, 0x10 [esp]
  0xC3 C,  \ ret
; IMMEDIATE

: RDROP
  0x48 C, 0x83 C, 0xC4 C, 0x8 C, \ add $0x8,%rsp
; IMMEDIATE

: MDUMP DUMP ;

 0xE9 ' COMPILE, C! 
 ' TC-COMPILE, ' COMPILE, - 5 -  ' COMPILE, 1+ !
 
 : ['] ' LIT, ; IMMEDIATE


:  QBRANCH
 [ 0xC00B W, ] 
  DROP  ;

: M?BRANCH, ( ADDR -> )
\ ?BRANCH, EXIT
\ ABORT
  ['] QBRANCH _COMPILE,
  0x84 \ TO J_COD
  0x0F     \  ����� �� JX
  C, C,
  DUP IF DP @ CELL+ - THEN , \ DP @ TO LAST-HERE
;

: IF 
  ?COMP DP @ M?BRANCH, >MARK 1
; IMMEDIATE

: UNTIL \ 94
  ?COMP 3 <> IF -2004 THROW THEN \ ABORT" UNTIL ��� BEGIN !"
  M?BRANCH,
  0xFFFFFF80  DP @ 4 - @  U<
  IF  DP @ 5 - W@ 0x3F0 + DP @ 6 - W!   -4 ALLOT
  THEN
; IMMEDIATE


: WHILE
  ?COMP [COMPILE] IF
  2SWAP
; IMMEDIATE

: USER ( "<spaces>name" -- ) \ ......... .......... ......
 CR ."  USER="  SOURCE TYPE CR
  USER-OFFS @ 7 + -8 AND  USER-OFFS !
  USER-CREATE
  8 USER-ALLOT
;

: USER.. ( "<spaces>name" -- ) \ ......... .......... ......
 CR ."  USER..="
  USER-OFFS @ DUP H. 7 + -8 AND  DUP H. USER-OFFS !
  KEY DROP
  USER-CREATE
  8 USER-ALLOT
;

: USER-VALUE ( "<spaces>name" -- ) \ 94 CORE EXT
  USER-OFFS @ 7 + -8 AND  USER-OFFS !
USER-VALUE
  4 USER-ALLOT
;

: VARIABLE  VARIABLE 0 , ;



: VALUE 
  HEADER  QVALUE-CODE 
  COMPILE, 0 L,
  QTOVALUE-CODE COMPILE, Q, ;

: >R  R> SWAP >R >R ;
: R>  R> R> SWAP >R ;  

\ : RDROP   R> R> DROP >R ;  

: EXECUTE >R ;

: CREATED ( addr u -- )
  SHEADER
 HERE LAST-CFA @ !
  HERE DOES>A ! ( для DOES )
  ['] _CREATE-CODE COMPILE,
;

: CREATE ( "<spaces>name" -- ) \ 94
   PARSE-NAME CREATED
;

: VARIABLE ( "<spaces>name" -- ) \ 94
  CREATE  0 , ;

\ EOF  

: >R  R> SWAP >R >R ;
: R>  R> R> SWAP >R ;  

: XLIT, ( N -- )
  ['] XLIT _COMPILE, , ;


  0xE9 ' LIT, C! 
  ' XLIT, ' LIT, - 5 -  ' LIT, 1+ !
