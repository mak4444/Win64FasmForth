\ ������祭�� �������⥫��� ���

 S" ~mak\lib\disasm.f"	INCLUDED
\ REQUIRE F.	lib\include\float2.f
REQUIRE MDSW:	~af\lib\4interp.f
REQUIRE (*	~af\lib\comments.f
REQUIRE [[	~yz\lib\automate.f
REQUIRE SLITERAL2	~af\lib\sliteral2.f


FALSE WARNING !
MDSW: FOREACH FOREACH
MDSW; NEXT NEXT
TRUE WARNING !

: >_double ( -- d ; f: f -- )
\ ���� �᫮ � ����⢥����� �⥪� � ������ ��� �� �⥪ ��ࠬ��஢
\ � COM-ᮢ���⨬�� ����
  FLOAT>DATA SWAP
;
: _double> ( d -- ; f: -- f )
  SWAP DATA>FLOAT
;
