WVECNAV ; WorldVistA Engineering Navigator
 ;;5.1;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Generic Navigation Engine
 ;===============================================================

 ; Provider API
 ;
 ;   INIT(ROOT)
 ;   TITLE()
 ;   LIST(.LIST,.COUNT)
 ;   SELECT(ITEM)
 ;   UP()
 ;   TOP()
 ;
 ;===============================================================

EXPLORE(PROVIDER,ROOT) ;

 NEW DONE
 NEW CMD
 NEW TITLE
 NEW COUNT
 NEW LIST
 NEW PAGE
 NEW PAGESIZE
 DO INIT(PROVIDER,ROOT)

 SET PAGE=1
 SET PAGESIZE=$$PAGESIZE

 SET DONE=0
 FOR  QUIT:DONE  DO
 . K LIST
 . SET COUNT=0
 . DO LIST(PROVIDER,.LIST,.COUNT)
 . SET TITLE=$$TITLE(PROVIDER)
 . DO DISPLAY(TITLE,.LIST,COUNT,PAGE,PAGESIZE)
 . READ !,"Selection (? for help): ",CMD:300
 . IF '$TEST SET DONE=1 QUIT
 . SET CMD=$$UP(CMD)
 . DO COMMAND(PROVIDER,.DONE,CMD,.LIST,COUNT)

 QUIT


INIT(PROVIDER,ROOT)

 DO @("INIT^"_PROVIDER_"("""_ROOT_""")")

 QUIT

TITLE(PROVIDER)

 NEW X

 SET X=$TEXT(@("TITLE^"_PROVIDER))

 IF X="" QUIT "Navigator"

 QUIT $$@("TITLE^"_PROVIDER)

LIST(PROVIDER,LIST,COUNT)

 DO @("LIST^"_PROVIDER_"(.LIST,.COUNT)")

 QUIT

DISPLAY(TITLE,LIST,COUNT,PAGE,PAGESIZE)
 NEW I
 NEW FIRST
 NEW LAST
 WRITE #                              ; Clear screen

 WRITE "==========================================",!
 WRITE "     WorldVistA Engineering Console",!
 WRITE "==========================================",!!
 WRITE "Navigator : ",TITLE,!

 WRITE "------------------------------------------",!

 IF COUNT=0 DO  QUIT
 . WRITE "<No Items>",!
 . WRITE "------------------------------------------",!
 . WRITE !
 . WRITE "Commands: Q Quit   ? Help",!
 . WRITE !

 S FIRST=((PAGE-1)*PAGESIZE)+1

 S LAST=FIRST+PAGESIZE-1

 IF LAST>COUNT S LAST=COUNT

 FOR I=FIRST:1:LAST DO
 . WRITE $J(I,3),". ",LIST(I),!
 WRITE !
 WRITE "------------------------------------------",!

 IF COUNT>0 DO
 . WRITE "Showing ",FIRST,"-",LAST," of ",COUNT,!

 E  DO
 . WRITE "Showing 0 of 0",!

 WRITE "Commands: Number  Q  ?  U  T",!
 WRITE !
 QUIT

COMMAND(PROVIDER,DONE,CMD,LIST,COUNT)

 IF CMD="" SET DONE=1 QUIT

 IF CMD="Q" SET DONE=1 QUIT

 IF CMD="?" DO HELP QUIT

 IF CMD="U" DO @("UP^"_PROVIDER) QUIT

 IF CMD="T" DO @("TOP^"_PROVIDER) QUIT

 IF CMD?1.N DO  QUIT
 . IF CMD<1!(CMD>COUNT) D  QUIT
 . . WRITE !,"Invalid selection."
 . . H 1
 . DO @("SELECT^"_PROVIDER_"("""_LIST(+CMD)_""")")

 WRITE !,"Unknown command."

 QUIT


HELP

 WRITE !!
 WRITE "WVEC Navigator",!
 WRITE "--------------",!
 WRITE "number  Select item",!
 WRITE "U       Up one level",!
 WRITE "T       Top",!
 WRITE "Q       Quit",!
 WRITE "?       Help",!

 QUIT
PAGESIZE() ; Default number of items per page

 QUIT 25

UP(X)

 QUIT $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
