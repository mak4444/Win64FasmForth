( Слова немедленного выполнения, используемые при компиляции
  циклов в теле высокоуровневого определения.
  ОС-независимые определения.
  Copyright [C] 1992-1999 A.Cherezov ac@forth.org
  Преобразование из 16-разрядного в 32-разрядный код - 1995-96гг
  Ревизия - сентябрь 1999
)

: DO            \ Run: n1|u1 n2|u2 -- ; R: -- loop-sys           6.1.1240
\ *G Begin a *\fo{DO ... LOOP} construct. Takes the end-value and
\ ** start-value from the stack.
  <'> YDO _COMPILE, HERE 0 Q, HERE 3
; IMMEDIATE

: ?DO           \ Run: n1|u1 n2|u2 -- ; R: -- | loop-sys ; 6.2.0620
\ *G Compile a *\fo{DO} which will only begin loop execution if
\ ** the loop parameters do not specify an interation count of 0.
  <'> YQDO _COMPILE, HERE 0 Q, HERE 3
; IMMEDIATE

: LOOP          \ Run: -- ; R: loop-sys1 -- | loop-sys2         6.1.1800
\ *G The closing statement of a *\fo{DO ... LOOP} construct.
\ ** Increments the index and terminates when the index crosses
\ ** the limit.
  3 ?PAIRS
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
  3 ?PAIRS
	0x49 C, 0xC601 W,	\   	add    %rax,%r14
	0x49 C, 0xC701 W,	\	add    %rax,%r15
	<'> DROP _COMPILE,
  HERE 2+ -  DUP SHORT? \  SetOP SetJP
  IF
    0x71 C, C, \ jno short 
  ELSE
    4 - 0xF C, 0x81 C, L, \ jno near
  THEN
  0x5E41 W, \ pop r14
  0x5F41 W, \ pop r15
  0x59 C, \ pop rcx
  HERE SWAP !
 ; IMMEDIATE

: I  <'> DUP  _COMPILE,
  0x4C C, 0xF089 W,	\	mov %r14,%rax
; IMMEDIATE

DECIMAL
