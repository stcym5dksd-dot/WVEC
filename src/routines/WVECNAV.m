WVECNAV ; WorldVistA Engineering Navigator
 ;;5.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Published Entry Points
 ;===============================================================
 ;
 ; EXPLORE(PROVIDER,ROOT)
 ;     Generic navigation engine.
 ;
 ; HELP()
 ;     Display navigator help.
 ;
 ;===============================================================
 ; Internal Implementation
 ;===============================================================

EXPLORE(PROVIDER,ROOT) ;
 ;
 NEW DONE
 NEW CMD

 SET DONE=0

 FOR  QUIT:DONE  DO
 . WRITE !!
 . WRITE "========================================",!
 . WRITE " WVEC Navigator",!
 . WRITE "========================================",!
 . WRITE "Provider : ",PROVIDER,!
 . WRITE "Root     : ",ROOT,!
 . WRITE !
 . READ "Command (? for help): ",CMD:300
 . IF '$TEST SET DONE=1 QUIT
 . SET CMD=$$UP(CMD)
 . DO COMMAND(.DONE,CMD)

 QUIT


HELP ;
 WRITE !!
 WRITE "WVEC Navigator",!
 WRITE "--------------",!
 WRITE "Q   Quit",!
 WRITE "?   Help",!
 QUIT


 ;===============================================================
 ; Internal Labels
 ;===============================================================

COMMAND(DONE,CMD) ;

 IF CMD="Q" SET DONE=1 QUIT

 IF CMD="?" DO HELP QUIT

 WRITE !,"Unknown command."

 QUIT


UP(X)

 QUIT $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
