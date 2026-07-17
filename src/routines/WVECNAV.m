WVECNAV ; WorldVistA Engineering Navigator
 ;;4.2;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ; Generic Navigation Engine
 ;
 ;=========================================================
START(PROVIDER,PATH) ;
 ;
 NEW DONE,PAGE,PAGESIZE,COUNT,DIRTY,LEVEL
 NEW LIST
 ;
 SET DONE=0
 SET PAGE=1
 SET PAGESIZE=25
 SET LEVEL=0
 SET DIRTY=1
 ;
 FOR  QUIT:DONE  DO
 . IF DIRTY DO
 . . DO GETLIST(PROVIDER,PATH,.LIST,.COUNT)
 . . SET DIRTY=0
 . WRITE #
 . WRITE !,"=================================================="
 . WRITE !,"      WVEC Engineering Navigator 4.2"
 . WRITE !,"=================================================="
 . WRITE !!
 . WRITE "Provider : ",PROVIDER,!
 . WRITE "Path     : ",PATH,!
 . WRITE "Level    : ",LEVEL,!
 . WRITE "Items    : ",COUNT,!!
 . DO RENDER(.LIST,COUNT,PAGE,PAGESIZE)
 . DO COMMAND(.DONE,.PAGE,.DIRTY,.LEVEL,.PATH,.LIST,COUNT)
 ;
 QUIT
 ;
 ;=========================================================
COMMAND(DONE,PAGE,DIRTY,LEVEL,PATH,LIST,COUNT) ;
 ;
 NEW X
 ;
 WRITE !
 WRITE "Commands: N P U R T Q or Number",!
 WRITE "Select: "
 READ X:300
 WRITE !
 ;
 SET X=$$UP^XLFSTR($GET(X))
 ;
 IF X="" QUIT
 ;
 IF X="Q" SET DONE=1 QUIT
 ;
 IF X="N" DO  QUIT
 . SET PAGE=PAGE+1
 ;
 IF X="P" DO  QUIT
 . IF PAGE>1 SET PAGE=PAGE-1
 ;
 IF X="R" DO  QUIT
 . SET DIRTY=1
 ;
 IF X="T" DO  QUIT
 . SET LEVEL=0
 . SET PAGE=1
 . SET DIRTY=1
 ;
 IF X="U" DO  QUIT
 . IF LEVEL>0 SET LEVEL=LEVEL-1
 . SET PAGE=1
 . SET DIRTY=1
 ;
 IF X?1.N DO  QUIT
 . IF X<1!(X>COUNT) DO  QUIT
 . . WRITE "Invalid selection.",!
 . . H 1
 . WRITE "Selection ",X,": ",$GET(LIST(X)),!
 . ; Navigation into child nodes will be added here.
 . H 1
 ;
 WRITE "Unknown command.",!
 H 1
 QUIT
 ;
 ;=========================================================
GETLIST(PROVIDER,PATH,LIST,COUNT) ;
 ;
 NEW CMD
 ;
 KILL LIST
 SET COUNT=0
 ;
 SET CMD="DO LIST^"_PROVIDER_"("""_PATH_""",.LIST,.COUNT)"
 X CMD
 ;
 QUIT
 ;
 ;=========================================================
RENDER(LIST,COUNT,PAGE,PAGESIZE) ;
 ;
 NEW FIRST,LAST,I,PAGES
 ;
 IF COUNT<1 DO  QUIT
 . WRITE "(No entries)",!
 ;
 SET PAGES=((COUNT-1)\PAGESIZE)+1
 ;
 IF PAGE<1 SET PAGE=1
 IF PAGE>PAGES SET PAGE=PAGES
 ;
 SET FIRST=((PAGE-1)*PAGESIZE)+1
 SET LAST=FIRST+PAGESIZE-1
 IF LAST>COUNT SET LAST=COUNT
 ;
 WRITE "Page ",PAGE," of ",PAGES,!
 WRITE "--------------------------------------------------",!
 ;
 FOR I=FIRST:1:LAST DO
 . WRITE $JUSTIFY(I,3),". ",$GET(LIST(I)),!
 ;
 WRITE "--------------------------------------------------",!
 ;
 QUIT
