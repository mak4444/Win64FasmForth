\ Andrey Filatkin, af@forth.org.ru
\ Mihail Maksimov, forth@inbox.ru

 REQUIRE DBG_INCLUDED lib\include\spf_navigator.f 

 REQUIRE OFD_STR ~mak\fdialog.4 

\ lib\win\const.f

REQUIRE [UNDEFINED] lib\include\tools.f
REQUIRE { ~mak\locals.f
REQUIRE CASE ~mak\case.f
\- #define : #define  HEADER  CONSTANT-CODE COMPILE,  0 PARSE EVALUATE , ; 
REQUIRE cmdBYE samples\WIN\SPFWC\define.h 
REQUIRE $! ~mak\place.f

REQUIRE CASE-INS lib\ext\caseins.f
REQUIRE FILE-SIZE ~mak/lib/ftools.4 

samples\WIN\EDIT\EDAPI.F 

: FileDLG    OFD_STR GetOpenFileNameA DROP  LPSTRFILE ASCIIZ> ;

\- IMAGE-BASE 0 GetModuleHandleA CONSTANT IMAGE-BASE

\- Z" : Z" POSTPONE S"  POSTPONE DROP  ; IMMEDIATE

[IFNDEF] :NONAME
: :NONAME ( C: -- colon-sys ) ( S: -- xt ) \ 94 CORE EXT
  LATEST ?DUP IF 1+ C@ C-SMUDGE C! SMUDGE THEN
  HERE DUP TO LAST-NON [COMPILE] ]
;
[THEN]


0 VALUE ZZFF
1 VALUE ZFFF

CASE-INS @
CASE-INS OFF

TlsIndex@ VALUE OPER_E

CREATE VVV 0x100 ALLOT

0
4 FIELD .cpMin
4 FIELD .cpMax
4 FIELD .lpBuffer

CONSTANT FINDTEXT

CREATE FTTT FINDTEXT ALLOT 

CREATE TABBBB  9 C, 0 C,
CREATE BLBBBB BL C, 0 C,
CREATE CRBBBB 0xD C, 0 C,
VARIABLE VXY CELL ALLOT

: XXFND OPER_E TlsIndex! VVV COUNT CR ." X="  SFIND 0=   DUP .  ;

[UNDEFINED] 2RDROP
[IF] : 2RDROP POSTPONE RDROP  POSTPONE RDROP  ; IMMEDIATE
[THEN]

[UNDEFINED] USEARCH
[IF]
: USEARCH ( c-addr1 u1 c-addr2 u2 -- c-addr3 u3 flag )
\  df102002\src\compiler\df_def_proc.f
\ \ gforth\extend.fs 
    2>R 2DUP
    BEGIN
      DUP 1+ R@ > \ 
    WHILE
      OVER 2R@ TUCK CEQUAL-U 0=
      IF 2RDROP 2SWAP 2DROP TRUE EXIT THEN
      1- SWAP 1+ SWAP
    REPEAT 2RDROP 2DROP 0
;
[THEN]

[UNDEFINED] /STRING
[IF] : /STRING DUP >R - SWAP R> + SWAP ;
[THEN]

\ WINAPI: SetWindowTextA       USER32.DLL

0x1001 CONSTANT cmdTst
0x1002 CONSTANT cmdRestore
0x1003 CONSTANT cmdGOTO
0x1004 CONSTANT cmdFORTH
0x1005 CONSTANT cmdABORT
0x1006 CONSTANT cmdFIND
0x1007 CONSTANT cmdHEX
0x1008 CONSTANT cmdDEC
0x1009 CONSTANT cmdDBG

#define cmdSave cmdDbgInclude
#define cmdSaveAs cmdRunScript

0 VALUE E?R/O

1 4 LSHIFT CONSTANT MAX#ED_FN

0 VALUE #ED_FN

CREATE EDIT_FN_B 0x101	 MAX#ED_FN * ALLOT
CREATE EDIT_SL_B 2 CELLS MAX#ED_FN * ALLOT

: EDIT_FN  EDIT_FN_B #ED_FN 200	    * + ;
: EDIT_SL  EDIT_SL_B #ED_FN 2 CELLS * + ;

: EDIT_FN!  ( ADDR LEN -- )
    EDIT_FN $!
    EDIT_FN COUNT + 0! ;

VARIABLE EDIT_XY  0 ,

: EDIT_XY!  EDIT_XY 2! ;

TRUE VALUE EDIT-END
TRUE VALUE ED_WATE
0 VALUE EdHWnd
 0 VALUE EMyhwnd

: SendToEd ( lParam wParam Msg -- u )
\ EdHWnd MSendMessageA
  EdHWnd SWAP 2SWAP SWAP  SendMessageA
 ;


:  EDIT_SEL    (  bb ee -- )
   EM_SETSEL     SendToEd DROP
   0 0 EM_SCROLLCARET   SendToEd DROP
;

:  EDIT_SELEDIT_SEL    (  bb ee -- )
   EM_SETSEL     SendToEd DROP
   0 0 EM_SCROLLCARET   SendToEd DROP
;


: EDIT_SEL_GET { \ bb ee -- bb ee }
   ^ bb ^ ee  EM_GETSEL  SendToEd DROP
   bb ee
;

(
VARIABLE SELBUF CELL ALLOT

: EDIT_SEL_GET { \ bb ee -- bb ee }

    SELBUF  0 EM_EXGETSEL SendToEd DROP
    SELBUF  2@
   ;
)

: NEXT_F EDIT_SEL_GET EDIT_SL 2!
         #ED_FN 1+ MAX#ED_FN 1- AND TO #ED_FN ;
: LAST_F #ED_FN 1- MAX#ED_FN 1- AND TO #ED_FN ;

: PUSH-WINDOW ( hwnd -- prev-hwnd)
    DUP SetActiveWindow >R
    DUP SetFocus DROP
    DUP SetForegroundWindow DROP
        BringWindowToTop DROP
    R>
;

:  EDIT_SCROLL  { yy -- }
   0   yy 6 +
      0 0 EM_GETLINECOUNT SendToEd 1-  MIN
   EM_LINEINDEX   SendToEd DUP
   EDIT_SEL
;


: EDIT_XY_SET { xx yy -- }
   yy  EDIT_SCROLL
   0  yy  EM_LINEINDEX   SendToEd xx + DUP
   EM_SETSEL       SendToEd DROP
   0 0 EM_SCROLLCARET   SendToEd DROP
    EdHWnd PUSH-WINDOW DROP
;

: EDIT_Y_SET { yy -- }
   yy  EDIT_SCROLL
   0  yy    EM_LINEINDEX   SendToEd
   0  yy 1+ EM_LINEINDEX   SendToEd
   EM_SETSEL       SendToEd DROP
   EMyhwnd PUSH-WINDOW DROP
;

: EDIT_Y_GET
  0 -1 EM_LINEFROMCHAR SendToEd
;

\ 0 VALUE CCCC
0 VALUE Content
0 VALUE SizeEd

: EDLoad  ( -- )
 CR ." EDLoad=" 
 {  \  fid -- }
    EDIT_FN COUNT  2DUP TYPE
    R/O OPEN-FILE-SHARED 0= IF \ ." FILE OK"
    DUP TO fid
    FILE-SIZE THROW DROP ?DUP IF
\      DUP 0xE1AA U> TO E?R/O
\      0xE1AA UMIN
      1+ DUP TO SizeEd
      ALLOCATE THROW DUP TO Content
      SizeEd 1-  fid READ-FILE 2DROP
      EdHWnd WM_SETTEXT 0 Content SendMessageA DROP
\ [UAD@] Content >R 0 >R WM_SETTEXT >R  EdHWnd DUP>R  RSendMessageA DROP [UAD!]
   0 0 WM_GETTEXTLENGTH SendToEd DROP
   0 0 WM_SETCURSOR     SendToEd DROP

    EMyhwnd  EDIT_FN 1+ SetWindowTextA DROP

      Content FREE THROW
    THEN
    fid CLOSE-FILE THROW
  ELSE ." FILE ERROR"
    DROP
  THEN
;

: EDIT_Load  ( -- )
 {  \  fid -- }
    EDIT_FN COUNT
    R/O OPEN-FILE-SHARED 0= IF \ ." FILE OK"
    DUP TO fid


    FILE-SIZE DROP ( THROW) DROP ?DUP IF
\      DUP 0xE1AA U> TO E?R/O
\      0xE1AA UMIN
      1+ DUP TO SizeEd
      ALLOCATE THROW DUP TO Content
      SizeEd 1-  fid READ-FILE 2DROP
      EdHWnd WM_SETTEXT 0  Content SendMessageA DROP
\ [UAD@] Content >R 0 >R WM_SETTEXT >R  EdHWnd DUP>R  RSendMessageA DROP [UAD!]
   0 0 WM_GETTEXTLENGTH SendToEd DROP
   0 0 WM_SETCURSOR     SendToEd DROP

    EMyhwnd EDIT_FN 1+  SetWindowTextA DROP

      Content FREE DROP \ THROW
    THEN
    fid CLOSE-FILE DROP \ THROW
  ELSE \ ." FILE ERROR"
    DROP
  THEN
;

VECT F4_EDIT   ' NOOP TO F4_EDIT
VECT F6_EDIT   ' NOOP TO F6_EDIT
VECT F7_EDIT   ' NOOP TO F7_EDIT
VECT F8_EDIT   ' NOOP TO F8_EDIT
VECT F9_EDIT   ' NOOP TO F9_EDIT

0x00000001  CONSTANT FR_DOWN
0x00000004  CONSTANT FR_MATCHCASE
0x00010000  CONSTANT FR_HIDEWHOLEWORD

CREATE FindBuffer 0 C, 0x20 ALLOT

0 VALUE FindOwner
0 VALUE FdFlags

CREATE FindStruct

  0x28 ,                 \ Size
  HERE TO FindOwner
   0  ,                  \ Owner
   0  ,                  \ Instance
  HERE TO FdFlags
 FR_HIDEWHOLEWORD FR_DOWN + ,    \ Flags

  FindBuffer ,            \ FindWhat
   0 ,                    \ ReplaceWith
  0x20 ,                  \ Find Len & Repl Len
   0 ,
   0 ,
   0 ,

0 VALUE EdWndProc


MODULE: GUI-EDIT \ -------------------------------------------

[UNDEFINED] /MSG
[IF]

0
8 -- MSG.hwnd
4 -- MSG.message
8 -- MSG.wParam
8 -- MSG.lParam
4 -- MSG.time
8 -- MSG.pt
4 -- MSG.ex
CONSTANT /MSG
[THEN]

[UNDEFINED] /LOGFONT
[IF]

0
  4 --  lfHeight
  4 --  lfWidth
  4 --  lfEscapement
  4 --  lfOrientation
  4 --  lfWeight
  1 --  lfItalic
  1 --  lfUnderline
  1 --  lfStrikeOut
  1 --  lfCharSet
  1 --  lfOutPrecision
  1 --  lfClipPrecision
  1 --  lfQuality
  1 --  lfPitchAndFamily
 48 --  lfFaceName
CONSTANT  /LOGFONT
[THEN]

[UNDEFINED] /WNDCLASS
[IF]

0
4 -- .cbSize
4 -- .style
8 -- .lpfnWndProc
4 -- .cbClsExtra
4 -- .cbWndExtra
8 -- .hInstance
8 -- .hIcon
8 -- .hCursor
8 -- .hbrBackground
8 -- .lpszMenuName
8 -- .lpszClassName
8 -- .hIconSm
CONSTANT /WNDCLASS
[THEN]

DECIMAL
 TRUE VALUE JetOut
\- EdWndProc 0 VALUE EdWndProc
 0 VALUE StatusHwnd
\- MainMenu  0 VALUE MainMenu
 0 VALUE JetBuf
 0 VALUE *JetBuf
TRUE VALUE ?in
 0 VALUE hFont
-18 VALUE console_font_height
 0  VALUE console_font_width  \ 0-proportional to console_font_height
 0x64 CONSTANT OBSIZE
0x100 VALUE    MAXLIN
 0 VALUE tib
 0 VALUE >in
 0 VALUE KEY_EVENT_GUI       \ event 
 0 VALUE LastKey

  0 VALUE LruBuf              \ 
  8 VALUE LruNum              \ 
255 VALUE LruLen              \ 

VARIABLE  CurrFromLru

CREATE MSG1  /MSG ALLOT
CREATE logfont  /LOGFONT ALLOT

204 logfont lfCharSet C!          \ RUSSIAN_CHARSET
console_font_height ( -14) logfont lfHeight !
console_font_width  ( -10) logfont lfWidth  !

: LOWORD ( lpar -- loword ) 0x0FFFF AND ;
: HIWORD ( lpar -- hiword ) 0x10000 /  ;

: 0SendToEd ( Msg -- )
  EdHWnd SWAP  0 0  SendMessageA DROP  ;

: EDIT_Save  ( <filename> -- )
  { fna fnl \  fid  -- }
  E?R/O IF 0  S" EDIT" DROP  S" The file is saveless" DROP
	MB_OK \ MB_ICONSTOP OR MB_SYSTEMMODAL OR
  MessageBoxA DROP
 EXIT THEN
  \ 
  0 0 WM_GETTEXTLENGTH SendToEd 1+ DUP TO SizeEd

  ALLOCATE THROW DUP TO Content
  SizeEd WM_GETTEXT SendToEd DROP
  \ 
   fna fnl W/O CREATE-FILE THROW TO fid
  \ 
  Content SizeEd 1- fid WRITE-FILE THROW
  \ 
  Content FREE THROW
  fid CLOSE-FILE THROW
  0 0 EM_SETMODIFY SendToEd DROP
 ;

VARIABLE FindHWND

: ?SaveCng
       0 0 EM_GETMODIFY SendToEd 0=
       IF IDNO EXIT THEN
       EdHWnd
       Z" Text was modified. Save changes?"
       Z" Warning"
       MB_YESNOCANCEL
       LANG_ENGLISH
       MessageBoxExA
;

: ?LoadDo  ( addr len -- )
    ?SaveCng
    DUP IDYES =
    IF  EDIT_FN COUNT ['] EDIT_Save CATCH DROP \ ." S=" .
    THEN
    IDCANCEL <>
    IF NEXT_F EDIT_FN! EDIT_Load
    ELSE 2DROP
    THEN
;

: DoCommand
 CR ." DoCommand=" DUP H.  DUP .
    CASE
      cmdInclude  OF  FileDLG	DUP
                        IF	?LoadDo
                        ELSE	2DROP
                        THEN
                  ENDOF

      cmdSaveAs   OF   FileDLG
	DUP
                        IF   EDIT_Save
                        ELSE 2DROP
                        THEN
                  ENDOF

      cmdSave     OF   EDIT_FN COUNT ['] EDIT_Save CATCH DROP \ ." S=" .
                  ENDOF

      cmdRestore  OF   EDIT_Load
                  ENDOF

      cmdBYE      OF
 0 0 WM_CLOSE   EMyhwnd SendMessageA DROP
\ 0 >R 0 >R WM_CLOSE >R  EdHWnd DUP>R  RSendMessageA DROP

                  ENDOF
      cmdCUT      OF WM_CUT   0SendToEd ENDOF
      cmdCOPY     OF WM_COPY  0SendToEd ENDOF
      cmdPASTE    OF WM_PASTE 0SendToEd ENDOF
      cmdFIND     OF FindStruct FindTextA  FindHWND ! ENDOF

        cmdGOTO   OF F4_EDIT cmdDBG TO ED_WATE  ENDOF
        cmdOUT    OF F6_EDIT cmdDBG TO ED_WATE  ENDOF
        cmdSTEP   OF F7_EDIT cmdDBG TO ED_WATE  ENDOF
        cmdOVER   OF F8_EDIT cmdDBG TO ED_WATE  ENDOF
        cmdGO     OF F9_EDIT cmdDBG TO ED_WATE  ENDOF
        cmdFORTH  OF     cmdFORTH   TO ED_WATE  ENDOF
        cmdABORT  OF     cmdABORT   TO ED_WATE  ENDOF
        cmdHEX    OF     cmdHEX     TO ED_WATE  ENDOF
        cmdDEC    OF     cmdDEC     TO ED_WATE  ENDOF

      cmdTst      OF ENDOF
    ENDCASE
;

: LastLineChange ( addr -- )
   0    0 EM_GETLINECOUNT EdHWnd SendMessageA 1-
   0 SWAP EM_LINEINDEX    EdHWnd SendMessageA DUP
   0 SWAP EM_LINELENGTH   EdHWnd SendMessageA
   OVER + SWAP EM_SETSEL  EdHWnd SendMessageA DROP
       0  EM_REPLACESEL   EdHWnd SendMessageA DROP
\   0 >R 0 >R	EM_GETLINECOUNT	>R EdHWnd DUP>R RSendMessageA 1-
\   0 >R   >R	EM_LINEINDEX   	>R EdHWnd DUP>R RSendMessageA DUP
\   0 >R   >R	EM_LINELENGTH  	>R EdHWnd DUP>R RSendMessageA
\   OVER + >R >R EM_SETSEL 	>R EdHWnd DUP>R RSendMessageA DROP
\    >R  0 >R	EM_REPLACESEL  	>R EdHWnd DUP>R RSendMessageA DROP
 ;

 10000000 ALLOCATE THROW TO Content 

Content 44 DUMP

\ EM_GETSELTEXT

: FIND_DO_F11

  0 0 WM_GETTEXTLENGTH SendToEd 1+ TO SizeEd

  EDIT_SEL_GET 2>R

  R@   FTTT .cpMin !
\  SizeEd
  0 FTTT .cpMax !

  BLBBBB FTTT .lpBuffer !
  FTTT 0 EM_FINDTEXT SendToEd

  CRBBBB FTTT .lpBuffer !
  FTTT 0 EM_FINDTEXT SendToEd UMAX

 1+ DUP 30 +
    EDIT_SEL
 
  VVV 1+ 0 EM_GETSELTEXT SendToEd DROP

  VVV 1+
  BEGIN   DUP C@  BL >
  WHILE 1+
  REPEAT
  VVV 1+ - VVV C!
 
  2R> EDIT_SEL

  TlsIndex@ >R 
\  2DROP S" HEX" 
  XXFND
  R> TlsIndex!
  IF -321 THROW THEN (  -? )
  NEAR_NFA DROP ?DUP  DUP .
  IF 9 - DUP @ COUNT
 ?LoadDo CELL- @ 0 SWAP
 EDIT_XY_SET
  THEN

\  Content FREE THROW
;


    444 FTTT .cpMin !
     0 FTTT .cpMax !

: FIND_DO1
  EdHWnd SetFocus DROP
  FindBuffer  FTTT .lpBuffer !
  EDIT_SEL_GET MAX  FTTT .cpMin !
      -1 FTTT .cpMax !

    FTTT  ZFFF EM_FINDTEXT SendToEd TO ZZFF
   ZZFF 0 >
  IF   ZZFF DUP FindBuffer ASCIIZ> NIP +  EDIT_SEL
  THEN
;


\ *\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\***
\ **\\\\\ 
\ ***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*

 S" EDIT.LOG" W/O CREATE-FILE-SHARED THROW CONSTANT EDIT.LOG

:NONAME   { lpar wpar msg hwnd -- }

   H-STDOUT >R  EDIT.LOG TO H-STDOUT

  CR ." M=" HEX lpar . wpar . msg . hwnd .

 msg 0x100 =  \ VK_DOWN =
 IF
    wpar CASE
        VK_F2  OF  EDIT_FN COUNT ['] EDIT_Save CATCH DROP \ ." S=" .
               ENDOF
        VK_F3  OF ['] FIND_DO1 CATCH DROP	ENDOF
        VK_F4  OF F4_EDIT  cmdDBG TO ED_WATE	ENDOF
        VK_F6  OF F6_EDIT  cmdDBG TO ED_WATE	ENDOF
        VK_F7  OF F7_EDIT  cmdDBG TO ED_WATE	ENDOF
        VK_F8  OF F8_EDIT  cmdDBG TO ED_WATE	ENDOF
        VK_F9  OF F9_EDIT  cmdDBG TO ED_WATE	ENDOF
        VK_F11 OF ['] FIND_DO_F11 CATCH DROP	ENDOF
        VK_F12 OF CR ." VK_F12"  LAST_F EDIT_Load  EDIT_SL 2@ EDIT_SEL ENDOF
        ENDCASE
 THEN
 msg 0x112 =
 IF   \     [CHAR] #   GUI-CONSOLE::conemit GUI-CONSOLE::FlushJetBuf
    wpar CASE
        0xF100  OF WM_UNDO  0SendToEd  ENDOF
        ENDCASE
 THEN

 msg 0xFF00 AND 0xC000 =  IF ['] FIND_DO1 CATCH DROP   THEN

lpar wpar msg hwnd EdWndProc CallWindowProcA

 R>   TO H-STDOUT

;

WNDPROC: MyEdWndProc

IMAGE-BASE CONSTANT HINST  \ Instance 

  3 CONSTANT EdID

:NONAME { upp  hwnd msg  wpar lpar  \ hdc hout -- } 

 DECIMAL
       H-STDOUT TO hout  EDIT.LOG TO H-STDOUT

 CR ." P=" hwnd H. msg H. wpar H. lpar H.
 msg CASE 

   WM_CREATE OF

 WS_EX_CLIENTEDGE
 Z" EDIT" 
\ Z" RichEdit20a"

 0 
 WS_CHILD  WS_VISIBLE OR
 WS_HSCROLL OR WS_VSCROLL OR 
 ES_AUTOHSCROLL OR ES_AUTOVSCROLL OR
 ES_MULTILINE OR
     0  0  0  0   hwnd  EdID  HINST 0
 CreateWindowExA
 DUP FindOwner !
 TO EdHWnd

      EdHWnd UpdateWindow

 CR ." UpdateWindow=" DUP H.   EdHWnd H.
  DROP
      EdHWnd SW_SHOW ShowWindow  DROP
(
      EdHWnd  1 11 LSHIFT \ IDC_EDT1
 GetDlgItem DUP H.
\	EdHWnd
 GWLP_WNDPROC ['] MyEdWndProc 
\	SetWindowLongA
	SetWindowLongPtrA
 CR ." SetWindowLongPtrA=" DUP H.
 DUP 0=
 IF GetLastError  H. THEN
 TO EdWndProc
)
      hwnd GetDC -> hdc
      logfont CreateFontIndirectA TO hFont
      EdHWnd WM_SETFONT hFont 1  SendMessageA DROP
\ [UAD@]   1 >R hFont >R WM_SETFONT >R EdHWnd DUP>R RSendMessageA DROP [UAD!]
	EdHWnd EM_EXLIMITTEXT 0 100000000
	SendMessageA  DROP

      hwnd hdc ReleaseDC DROP

      0
   ENDOF \ 1
(
   WM_CREATE \ 99999999 +
   OF WS_EX_CLIENTEDGE Z" EDIT"
	0  WS_VISIBLE  WS_CHILD OR WS_HSCROLL OR WS_VSCROLL OR 
	ES_AUTOHSCROLL OR ES_AUTOVSCROLL OR ES_MULTILINE OR
	     0  0  0  0   hwnd  EdID  HINST 0 CreateWindowExA
	DUP FindOwner !
	TO EdHWnd
   ENDOF \ 1
)

   WM_SIZE OF
       EdHWnd
       0 0
       lpar LOWORD
       lpar HIWORD
       1
       MoveWindow DROP
    \   EMyhwnd UpdateWindow  DROP
      0
   ENDOF    \ 2  

   WM_SETFOCUS OF
      EdHWnd SetFocus DROP
      0
   ENDOF   \ 3

   WM_COMMAND  OF
      wpar DoCommand
      0
   ENDOF


    DUP WM_DESTROY = IF TRUE TO EDIT-END TRUE TO ED_WATE THEN
(
    DUP WM_CLOSE = IF   
                            ?SaveCng
                            DUP IDYES =
                            IF  EDIT_FN COUNT ['] EDIT_Save CATCH DROP \ ." S=" .
                            THEN
                            IDCANCEL =
                            IF  DROP  hout TO H-STDOUT  EXIT
                            THEN
 )
\   EDIT_FN COUNT ['] EDIT_Save CATCH DROP \ ." S=" .

                   THEN
 hwnd  msg wpar lpar DefWindowProcA
     \ need for swap with case parameter
     \ and defwinproc parameter
  SWAP
 ENDCASE



 hout TO H-STDOUT
  upp TlsIndex!
\ RDROP \ R>  TlsIndex!
;

WNDPROC: EditWndProc2

CREATE MSG  28 ALLOT

: MessageLoop
  BEGIN

   MSG1 0 0 0  GetMessageA

  WHILE

    MSG1 TranslateMessage DROP
    MSG1 DispatchMessageA DROP

  REPEAT
;

: CreateMainMenu ( -- hmenu )
  CreatePopupMenu >R
 R@ MF_STRING cmdInclude	Z" &Open"	AppendMenuA DROP \  APPENDM DROP
 R@ MF_STRING cmdSave		Z" &Save\tF2"	AppendMenuA DROP
 R@ MF_STRING cmdSaveAs		Z" Save &As"	AppendMenuA DROP
 R@ MF_STRING cmdRestore	Z" &Restore"	AppendMenuA DROP
 R@ MF_STRING cmdBYE		Z" E&xit"	AppendMenuA DROP

    R>  CreateMenu  DUP >R  MF_POPUP  ROT Z" &File" AppendMenuA DROP

  CreatePopupMenu >R

 R@ MF_STRING cmdCUT	Z" C&ut"	AppendMenuA DROP
 R@ MF_STRING cmdCOPY	Z" &Copy"	AppendMenuA DROP
 R@ MF_STRING cmdPASTE	Z" &Paste"	AppendMenuA DROP

	R> R@  MF_POPUP ROT	Z" &Edit"	AppendMenuA DROP
 
  CreatePopupMenu >R
 R@ MF_STRING cmdGO	Z" &Go\tF9"	AppendMenuA DROP
 R@ MF_STRING cmdSTEP	Z" S&tep\tF7"	AppendMenuA DROP
 R@ MF_STRING cmdOVER	Z" &Over\tF8"	AppendMenuA DROP
 R@ MF_STRING cmdGOTO	Z" Go&to\tF4"	AppendMenuA DROP
 R@ MF_STRING cmdOUT	Z" O&ut\tF6"	AppendMenuA DROP
 R@ MF_STRING cmdFORTH	Z" &Forth"	AppendMenuA DROP
 R@ MF_STRING cmdABORT	Z" &Abort"	AppendMenuA DROP
 R@ MF_STRING cmdHEX	Z" &HEX"	AppendMenuA DROP
 R@ MF_STRING cmdDEC	Z" &DECIMAL"	AppendMenuA DROP

	R> R@  MF_POPUP ROT	Z" &Debug"	AppendMenuA  DROP

 R@ MF_STRING cmdFIND	Z" &Search"	AppendMenuA DROP
 R@ MF_STRING cmdTst	Z" &Tst"	AppendMenuA DROP


\      R@  1 2 LSHIFT \ IDC_EDT1
\ GetDlgItem DUP H.
\	EdHWnd
\ GWLP_WNDPROC ['] MyEdWndProc 
\	SetWindowLongA
\	R@ SetWindowLongPtrA
\ CR ." SetWindowLongPtrA=" DUP H.
\ DUP 0=
\ IF GetLastError  H. THEN
\ TO EdWndProc


 R>
;

EXPORT \ ---------------------------------------

\- EditClassName :  EditClassName   S" SP-FORTH EDIT" DROP ;



: EditRegisterClass
 \ fill the class structure

 HERE   /WNDCLASS ALLOT

    /WNDCLASS			OVER .cbSize        L!
    CS_HREDRAW CS_VREDRAW OR    OVER .style         L!
    ['] EditWndProc2           OVER .lpfnWndProc   !
\    ['] Edi_tWndProc             OVER .lpfnWndProc   !  !!!!!!!!!!!!!!
    0                           OVER .cbClsExtra    L!
    0                           OVER .cbWndExtra    L!
    HINST                       OVER .hInstance     !
    HINST 1 LoadIconA DUP >R    OVER .hIcon         !
			R>	OVER .hIconSm		!
    0 IDC_ARROW LoadCursorA     OVER .hCursor       !
    WHITE_BRUSH GetStockObject  OVER .hbrBackground !
    0                           OVER .lpszMenuName  !
    EditClassName               OVER .lpszClassName !
 
  RegisterClassExA
  0= ABORT" #Class was not registered!"

     /WNDCLASS NEGATE ALLOT
;

     EditRegisterClass


: TASK_EDIT
   TASKININ    DECIMAL
  EDIT_XY 2@ { xx yy -- }


  CreateMainMenu TO MainMenu
  WS_EX_LEFT  WS_EX_ACCEPTFILES OR
  EditClassName
  DUP \ szDisplayName
\  WS_OVERLAPPED  WS_SYSMENU OR WS_VISIBLE OR
  WS_VISIBLE  WS_OVERLAPPEDWINDOW OR
  WS_CAPTION  WS_SYSMENU OR WS_THICKFRAME OR WS_MINIMIZEBOX OR
  WS_MAXIMIZEBOX OR  WS_POPUP OR \ style

  OR

  320   120
  640   480
  0
  MainMenu                      \ handle to menu, or child-window identifier
  HINST                         \ handle to application instance
  0                             \ pointer to window-creation data

 CreateWindowExA
  TO EMyhwnd

  EMyhwnd
 GWLP_WNDPROC ['] MyEdWndProc 
 SetWindowLongPtrA
 CR ." Z SetWindowLongPtrA=" DUP H.
 DUP 0=
 IF GetLastError  H. THEN
 TO EdWndProc

  EDIT_FN C@
  IF
     EDIT_Load
     0  yy  EM_LINEINDEX   SendToEd xx + DUP
     EM_SETSEL       SendToEd DROP
     0 0 EM_SCROLLCARET   SendToEd DROP

  THEN

  FALSE TO  EDIT-END

  MessageLoop

;


: EDDD
 S" TTT.4" EDIT_FN!
 ['] TASK_EDIT TSTART
;

VARIABLE CC_INIT CC_INIT 0! \ 
CREATE   CC_INITS 8 , 0xFFFF ,

: InitControls
  CC_INIT @ IF EXIT THEN
  CC_INITS InitCommonControlsEx DROP
  S" RICHED32.DLL" DROP LoadLibraryA DROP
  TRUE CC_INIT !
;

\ InitControls


\ '  TASK_EDIT TASK:  START_EDITED

\ : START_EDITED ['] TASK_EDIT TSTART ;

: EDIT
    TlsIndex@ TO OPER_E
    EDIT-END
    IF ['] TASK_EDIT TSTART DROP \  START_EDITED TSTART DROP
    ELSE EDIT_Load  EDIT_XY 2@ EDIT_XY_SET
    THEN 100 SLEEP ;

1 [IF]
: EDIT_ERROR ( ERR-NUM -> ) \ 
  [ ' ERROR >BODY @ COMPILE, ]
  ERRFILE COUNT NIP \ cmdDBG ED_WATE <> AND
  IF  NEXT_F
  ERRFILE COUNT EDIT_FN!
       ER>IN @ ERCURSTR @ 1- EDIT_XY!  EDIT
  THEN
;

' EDIT_ERROR TO ERROR
[THEN]

: E>
 ' NEAR_NFA DROP ?DUP 
  IF 
   DUP  8 4 * - @ ?DUP
	IF   NEXT_F COUNT EDIT_FN! 12 - L@ 0 SWAP EDIT_XY! EDIT
	THEN
  THEN
;

\ E>  E>  8 4 * - 
: OK EDIT_FN COUNT INCLUDED ;

;MODULE \ ---------------------------
CASE-INS !
PREVIOUS PREVIOUS
