WVECNAV ; WorldVistA Engineering Navigator
 ;;7.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Generic Menu Navigator
 ;
 ; Public Entry Point
 ;
 ;   RESULT=$$MENU^WVECNAV(.LIST,COUNT,TITLE)
 ;
 ; LIST()  = Local array of items
 ; COUNT   = Number of items
 ; TITLE   = Screen title
 ;
 ; Returns
 ;   >0  Selected item number
 ;    0  Quit
 ;   -1  Next page
 ;   -2  Previous page
 ;   -3  Up
 ;   -4  Top
 ;   -5  Refresh
 ;   -9  Help
 ;
 ; This routine knows NOTHING about globals,
 ; routines, KIDS, FileMan, etc.
 ;===============================================================

MENU(LIST,COUNT,TITLE) ;

 N PAGE
 N PAGESIZE
 N FIRST
 N LAST
 N LASTPAGE
 N INDEX
 N DISP
 N CMD
 N RESULT

 S PAGE=1
 S PAGESIZE=25
 S RESULT=""
 F  D  Q:RESULT'=""
 . W #
 . W "======================================================",!
 . W " ",$G(TITLE,"Navigator"),!
 . W "======================================================",!!
 . I COUNT=0 D  Q
 . . W "<Empty>",!!
 . . W "Q Quit   R Refresh",!!
 . . R "Selection: ",CMD:300
 . . S CMD=$$UP(CMD)
 . . I CMD="Q" S RESULT=0 Q
 . . I CMD="R" S RESULT=-5 Q
 . S LASTPAGE=((COUNT-1)\PAGESIZE)+1
 . S FIRST=((PAGE-1)*PAGESIZE)+1
 . S LAST=FIRST+PAGESIZE-1
 . I LAST>COUNT S LAST=COUNT
 . F INDEX=FIRST:1:LAST D
 . . S DISP=(INDEX-FIRST)+1
 . . W $J(DISP,2),". ",LIST(INDEX),!
 . W !
 . W "Showing ",FIRST,"-",LAST," of ",COUNT,!
 . W "Commands: Number  N  P  U  T  R  Q  ?",!!
 . R "Selection: ",CMD:300
 . I '$T S RESULT=0 Q
 . S CMD=$$UP(CMD)
 . I CMD="" S RESULT=0 Q
 . I CMD="Q" S RESULT=0 Q
 . I CMD="R" S RESULT=-5 Q
 . I CMD="U" S RESULT=-3 Q
 . I CMD="T" S RESULT=-4 Q
 . I CMD="N" D  Q
 . . I PAGE<LASTPAGE S PAGE=PAGE+1
 . . E  W !,"Already on last page." H 3
 . I CMD="?" D HELP Q
 . I CMD="P" D  Q
 . . I PAGE>1 S PAGE=PAGE-1
 . . E  W !,"Already on first page." H 3
 . I CMD?1.N D  Q
 . . N SEL
 . . S SEL=((PAGE-1)*PAGESIZE)+CMD
 . . I SEL<1!(SEL>COUNT) D  Q
 . . . W !,"Invalid selection." H 3
 . . S RESULT=SEL
 . W !,"Unknown command." H 3
 Q RESULT


HELP ;

 W !!
 W "WVEC Navigator",!
 W "--------------",!
 W "Number   Select item",!
 W "N        Next page",!
 W "P        Previous page",!
 W "U        Up one level",!
 W "T        Top level",!
 W "R        Refresh",!
 W "Q        Quit",!

 N X
 R !!,"Press RETURN: ",X:30

 Q


UP(X)

 Q $TR($G(X),"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
