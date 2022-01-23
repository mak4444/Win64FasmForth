[IFNDEF] USER32DLL
S" USER32.DLL" DROP DLL_L
DUP 0= [IF] .( USER32.DLL LOAD ERROR) ABORT [THEN]
CONSTANT USER32DLL
[THEN]

[IFNDEF] GDI32DLL
S" Gdi32.DLL" DROP DLL_L
DUP 0= [IF] .( Gdi32.DLL LOAD ERROR) ABORT [THEN]
CONSTANT GDI32DLL
[THEN]

[IFNDEF] COMCTL32DLL
S" Comctl32.DLL" DROP DLL_L
DUP 0= [IF] .( Comctl32.DLL LOAD ERROR) ABORT [THEN]
CONSTANT COMCTL32DLL
[THEN]

KERNEL32DLL XAPI0: GetLastError	GetLastError
USER32DLL WAPI2: GetDlgItem	GetDlgItem

USER32DLL WAPI4: SendMessageA	SendMessageA
USER32DLL WAPI4: MessageBoxA	MessageBoxA
USER32DLL WAPI5: MessageBoxExA	MessageBoxExA
USER32DLL WAPI1: SetActiveWindow	SetActiveWindow
USER32DLL WAPI1: SetFocus	SetFocus
USER32DLL WAPI1: SetForegroundWindow	SetForegroundWindow
USER32DLL WAPI1: BringWindowToTop	BringWindowToTop
USER32DLL WAPI2: SetWindowTextA	SetWindowTextA
COMDLG32DLL WAPI1: FindTextA	FindTextA
USER32DLL WAPI5: CallWindowProcA	CallWindowProcA
USER32DLL WAPI12: CreateWindowExA	CreateWindowExA
KERNEL32DLL WAPI1: GetModuleHandleA GetModuleHandleA
USER32DLL WAPI1: UpdateWindow UpdateWindow
USER32DLL WAPI3: SetWindowLongPtrA SetWindowLongPtrA
USER32DLL WAPI2: ReleaseDC	ReleaseDC
USER32DLL WAPI1: GetDC	GetDC
USER32DLL WAPI2: ShowWindow	ShowWindow
GDI32DLL WAPI1: CreateFontIndirectA	CreateFontIndirectA
USER32DLL WAPI6: MoveWindow	MoveWindow
USER32DLL WAPI4: DefWindowProcA	DefWindowProcA
USER32DLL WAPI1: TranslateMessage	TranslateMessage
USER32DLL WAPI1: DispatchMessageA	DispatchMessageA
USER32DLL WAPI4: GetMessageA	GetMessageA
USER32DLL WAPI0: CreatePopupMenu	CreatePopupMenu
USER32DLL WAPI0: CreateMenu	CreateMenu
USER32DLL WAPI4: AppendMenuA	AppendMenuA
USER32DLL WAPI2: LoadIconA	LoadIconA
USER32DLL WAPI2: LoadCursorA	LoadCursorA
GDI32DLL  WAPI1: GetStockObject	GetStockObject
USER32DLL WAPI1: RegisterClassExA	RegisterClassExA
USER32DLL WAPI1: RegisterClassA	RegisterClassA
COMCTL32DLL WAPI1: InitCommonControlsEx	InitCommonControlsEx
KERNEL32DLL WAPI1: LoadLibraryA	LoadLibraryA

USER32DLL WAPI1: PostQuitMessage	PostQuitMessage

\- ?#define : ?#define >IN @  POSTPONE [DEFINED]  IF DROP POSTPONE \ BREAK >IN ! #define  ;


?#define WM_USER                         0x0400

?#define EM_GETSEL	0x00B0
?#define EM_SETSEL	0x00B1
?#define EM_SCROLLCARET	0x00B7
?#define EM_GETMODIFY	0x00B8
?#define EM_SETMODIFY	0x00B9
?#define EM_GETLINECOUNT	0x00BA
?#define EM_LINEINDEX	0x00BB
?#define EM_LINELENGTH	0x00C1
?#define EM_REPLACESEL	0x00C2
?#define EM_LINEFROMCHAR	0x00C9


?#define EM_EXLIMITTEXT			WM_USER  53 +
?#define EM_FINDTEXT 			WM_USER  56 +
?#define EM_GETSELTEXT			WM_USER  62 +

?#define WM_CREATE	0x0001
?#define WM_DESTROY	0x0002
?#define WM_SIZE	0x0005
?#define WM_SETFOCUS	0x0007
?#define WM_SETTEXT	0x000C
?#define WM_GETTEXT	0x000D
?#define WM_GETTEXTLENGTH	0x000E
?#define WM_CLOSE	0x0010
?#define WM_SETCURSOR	0x0020
?#define WM_SETFONT	0x0030
?#define WM_COMMAND	0x0111
?#define WM_CUT	0x0300
?#define WM_COPY	0x0301
?#define WM_PASTE	0x0302
?#define WM_UNDO	0x0304


?#define WS_OVERLAPPED	0x00000000
?#define WS_POPUP	0x80000000
?#define WS_CHILD	0x40000000
?#define WS_VISIBLE	0x10000000
?#define WS_CAPTION	0x00C00000    ( WS_BORDER | WS_DLGFRAME  )
?#define WS_BORDER	0x00800000
?#define WS_DLGFRAME	0x00400000
?#define WS_VSCROLL	0x00200000
?#define WS_HSCROLL	0x00100000
?#define WS_SYSMENU	0x00080000
?#define WS_THICKFRAME	0x00040000

?#define WS_EX_ACCEPTFILES       0x00000010

?#define WS_EX_CLIENTEDGE	0x00000200

?#define WS_EX_RIGHT             0x00001000
?#define WS_EX_LEFT              0x00000000

?#define WS_MINIMIZEBOX	0x00020000
?#define WS_MAXIMIZEBOX	0x00010000


?#define SW_SHOW	5

?#define WS_OVERLAPPEDWINDOW WS_OVERLAPPED WS_CAPTION OR WS_SYSMENU OR WS_THICKFRAME OR WS_MINIMIZEBOX OR WS_MAXIMIZEBOX OR

?#define MB_OK	0x000000
?#define MB_ICONHAND	0x000010
?#define MB_ICONSTOP	MB_ICONHAND
?#define MB_SYSTEMMODAL	0x001000

?#define ES_MULTILINE        0x0004
?#define ES_AUTOVSCROLL      0x0040
?#define ES_AUTOHSCROLL      0x0080

?#define MF_STRING	0x00000000
?#define MF_POPUP	0x00000010

?#define CS_VREDRAW          0x0001
?#define CS_HREDRAW          0x0002

?#define VK_F1             0x70
?#define VK_F2             0x71
?#define VK_F3             0x72
?#define VK_F4             0x73
?#define VK_F5             0x74
?#define VK_F6             0x75
?#define VK_F7             0x76
?#define VK_F8             0x77
?#define VK_F9             0x78
?#define VK_F10            0x79
?#define VK_F11            0x7A
?#define VK_F12            0x7B

?#define GWLP_WNDPROC	-4

?#define IDC_ARROW	32512


?#define LANG_ENGLISH	9
?#define MB_YESNOCANCEL	3

?#define IDCANCEL	2
?#define IDYES		6
?#define IDNO		7

?#define WHITE_BRUSH	0
