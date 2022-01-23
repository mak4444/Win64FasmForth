( ������� ����-�뢮�.
)


CREATE LT 0xD C, 0xA C, 0xD C, 0xA C, \ line terminator
CREATE LTL 2 ,   \ line terminator length


: DOS-LINES ( -- )
  0xA0D LT ! 2 LTL !
;
: UNIX-LINES ( -- )
  0xA0A LT ! 1 LTL !
;

USER lpNumberOfBytesRead


USER lpNumberOfBytesWritten

   2 CONSTANT CREATE_ALWAYS
   3 CONSTANT OPEN_EXISTING
  20 CONSTANT FILE_ATTRIBUTE_ARCHIVE

USER-CREATE FILE-BUFF
256 CELL+ USER-ALLOT

: OPEN-FILE ( c-addr u fam -- fileid ior )
\ ������ 䠩� � ������, ������� ��ப�� c-addr u, � ��⮤�� ����㯠 fam.
\ ���� ���祭�� fam ��।���� ॠ����樥�.
\ �᫨ 䠩� �ᯥ譮 �����, ior ����, fileid ��� �����䨪���, � 䠩�
\ ����樮��஢�� �� ��砫�.
\ ���� ior - ��।������ ॠ����樥� ��� १���� �����/�뢮��,
\ � fileid ����।����.
  >R FILE-BUFF ASCII-Z  R>
  ZOPEN-FILE
;

: OPEN-FILE-SHARED ( c-addr u fam -- fileid ior )
  >R FILE-BUFF ASCII-Z  R>
  ZOPEN-FILE-SHARED
;

: CREATE-FILE ( c-addr u fam -- fileid ior )
  >R FILE-BUFF ASCII-Z  R>
  ZCREATE-FILE
;

: CREATE-FILE-SHARED ( c-addr u fam -- fileid ior )
  >R FILE-BUFF ASCII-Z  R>
  ZCREATE-FILE-SHARED
;

0 [IF]
: CLOSE-FILE ( fileid -- ior ) \ 94 FILE
\ ������� 䠩�, ������� fileid.
\ ior - ��।������ ॠ����樥� ��� १���� �����/�뢮��.
  DUP >R ['] SYS_CloseHandle PERFORM DROP 0 \ ERR
;
[THEN]

USER _fp1
USER _fp2
USER _addr


: READ-LINE ( c-addr u1 fileid -- u2 flag ior ) \ 94 FILE
\ ������ ᫥������ ��ப� �� 䠩��, ��������� fileid, � ������
\ �� ����� c-addr. ��⠥��� �� ����� u1 ᨬ�����. �� ����
\ ��।������� ॠ����樥� ᨬ����� "����� ��ப�" ����� ����
\ ���⠭� � ������ �� ���殬 ��ப�, �� �� ����祭� � ���稪 u2.
\ ���� ��ப� c-addr ������ ����� ࠧ��� ��� ������ u1+2 ᨬ����.
\ �᫨ ������ �ᯥ譠, flag "��⨭�" � ior ����. �᫨ ����� ��ப�
\ ����祭 �� ⮣� ��� ���⠭� u1 ᨬ�����, � u2 - �᫮ ॠ�쭮
\ ���⠭��� ᨬ����� (0<=u2<=u1), �� ���� ᨬ����� "����� ��ப�".
\ ����� u1=u2 ����� ��ப� 㦥 ����祭.
\ �᫨ ������ �ந��������, ����� ���祭��, �����頥���
\ FILE-POSITION ࠢ�� ���祭��, �����頥���� FILE-SIZE ��� 䠩��,
\ ��������㥬��� fileid, flag "����", ior ����, � u2 ����.
\ �᫨ ior �� ����, � �ந��諠 �᪫��⥫쭠� ����� � ior -
\ ��।������ ॠ����樥� ��� १���� �����-�뢮��.
\ ����।������� ����� ���������, �᫨ ������ �믮������, �����
\ ���祭��, �����頥��� FILE-POSITION ����� 祬 ���祭��, �����頥���
\ FILE-SIZE ��� 䠩��, ��������㥬��� fileid, ��� �ॡ㥬�� ������
\ ��⠥��� ������ ������ᠭ��� ���� 䠩��.
\ ��᫥ �����襭�� ����樨 FILE-POSITION ������� ᫥������ ������
\ � 䠩�� ��᫥ ��᫥����� ���⠭���� ᨬ����.
  DUP >R  FILE-POSITION IF 2DROP 0 0 THEN  _fp1 ! _fp2 !
  1+
  OVER _addr !  R@ READ-FILE
 ?DUP IF NIP RDROP 0 0 ROT EXIT THEN

  DUP >R 0= IF RDROP RDROP 0 0 0 EXIT THEN \ �뫨 � ���� 䠩��
  _addr @  R@  LT 1+ 1 SEARCH
  IF   \ ������ ࠧ����⥫� ��ப
     DROP  _addr @ -
     DUP 1+ S>D _fp2 @ _fp1 @ D+ RDROP R> REPOSITION-FILE DROP
     DUP IF  DUP _addr @ + 1- C@  0xD = IF 1- THEN THEN
  ELSE   \ �� ������ ࠧ����⥫� ��ப
     2DROP     R>
 RDROP  \ �᫨ ��ப� ���⠭� �� ��������� - �㤥� ࠧ१���
  THEN
  TRUE 0
;

: WRITE-LINE ( c-addr u fileid -- ior ) \ 94 FILE
  DUP >R WRITE-FILE ?DUP IF RDROP EXIT THEN
  LT LTL @ R> WRITE-FILE
;
 


