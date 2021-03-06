( Трансляция исходных текстов программ.
  ОС-независимые определения.
  Copyright [C] 1992-1999 A.Cherezov ac@forth.org
  Преобразование из 16-разрядного в 32-разрядный код - 1995-96гг
  Ревизия - сентябрь 1999
)

VECT OK.
VECT <MAIN>
VECT ?LITERAL
VECT ?SLITERAL
USER-VALUE SOURCE-ID-XT \ ���� �� ����� ����, �� �������� �����������
VECT PROCESS-ERR ( ior -- ior ) \ ���������� ������ ���������� (�����).

' OK1 TO OK.

: DEPTH ( -- +n ) \ 94
\ +n - число одинарных ячеек, находящихся на стеке данных перед
\ тем как туда было помещено +n.
  SP@ S0 A@ - NEGATE 8 U/
;

: ?STACK ( -> ) \ выдать ошибку "исчерпание стека", если он более чем пуст
 SP@ S0 A@ SWAP U< IF S0 A@ SP! -4 THROW THEN
;

: ?COMP ( -> )
  STATE A@ 0= IF -312 THROW THEN ( Только для режима компиляции )
;

: WORD ( char "<chars>ccc<char>" -- c-addr ) \ 94
\ Пропустить ведущие разделители. Выбрать символы, ограниченные
\ разделителем char.
\ Исключительная ситуация возникает, если длина извлеченной строки
\ больше максимальной длины строки со счетчиком.
\ c-addr - адрес переменной области, содержащей извлеченное слово
\ в виде строки со счетчиком.
\ Если разбираемая область пуста или содержит только разделители,
\ результирующая строка имеет нулевую длину.
\ В конец строки помещается пробел, не включаемый в длину строки.
\ Программа может изменять символы в строке.
  DUP PSKIP
   PARSE
  DUP HERE 0x220 + C! HERE 0x221 + SWAP CMOVE
  BL HERE 0x220 + COUNT + L!
  HERE  0x220 + 
;

: ' ( "<spaces>name" -- xt ) \ 94
\ Пропустить ведущие пробелы. Выделить name, ограниченное пробелом. Найти name 
\ и вернуть xt, выполнимый токен для name. Неопределенная ситуация возникает, 
\ если name не найдено.
\ Во время интерпретации  ' name EXECUTE  равносильно  name.
  PARSE-WORD SFIND 0=
  IF -321 THROW THEN (  -? )
;

: CHAR ( "<spaces>name" -- char ) \ 94
\ Пропустить ведущие разделители. Выделить имя, органиченное пробелами.
\ Положить код его первого символа на стек.
  PARSE-WORD DROP C@ ;

: INTERPRET_ ( -> ) \ интерпретировать входной поток
  SAVEERR? ON
  BEGIN
    PARSE-WORD DUP
  WHILE
    SFIND ?DUP
    IF  DBG
         STATE @ =
         IF COMPILE, ELSE EXECUTE THEN
    ELSE
\         S" NOTFOUND" SFIND 
\         IF EXECUTE
\         ELSE 2DROP ?SLITERAL THEN
          ?SLITERAL
    THEN
    ?STACK
  REPEAT 2DROP
;

VARIABLE &INTERPRET
' INTERPRET_ &INTERPRET !

: INTERPRET &INTERPRET @ EXECUTE ;

: .SN ( n --)
\ Распечатать n верхних элементов стека
   >R BEGIN
         R@
      WHILE
        SP@ R@ 1- CELLS + @ DUP 0< 
        IF DUP U>D <# #S #> TYPE
           ." (" ABS 0 <# #S [CHAR] - HOLD #> TYPE ." ) " ELSE . THEN
        R> 1- >R
      REPEAT RDROP
;

: .S  DEPTH .SN ;

CREATE TYPE_BUFF 111 ALLOT

: TYPE_BUFF+
 TYPE_BUFF $+! ;


: OK1
  STATE A@ 0=
  IF ."  Ok" DEPTH 70 UMIN 
      0 ?DO [CHAR] . EMIT LOOP
    CR 
  THEN
;


: [   \ 94 CORE
\ Интерпретация: семантика неопределена.
\ Компиляция: Выполнить семантику выполнения, данную ниже.
\ Выполнение: ( -- )
\ Установить состояние интерпретации. [ слово немедленного выполнения.
  STATE 0!
; IMMEDIATE

: ] ( -- ) \ 94 CORE
\ Установить состояние компиляции.
  TRUE STATE !
;

: QUIT ( -- ) ( R: i*x ) \ CORE 94
\ Сбросить стек возвратов, записать ноль в SOURCE-ID.
\ Установить стандартный входной поток и состояние интерпретации.
\ Не выводить сообщений. Повторять следующее:
\ - Принять строку из входного потока во входной буфер, обнулить >IN
\   и интепретировать.
\ - Вывести зависящее от реализации системное приглашение, если
\   система находится в состоянии интерпретации, все процессы завершены,
\   и нет неоднозначных ситуаций.

  CONSOLE-HANDLES
  0 TO SOURCE-ID
  [COMPILE] [
  <MAIN>
;

: MAIN1 ( -- )
  BEGIN REFILL
  WHILE INTERPRET OK.
  REPEAT BYE
;

' MAIN1 TO <MAIN>

: FMAIN ( -- )
\  BEGIN AGAIN
\  REFILL IF  INTERPRET THEN
  
  BEGIN REFILL
  WHILE INTERPRET
  REPEAT
;

: SAVE-SOURCE ( -- i*x i )
  SOURCE-ID-XT  SOURCE-ID   >IN A@   SOURCE   CURSTR A@   6
;

: RESTORE-SOURCE ( i*x i  -- )
  6 <> IF ABORT THEN
  CURSTR !    SOURCE!  >IN !  TO SOURCE-ID   TO SOURCE-ID-XT
;


: EVALUATE ( i*x c-addr u -- j*x ) \ 94
\ Сохраняет текущие спецификации входного потока.
\ Записывает -1 в SOURCE-ID. Делает строку, заданную c-addr u,
\ входным потоком и входным буфером, устанавливает >IN в 0
\ и интерпретирует. Когда строка разобрана до конца - восстанавливает
\ спецификации предыдущего входного потока.
\ Другие изменения стека определяются выполняемыми по EVALUATE словами.
  SOURCE-ID >R TIB >R #TIB A@ >R >IN A@ >R
  -1 TO SOURCE-ID
  #TIB ! TO TIB >IN 0!
    <'> INTERPRET CATCH
  R> >IN ! R> #TIB ! R> TO TIB R> TO SOURCE-ID
  THROW
;

: HEAP-COPY ( addr u -- addr1 )
\ скопировать строку в хип и вернуть её адрес в хипе
  DUP 0< IF 8 THROW THEN
  DUP CHAR+ ALLOCATE THROW DUP >R
  SWAP DUP >R CHARS MOVE
  0 R> R@ + C! R>
;

: INCLUDE-FILE ( i*x fileid -- j*x ) \ 94 FILE
\ Убрать fileid со стека. Сохранить текущие спецификации входного потока,
\ включая текущее значение SOURCE-ID. Записать fileid в SOURCE-ID.
\ Сделать файл, заданный fileid, входным потоком. Записать 0 в BLK.
\ Другие изменения стека определяются словами из включенного файла.
\ Повторять до конца файла: прочесть строку из файла, заполнить входной
\ буфер содержимым этой строки, установить >IN в ноль и интерпретировать.
\ Интерпретация текста начинается с позиции, с которой должно происходить
\ дальнейшее чтение файла.
\ Когда достигнут конец файла, закрыть файл и восстановить спецификации
\ входного потока к их сохраненным значениям.
\ Неопределенная ситуация возникает, если fileid неверен, если возникают
\ исключительные ситуации ввода-вывода по мере чтения fileid, или
\ возникают исключительная ситуация при закрытии файла. Когда имеет
\ место неопределенная ситуация, статус (открыт или закрыт) любых
\ интерпретируемых файлов зависит от реализации.

  TIB >R >IN @ >R #TIB A@ >R
 SOURCE-ID >R
 CURSTR A@ >R

  C/L 2 +  ALLOCATE THROW  TO TIB
  TO SOURCE-ID
  CURSTR 0!  
  BEGIN REFILL
  WHILE INTERPRET
  REPEAT
  TIB FREE THROW
  SOURCE-ID CLOSE-FILE THROW ( ������ �������� ����� )
  R> CURSTR ! R> TO SOURCE-ID R> #TIB ! R> >IN ! R> TO TIB
;

: INCLUDED_1 ( i*x c-addr u -- j*x ) \ 94 FILE
\ Убрать c-addr u со стека. Сохранить текущие спецификации входного потока,
\ включая текущее значение SOURCE-ID. Открыть файл, заданный c-addr u,
\ записать полученный fileid в SOURCE-ID и сделать его входным потоком.
\ Записать 0 в BLK.
\ Другие изменения стека определяются словами из включенного файла.
\ Повторять до конца файла: прочесть строку из файла, заполнить входной
\ буфер содержимым этой строки, установить >IN в ноль и интерпретировать.
\ Интерпретация текста начинается с позиции, с которой должно происходить
\ дальнейшее чтение файла.
\ Когда достигнут конец файла, закрыть файл и восстановить спецификации
\ входного потока к их сохраненным значениям.
\ Неопределенная ситуация возникает, если fileid неверен, если возникают
\ исключительные ситуации ввода-вывода по мере чтения fileid, или
\ возникают исключительная ситуация при закрытии файла. Когда имеет
\ место неопределенная ситуация, статус (открыт или закрыт) любых
\ интерпретируемых файлов зависит от реализации.
\  CURFILE @ >R
\  2DUP HEAP-COPY CURFILE !

   R/O OPEN-FILE ?DUP 
  IF NIP \ CURFILE A@ FREE DROP R> CURFILE !
   THROW
   THEN
  DUP >R
\ CR ." <'> INCLUDE-FILE CATCH"
  <'> INCLUDE-FILE CATCH SAVEERR
  ?DUP IF R> CLOSE-FILE DROP THROW
          \ ������� ������������� ���� � �������� ������ ����
       ELSE RDROP THEN

\  CURFILE A@ FREE THROW  R> CURFILE !
;
: INCLUDED_
  CURFILE A@ >R
  2DUP HEAP-COPY CURFILE A!
  <'> INCLUDED_1 CATCH
  CURFILE A@ FREE THROW
  R> CURFILE A!
  THROW
;


: REQUIRED ( waddr wu laddr lu -- )
  2SWAP SFIND
  IF DROP 2DROP EXIT
  ELSE 2DROP INCLUDED EXIT THEN
;

: REQUIRE ( "word" "libpath" -- )
  PARSE-WORD PARSE-WORD 2DUP + 0 SWAP C!
  REQUIRED
;

