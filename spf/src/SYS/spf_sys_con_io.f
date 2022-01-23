( ���᮫�� ����-�뢮�.)
: NMNM 0 IF THEN ;
: ACCEPT0 ( c-addr +n1 -- +n2 ) \ 94
\ ����� ��ப� ���ᨬ��쭮� ����� �� +n1 ᨬ�����.
\ �᪫��⥫쭠� ����� ���������, �᫨ +n1 0 ��� ����� 32767.
\ �⮡ࠦ��� ᨬ���� �� ��� �����.
\ ���� ���뢠����, ����� ����祭 ᨬ��� "����� ��ப�".
\ ��祣� �� ���������� � ��ப�.
\ +n2 - ����� ��ப�, ����ᠭ��� �� ����� c-addr.
   OVER + 1- OVER      \ SA EA A
 NMNM
   BEGIN KEY          \ SA EA A C
\ ." {"   DUP H. ." }"
     DUP 10 = OVER 13 = OR 0= 
   WHILE
       DUP 0x1B = IF  DROP DUP C@ EMIT   ELSE
       DUP   8  = IF  EMIT \  BL EMIT 8 EMIT
                     2- >R OVER 1- R> UMAX ELSE
       DUP   9  = IF  DROP DUP 8 BLANK
                     >R OVER R>    \ SA EA SA A
                     SWAP OVER -   \ SA EA SA A-SA
                     8 / 1+ 8 * +  ELSE    DUP EMIT  OVER C!
                THEN THEN
                THEN 1+ OVER UMIN \ SA EA A
   REPEAT \ HEX CR DEPTH .SN
                     \ SA EA A C
   DROP NIP - NEGATE CR ;

: ACCEPT1 ( c-addr +n1 -- +n2 ) \ 94
\ ����� ��ப� ���ᨬ��쭮� ����� �� +n1 ᨬ�����.
\ �᪫��⥫쭠� ����� ���������, �᫨ +n1 0 ��� ����� 32767.
\ �⮡ࠦ��� ᨬ���� �� ��� �����.
\ ���� ���뢠����, ����� ����祭 ᨬ��� "����� ��ப�".
\ ��祣� �� ���������� � ��ப�.
\ +n2 - ����� ��ப�, ����ᠭ��� �� ����� c-addr.
  H-STDIN READ-FILE DROP
;

VECT ACCEPT

' ACCEPT1 TO ACCEPT

: TYPE_M ( c-addr1 u --- )
\ Output the string starting at c-addr and length u to the terminal.
\ CC_LINES
  0 ?DO COUNT EMIT LOOP DROP
;

: TYPE1 ( c-addr u -- ) \ 94
\ �᫨ u>0 - �뢥�� ��ப� ᨬ�����, �������� c-addr � u.
\ �ணࠬ��, �ᯮ����騥 �ࠢ���騥 ᨬ����, ������� �� ���㦥���.
  H-STDOUT \ DUP 0= IF DROP 2DROP BREAK
  WRITE-FILE DROP \ THROW  !!!!!
;

0x400 VALUE  SCREEN-WIDTH		( -- pix ) \ Width of the display (in pixels)
0x300 VALUE  SCREEN-HEIGHT	( -- pix ) \ Height of the display (in pixels)
0x200 VALUE  SCREEN-WIDTH-S
0x150 VALUE  SCREEN-HEIGHT-S

: _EMIT ( x -- ) \ 94
\ �᫨ x - ����ࠦ���� ᨬ���, �뢥�� ��� �� ��ᯫ��.
\ �ணࠬ��, �ᯮ����騥 �ࠢ���騥 ᨬ����, ������� �� ���㦥���.
  
;

: SWITCH_CHAR ( c1 -- c2 )
  DUP	[CHAR] a    [CHAR] z 1+  WITHIN
  OVER	[CHAR] A    [CHAR] Z 1+  WITHIN OR
  IF   32 XOR  THEN
;


\ : KEY_M DR_CUR BEGIN 0 ?KEY UNTIL CL_CUR SWITCH_CHAR ;


CREATE LAST_CUR 0 , 0 ,


VECT CR ' B_CR TO CR

: B_CR
  0xD EMIT
  0xA EMIT
;

CREATE INPUT_RECORD ( /INPUT_RECORD) 20 2 * ALLOT

: ControlKeysMask ( -- u )
\ ������ ���� �ࠢ����� ������ ��� ��᫥����� ��������୮�� ᮡ���.
    [ INPUT_RECORD ( Event dwControlKeyState ) 16 + ] LITERAL @
;

1 CONSTANT KEY_EVENT
\EOF
: EKEY>CHAR ( u -- u false | char true ) \ 93 FACILITY EXT
\ �᫨ ��������୮� ᮡ�⨥ u ᮮ⢥����� ᨬ���� - ������ ᨬ��� �
\ "��⨭�". ���� u � "����".
  DUP    0xFF000000 AND  0=   IF FALSE    EXIT THEN
  DUP    0x000000FF AND  DUP IF NIP TRUE EXIT THEN DROP
  FALSE
;

: EKEY>SCAN ( u -- scan flag )
\ ������ ᪠�-��� ������, ᮮ⢥�����饩 ��������୮�� ᮡ��� u
\ flag=true - ������ �����. flag=false - ���饭�.
  DUP  0x10 RSHIFT  0x000000FF AND
  SWAP 0xFF000000 AND 0<>
;
