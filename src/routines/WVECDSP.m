WVECDSP ; WorldVistA Engineering Display Manager
 ;;1.1;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Display Manager
 ;
 ; Purpose:
 ;     Display the current WVEC workspace.
 ;
 ; Reads:
 ;     ^TMP($J,"WVEC")
 ;
 ; Owns:
 ;     Nothing
 ;
 ;===============================================================

SHOW ;
 D HEADER
 D LIST
 D FOOTER
 Q

HEADER ;
 D CLEAR^WVECUTIL

 D LINE^WVECUTIL("=",43)
 W !
 D CENTER^WVECUTIL("WorldVistA Engineering Console",43)
 W !
 D LINE^WVECUTIL("=",43)
 W !!

 Q

LIST ;
 N ROOT
 N CNT
 N I

 S ROOT=$$ROOT^WVECWS()
 S CNT=$G(@ROOT@("COUNT"))

 I 'CNT D  Q
 . W "<No Items>",!

 F I=1:1:CNT D
 . W $J(I,3),". "
 . W $G(@ROOT@("LIST",I,"NAME"))
 . W ?35,$G(@ROOT@("LIST",I,"DESC"))
 . W !

 Q

FOOTER ;

 W !!
 D LINE^WVECUTIL("-",43)
 W !
 W "N Next   P Prev   Enter Select   Q Quit"
 W !

 Q

TEST ;

 D INIT^WVECWS

 D SETSTAT^WVECWS("TESTING")
 D SETCNT^WVECWS(3)

 S ^TMP($J,"WVEC","LIST",1,"NAME")="Globals"
 S ^TMP($J,"WVEC","LIST",1,"DESC")="Browse Globals"

 S ^TMP($J,"WVEC","LIST",2,"NAME")="Routines"
 S ^TMP($J,"WVEC","LIST",2,"DESC")="Browse Routines"

 S ^TMP($J,"WVEC","LIST",3,"NAME")="KIDS"
 S ^TMP($J,"WVEC","LIST",3,"DESC")="Browse Install Builds"

 D SHOW

 Q
