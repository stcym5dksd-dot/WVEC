WVECNAV ; WorldVistA Engineering Navigator
 ;;2.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; WVEC Navigation Controller
 ;
 ; Responsibilities:
 ;   Initialize workspace
 ;   Invoke provider
 ;   Display screen
 ;   Read commands
 ;   Dispatch commands
 ;===============================================================

START ;
 D INIT^WVECWS
 D BUILD^WVECGLOB
 D MAIN
 Q

MAIN ;
 N TYPE

 F  D  Q:TYPE="QUIT"
 . D SHOW^WVECDSP
 . D READ^WVECCMD
 . S TYPE=$G(^TMP($J,"WVEC","CMD","TYPE"))
 . D EXEC(TYPE)

 Q

EXEC(TYPE) ;

 I TYPE="NEXT" D NEXT Q
 I TYPE="PREV" D PREV Q
 I TYPE="TOP" D TOP Q
 I TYPE="UP" D UP Q
 I TYPE="REFRESH" D REFRESH Q
 I TYPE="SELECT" D SELECT Q
 I TYPE="UNKNOWN" D UNKNOWN Q

 Q

SELECT ;
 N NUM

 S NUM=$G(^TMP($J,"WVEC","CMD","NUMBER"))

 D SELECT^WVECGLOB(NUM)

 Q

NEXT ;
 W !!
 W "*** NEXT PAGE (Not Implemented Yet) ***"
 D PAUSE^WVECUTIL
 Q

PREV ;
 W !!
 W "*** PREVIOUS PAGE (Not Implemented Yet) ***"
 D PAUSE^WVECUTIL
 Q

TOP ;
 D BUILD^WVECGLOB
 Q

UP ;
 D BUILD^WVECGLOB
 Q

REFRESH ;
 D BUILD^WVECGLOB
 Q

UNKNOWN ;
 W !!
 W "Unknown command."
 D PAUSE^WVECUTIL
 Q

TEST ;
 D START
 Q

 ;===============================================================
 ; End of WVECNAV
 ;===============================================================
