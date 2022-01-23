( Файловый ввод-вывод.
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
\ Открыть файл с именем, заданным строкой c-addr u, с методом доступа fam.
\ Смысл значения fam определен реализацией.
\ Если файл успешно открыт, ior ноль, fileid его идентификатор, и файл
\ позиционирован на начало.
\ Иначе ior - определенный реализацией код результата ввода/вывода,
\ и fileid неопределен.
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
\ Закрыть файл, заданный fileid.
\ ior - определенный реализацией код результата ввода/вывода.
  DUP >R ['] SYS_CloseHandle PERFORM DROP 0 \ ERR
;
[THEN]

USER _fp1
USER _fp2
USER _addr


: READ-LINE ( c-addr u1 fileid -- u2 flag ior ) \ 94 FILE
\ Прочесть следующую строку из файла, заданного fileid, в память
\ по адресу c-addr. Читается не больше u1 символов. До двух
\ определенных реализацией символов "конец строки" могут быть
\ прочитаны в память за концом строки, но не включены в счетчик u2.
\ Буфер строки c-addr должен иметь размер как минимум u1+2 символа.
\ Если операция успешна, flag "истина" и ior ноль. Если конец строки
\ получен до того как прочитаны u1 символов, то u2 - число реально
\ прочитанных символов (0<=u2<=u1), не считая символов "конец строки".
\ Когда u1=u2 конец строки уже получен.
\ Если операция производится, когда значение, возвращаемое
\ FILE-POSITION равно значению, возвращаемому FILE-SIZE для файла,
\ идентифицируемого fileid, flag "ложь", ior ноль, и u2 ноль.
\ Если ior не ноль, то произошла исключительная ситуация и ior -
\ определенный реализацией код результата ввода-вывода.
\ Неопределенная ситуация возникает, если операция выполняется, когда
\ значение, возвращаемое FILE-POSITION больше чем значение, возвращаемое
\ FILE-SIZE для файла, идентифицируемого fileid, или требуемая операция
\ пытается прочесть незаписанную часть файла.
\ После завершения операции FILE-POSITION возвратит следующую позицию
\ в файле после последнего прочитанного символа.
  DUP >R  FILE-POSITION IF 2DROP 0 0 THEN  _fp1 ! _fp2 !
  1+
  OVER _addr !  R@ READ-FILE
 ?DUP IF NIP RDROP 0 0 ROT EXIT THEN

  DUP >R 0= IF RDROP RDROP 0 0 0 EXIT THEN \ были в конце файла
  _addr @  R@  LT 1+ 1 SEARCH
  IF   \ найден разделитель строк
     DROP  _addr @ -
     DUP 1+ S>D _fp2 @ _fp1 @ D+ RDROP R> REPOSITION-FILE DROP
     DUP IF  DUP _addr @ + 1- C@  0xD = IF 1- THEN THEN
  ELSE   \ не найден разделитель строк
     2DROP     R>
 RDROP  \ если строка прочитана не полностью - будет разрезана
  THEN
  TRUE 0
;

: WRITE-LINE ( c-addr u fileid -- ior ) \ 94 FILE
  DUP >R WRITE-FILE ?DUP IF RDROP EXIT THEN
  LT LTL @ R> WRITE-FILE
;
 


