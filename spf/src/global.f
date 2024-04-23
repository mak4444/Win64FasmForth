
: TYPE_N ABORT ;
: (ABORT") (ABORT") ;
\ : COMPILE, COMPILE, ;

: CUR_POS ABORT ;
: B_CR ( -- ) \ 94
\ 8fa5ॢaea4 e1e2பa8.
 10 EMIT
 13 EMIT
;

CREATE KERNELEXP
: GETPREX    ABORT ;
: GETPR      ABORT ;

: KERNEL-WORDLIST	ABORT ;

: SPP_M		ABORT ;
: TIBB_M	ABORT ;
: NTIB_M	ABORT ;
: NTIB		ABORT ;
\ : draw_window	ABORT ;
: ?KEY		ABORT ;
: LAST_KEY	ABORT ;
\ : M_KEY?	ABORT ;
\ : CC_LINES	ABORT ;

 : DR_CUR	ABORT ;
 : CL_CUR	ABORT ;

: KEY_M		ABORT ;
: OS_KEY	ABORT ;
: SYS_os_ekeyq	ABORT ;
: _BYE		ABORT ;
: MALLOC	ABORT ;
: EMIT_M	ABORT ;
: COMMAND_LINE	ABORT ;
: ?DUP	?DUP ;

\ : FREE		ABORT ;
 
\ : ROWH		ABORT ;
\ : ROWW		ABORT ;
\ : draw_window	ABORT ;
\ : MEMS		ABORT ;
\ FORWORD

\ : READ		ABORT ;
: CLIT, ABORT ;
: _PREVIOUS PREVIOUS ;
: _SHEADER  SHEADER ;
: _:  : ;
: [;] POSTPONE  ; ;
: S,	ABORT ;
: SWORD, ABORT ;
: PARSE-NAME PARSE-WORD ;
: PSLITERAL POSTPONE SLITERAL ;
: SYS_ReadConsoleInput ABORT ;
: SYS_GetNumberOfConsoleInputEvents ABORT ;
: SYS_GetStdHandle ABORT ;
: SYS_SetConsoleCursorPosition  ABORT ;
: SYS_GetConsoleScreenBufferInfo ABORT ;
: SYS_ReadFile ABORT ;
: SYS_WriteFile ABORT ;
: SYS_CreateFile ABORT ;
: SYS_SetFilePointer ABORT ;
: SYS_CloseHandle ABORT ;
: SYS_LLLL ABORT ;

: ZOPEN-FILE-SHARED ABORT ;
: ZCREATE-FILE-SHARED ABORT ;
: YDO ABORT ;
: YQDO ABORT ;
: ZUNLOOP ABORT ;
: ZLEAVE ABORT ;


: QVECT-CODE ABORT ;

: A! ! ;
: A@ @ ;
: L! ! ;
: L@ @ ;
: SL@  @ ;

' TYPE VALUE 'TYPE
' (ABORT") VALUE '(ABORT") 

VARIABLE UPPER_V

: ADD[ESP],TOS  ABORT ;
: _QCONSTANT-CODE  ABORT ;

VARIABLE NNN
