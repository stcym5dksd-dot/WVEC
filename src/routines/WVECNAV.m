WVECNAV ; WorldVistA Engineering Navigator
 ;;4.0;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ; Generic Navigation Engine
 ;
 ; Allan S. Finkelstein
 ; July 2026
 ;
 ;=========================================================
 ;
START(PROVIDER,ROOT) ;
 ;
 NEW DONE
 NEW PATH
 NEW LEVEL
 ;
 SET DONE=0
 SET PATH=$GET(ROOT)
 SET LEVEL=0
 ;
 FOR  QUIT:DONE  DO
 . DO DISPLAY(PROVIDER,PATH,LEVEL)
 . DO COMMAND(.DONE,.PATH,.LEVEL)
 ;
 QUIT
 ;
 ;=========================================================
DISPLAY(PROVIDER,PATH,LEVEL) ;
 ;
 NEW LIST
 NEW COUNT
 ;
 KILL LIST
 ;
 DO GETLIST(PROVIDER,PATH,.LIST,.COUNT)
 ;
 WRITE !!
 WRITE "===========================================",!
 WRITE " WVEC Engineering Navigator 4.0",!
 WRITE "===========================================",!
 WRITE !
 WRITE "Provider : ",PROVIDER,!
 WRITE "Path     : ",PATH,!
 WRITE "Level    : ",LEVEL,!
 WRITE "Items    : ",COUNT,!
 WRITE !
 ;
 DO RENDER(.LIST,COUNT)
 ;
 QUIT
 ;
 ;=========================================================
COMMAND(DONE,PATH,LEVEL) ;
 ;
 NEW X
 ;
 WRITE !
 WRITE "Select (Q,U,R,T or Number): "
 READ X:300
 WRITE !
 ;
 IF X="Q" SET DONE=1 QUIT
 ;
 IF X="U" DO  QUIT
 . IF LEVEL>0 SET LEVEL=LEVEL-1
 ;
 IF X="T" DO  QUIT
 . SET LEVEL=0
 ;
 IF X="R" QUIT
 ;
 IF X?1N.N DO
 . WRITE "Selection ",X," chosen.",!
 ;
 QUIT
 ;
 ;=========================================================
GETLIST(PROVIDER,PATH,LIST,COUNT) ;
 ;
 NEW CMD
 ;
 SET COUNT=0
 ;
 SET CMD="DO LIST^"_PROVIDER_"("""_PATH_""",.LIST,.COUNT)"
 X CMD
 ;
 QUIT
 ;
 ;=========================================================
RENDER(LIST,COUNT) ;
 ;
 NEW I
 ;
 IF COUNT=0 DO  QUIT
 . WRITE "(No entries)",!
 ;
 FOR I=1:1:COUNT DO
 . WRITE $JUSTIFY(I,3),". ",LIST(I),!
 ;
 QUIT
 ;
 ;=========================================================
