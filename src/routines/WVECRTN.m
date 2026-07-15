WVECRTN ; WVEC Routine Explorer ; Jul 2026
 ;
 ;---------------------------------------------------------
 ; WorldVistA Engineering Console
 ;
 ; Read-only Routine Explorer
 ;
 ; Version 1.0
 ;
 ;---------------------------------------------------------
 ;
 Q
 ;
EN ; Main Entry Point
 ;
 N RTN,PATH,LINE,COUNT
 S U="^"
 ;
 D BANNER^WVECUTIL("Routine Explorer")
 ;
 R !,"Routine: ",RTN
 Q:RTN=""
 ;
 ; Load the routine
 ZLINK RTN
 ;
 ; Read the first line
 S LINE=$TEXT(+1^@RTN)
 ;
 I LINE="" D  Q
 . W !!,"Routine not found."
 . W !!
 . D PAUSE^WVECUTIL
 ;
 W !
 W "Routine : ",RTN
 W !
 W "First Line"
 W "----------"
 W !
 W LINE
 W !!
 ;
 ; Count the number of lines
 S COUNT=1
 F  Q:$TEXT(+COUNT^@RTN)=""  S COUNT=COUNT+1
 S COUNT=COUNT-1
 ;
 W "Total Lines : ",COUNT
 W !!
 ;
 D PAUSE^WVECUTIL
 Q
 ;
VERSION() ;
 Q "1.0"
