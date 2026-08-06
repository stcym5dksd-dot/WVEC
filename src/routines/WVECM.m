WVECM ; WorldVistA M Explorer
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

INIT ; Initialize Explorer
 D TOP
 Q

TOP ; Return to top level
 K ^TMP($J,"WVECM")
 D LIST
 Q

LIST ; Build routine list
 ;
 ; Phase 1:
 ; Display a fixed list to prove the provider works.
 ;
 D CLEAR^WVECWS

 D ADDITEM^WVECWS(1,"DI","","R","DI")
 D ADDITEM^WVECWS(2,"DIC","","R","DIC")
 D ADDITEM^WVECWS(3,"XINDEX","","R","XINDEX")
 D ADDITEM^WVECWS(4,"WVECNAV","","R","WVECNAV")
 D ADDITEM^WVECWS(5,"WVECM","","R","WVECM")

 D SETSTATE^WVECWS("COUNT",5)

 Q
BUILD ; Build Workspace
 D LIST
 Q
OPEN(NUMBER)
 Q

SELECT(NUMBER)
 Q 1

UP
 Q

REFRESH
 D LIST
 Q

HEADER

 W !
 W "============================================================",!
 W "                    WVEC M Explorer",!
 W "============================================================",!
 W !
 W "Location : Routines",!
 W !

 Q
