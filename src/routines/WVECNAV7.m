WVECNAV7 ; WorldVistA Engineering Navigator
 ;;7.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;
 ; RESULT=$$MENU(.LIST,COUNT,TITLE)
 ;
 ; Returns
 ;   >0 selected item
 ;    0 quit
 ;   -1 next page
 ;   -2 previous page
 ;   -3 up
 ;   -4 top
 ;   -5 refresh
 ;   -9 help
 ;

MENU(LIST,COUNT,TITLE) ;

 N RESULT
 N PAGE
 N PAGESIZE
 N DONE

 S RESULT=0
 S PAGE=1 
 S PAGESIZE=25
 S DONE=0

 F  Q:DONE  D
 . D DISPLAY(.LIST,COUNT,TITLE,PAGE,PAGESIZE)
 . D READ(.RESULT,.DONE,PAGE,PAGESIZE,COUNT)

 Q RESULT


DISPLAY(LIST,COUNT,TITLE,PAGE,PAGESIZE) ;

 N FIRST
 N LAST
 N INDEX
 N NUMBER
 W "======================================================",!
 W " ",TITLE,!
 W "======================================================",!!

 I COUNT<1 D  Q
 . W "<Empty>",!!
 . W "Commands: Q R",!

 S FIRST=((PAGE-1)*PAGESIZE)+1
 S LAST=FIRST+PAGESIZE-1

 I LAST>COUNT S LAST=COUNT

 S INDEX=FIRST

 F  Q:INDEX>LAST  D
 . S NUMBER=(INDEX-FIRST)+1
 . W $J(NUMBER,2),". ",$G(LIST(INDEX)),!
 . S INDEX=INDEX+1

 W !
 W "Showing ",FIRST,"-",LAST," of ",COUNT,!
 W "Commands: Number N P U T R Q ?",!

 Q


READ(RESULT,DONE,PAGE,PAGESIZE,COUNT) ;

 N CMD
 N SEL

 R !!,"Selection: ",CMD:300

 I '$T S DONE=1,RESULT=0 Q

 S CMD=$$UP(CMD)

 I CMD="" S DONE=1,RESULT=0 Q

 I CMD="Q" S DONE=1,RESULT=0 Q

 I CMD="R" S DONE=1,RESULT=-5 Q

 I CMD="U" S DONE=1,RESULT=-3 Q

 I CMD="T" S DONE=1,RESULT=-4 Q

 I CMD="?" D HELP S RESULT=-9,DONE=1 Q

 I CMD="N" D  Q
 . I (PAGE*PAGESIZE)<COUNT S RESULT=-1
 . E  S RESULT=-1
 . S DONE=1

 I CMD="P" D  Q
 . S RESULT=-2
 . S DONE=1

 I CMD?1.N D  Q
 . S SEL=((PAGE-1)*PAGESIZE)+CMD
 . I SEL<1 S SEL=0
 . I SEL>COUNT S SEL=0
 . S RESULT=SEL
 . S DONE=1

 W !,"Invalid command."
 H 1

 Q


HELP ;

 N X

 W !!
 W "Number  Select item",!
 W "N       Next page",!
 W "P       Previous page",!
 W "U       Up",!
 W "T       Top",!
 W "R       Refresh",!
 W "Q       Quit",!

 R !!,"Press RETURN: ",X:30

 Q


UP(X)

 Q $TR($G(X),"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
