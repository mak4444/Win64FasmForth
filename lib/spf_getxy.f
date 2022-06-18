REQUIRE API_2: lib\WAPI.4

KERNEL32DLL XAPI_2: GetConsoleScreenBufferInfo GetConsoleScreenBufferInfo
KERNEL32DLL XAPI_2: SetConsoleCursorPosition SetConsoleCursorPosition

CREATE CONSOLE_SCREEN_BUFFER_INFO 22 ALLOT
: SBI CONSOLE_SCREEN_BUFFER_INFO 20 DUMP ;


: COORD ( x y -- COORD )
  16 LSHIFT OR 
;

: AT-XY-G ( x y -- )
\ 
  COORD H-STDOUT
  SetConsoleCursorPosition DROP \ ERR THROW
;

: AT-XY ( x y -- )
  CONSOLE_SCREEN_BUFFER_INFO H-STDOUT
  GetConsoleScreenBufferInfo  DROP
  CONSOLE_SCREEN_BUFFER_INFO $C + W@ +

 AT-XY-G
;

: SETXY AT-XY ;


: AT-XY? ( -- x y )
\ 
  CONSOLE_SCREEN_BUFFER_INFO H-STDOUT
  GetConsoleScreenBufferInfo  DROP
  CONSOLE_SCREEN_BUFFER_INFO 4 +
  DUP W@
  OVER 2 + W@ 
 ROT 8 + W@ - ;

: GETXY AT-XY? ;
