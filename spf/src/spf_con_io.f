( ���᮫�� ����-�뢮�.
  ��-������ᨬ� ᫮�� [�⭮�⥫쭮...].
  Copyright [C] 1992-1999 A.Cherezov ac@forth.org
  �८�ࠧ������ �� 16-ࠧ�來��� � 32-ࠧ�來� ��� - 1995-96��
  ������� - ᥭ���� 1999
)
32 CONSTANT BL ( -- char ) \ 94
\ char - ���祭�� ᨬ���� "�஡��".

: SPACE ( -- ) \ 94
\ �뢥�� �� �࠭ ���� �஡��.
  BL EMIT
;

: SPACES ( n -- ) \ 94
\ �᫨ n>0 - �뢥�� �� ��ᯫ�� n �஡����.
  BEGIN
    DUP
  WHILE
    BL EMIT 1-
  REPEAT DROP
;


VECT DO-KEY?

' NOOP TO DO-KEY?

VARIABLE PENDING-CHAR \ ��������� ���� -> ��६����� ������쭠�, �� USER


\ : KEY?
\ 0 ;

VECT KEY?


' EKEY? TO KEY?

VECT KEY


\ ' KEY1 TO KEY
' OS_KEY TO KEY
\EOF
: KEY1 ( -- char ) \ 94
\ �ਭ��� ���� ᨬ��� char. ���������� ᮡ���, �� ᮮ⢥�����騥
\ ᨬ�����, ����뢠���� � ����� �� ����㯭�.
\ ����� ���� �ਭ��� �� �⠭����� ᨬ����. �������, �ਭ������ �� KEY,
\ �� �⮡ࠦ����� �� ��ᯫ��.
\ �ணࠬ��, �ॡ��騥 ����������� ����祭�� �ࠢ����� ᨬ�����,
\ ������� �� ���㦥���.
  PENDING-CHAR @ 0 >
  IF PENDING-CHAR @ -1 PENDING-CHAR ! EXIT THEN
  BEGIN
    EKEY  EKEY>CHAR 0=
  WHILE
    DROP
  REPEAT
;



: _KEY?
\ �᫨ ᨬ��� ����㯥�, ������ "��⨭�". ���� "����". �᫨ ��ᨬ���쭮�
\ ��������୮� ᮡ�⨥ ����㯭�, ��� ����뢠���� � ����� ������㯭�.
\ ������ �㤥� �����饭 ᫥���騬 �믮������� KEY.
\ ��᫥ ⮣� ��� KEY? �����⨫� ���祭�� "��⨭�", ᫥���騥 �믮������
\ KEY? �� �믮������ KEY ��� EKEY ⠪�� �������� "��⨭�" ��� ����뢠���
\ ����������� ᮡ�⨩.
  PENDING-CHAR @ 0 > IF TRUE EXIT THEN
  BEGIN
    EKEY?
  WHILE
    EKEY  EKEY>CHAR
    IF PENDING-CHAR !
       TRUE EXIT
    THEN
    DROP
  REPEAT FALSE
;
