 DECIMAL
VECT SHEADER
' YSHEADER TO SHEADER

\ USER     HLD  \ переменная - позиция последней литеры, перенесенной в PAD

0 VALUE  H-STDIN    \ хэндл файла - стандартного ввода
1 VALUE  H-STDOUT   \ хэндл файла - стандартного вывода
1 VALUE  H-STDERR   \ хэндл файла - стандартного вывода ошибок

USER C-SMUDGE \ 12 C,

: SMUDGE ( -> )
  C-SMUDGE C@
  LAST @ 1+ C@
  C-SMUDGE C!
  LAST @ 1+ C!
;

: HIDE
  12 C-SMUDGE C! SMUDGE
;

: ALIGN-NOP ( n -- )
\ выровнять HERE на n и заполнить NOP
  HERE DUP ROT 2DUP
  MOD DUP IF - + ELSE 2DROP THEN
  OVER - DUP ALLOT 0x90 FILL
;

' (ABORT1")  TO (ABORT")
' ERROR_DO   TO ERROR

' FIND1      TO FIND

: CONSTANT ( x "<spaces>name" -- ) \ 94
  HEADER
  CONSTANT-CODE COMPILE, ,
;
\ : L@ SL@ DUP [ 0xB848 W, -1 L, 0 L, ] AND  ;
: ZL@ SL@ DUP [ 0xB848 W, -1 L, 0 L, ] AND  ;
: TL@ SL@ DUP [ 0xB848 W, -1 L, 0 L, ] DUP H. AND DUP H.  ;

: LASTWORD ;

: VECT ( -> )
  ( создать слово, семантику выполнения которого можно менять,
    записывая в него новый xt по TO)
  HEADER
  QVECT-CODE COMPILE, 0 L,
  QTOVALUE-CODE COMPILE,  <'> NOOP Q,
;

: Q, , ;
