section '.text' code readable writeable executable 

;-----------------------------------------------------------------------
wcinit:
        invoke GetModuleHandle,0
        mov [wc_str.hInstance],rax
        mov [wc_str.cbSize],sizeof.WNDCLASSEX
        mov [wc_str.style],CS_HREDRAW or CS_VREDRAW
        mov [wc_str.lpfnWndProc],WindowProc
        mov [wc_str.cbClsExtra],0
        invoke LoadIcon,0,IDI_APPLICATION
        mov [wc_str.hIcon],rax
        mov [wc_str.hIconSm],rax
        invoke LoadCursor,0,IDC_ARROW
        mov [wc_str.hCursor],rax
        mov [wc_str.hbrBackground],COLOR_WINDOW+1
        mov [wc_str.lpszMenuName],NULL
        mov [wc_str.lpszClassName],szTitle
       RET
WinMainInit:

        invoke RegisterClassEx,wc_str
;        invoke CreateWindowEx,0,szTitle,szTitle,WS_VISIBLE + WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,CW_USEDEFAULT,500,100,NULL,[hPopupMenu],[wc_str.hInstance],NULL
        invoke CreateWindowEx,0,szTitle,szTitle,WS_VISIBLE + WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,CW_USEDEFAULT,500,100,NULL,0,[wc_str.hInstance],NULL
        ret
msg_loop:
        invoke  GetMessage,msg,NULL,0,0
        or      rax,rax
        je      exit
        invoke  TranslateMessage,msg
        invoke  DispatchMessage,msg
        jmp     msg_loop
  exit:
        invoke ExitProcess,[msg.wParam]
;endp


;--------------------------------------------------------------------------------
proc WindowProc hwnd,wmsg,wparam,lparam
;	     invoke  CreatePopupMenu
;	     mov     [hPopupMenu], rax

;	     invoke  AppendMenu, rax, MF_STRING, 300, 'Item &1'
;	     invoke  AppendMenu, [hPopupMenu], MF_STRING, 301, 'Item &2'
        mov [hwnd],rcx
        mov [wmsg],rdx
        mov [wparam],r8
        mov [lparam],r9
        cmp [wmsg],WM_DESTROY
        jne .defwndproc
        invoke PostQuitMessage,0
        ret
    .defwndproc:
        invoke DefWindowProc,[hwnd],[wmsg],[wparam],[lparam]
        ret
endp
;----------------------------------------------------------------------
section '.data' data readable writeable
szTitle db 'CLOCK',0
wc_str WNDCLASSEX
msg MSG

  hPopupMenu   dq 0

