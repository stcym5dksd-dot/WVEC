WVECGLOB ; WVEC Global Explorer ; Jul 2026
 ;
 ;---------------------------------------------------------
 ; WorldVistA Engineering Console
 ;
 ; Read-only Global Explorer
 ;
 ; Version 1.1
 ; Adds simple paging (25 nodes per page)
 ;
 ;---------------------------------------------------------
 ;
 Q
 ;
EN ; Main Entry Point
 ;
 N ROOT,SUB,COUNT,PAGE,X,I
 S U="^"
 ;
 D BANNER^WVECUTIL("Global Explorer")
 ;
 R !,"Global (^): ^",ROOT
 Q:ROOT=""
 ;
 S ROOT="^"_ROOT
 ;
 ; Verify global exists
 I '$D(@ROOT) D  Q
 . W !!
 . W "Global not found."
 . W !!
 . D PAUSE^WVECUTIL
 ;
 S SUB=""
 S COUNT=0
 S PAGE=1
 ;
 F  D  Q:SUB=""
 . D BANNER^WVECUTIL("Global Explorer")
 . W !,"Global : ",ROOT
 . W !,"Page   : ",PAGE
 . W !!
 .
 . F I=1:1:25 D  Q:SUB=""
 . . S SUB=$O(@ROOT@(SUB))
 . . Q:SUB=""
 . . S COUNT=COUNT+1
 . . W !,$J(COUNT,5),". ",SUB
 .
 . Q:SUB=""
 .
 . W !!
 . R "Press ENTER for next page or '^' to quit: ",X
 . I X="^" S SUB="" Q
 . S PAGE=PAGE+1
 ;
 W !!
 W "Total Nodes Displayed: ",COUNT
 W !!
 ;
 D PAUSE^WVECUTIL
 Q
 ;
VERSION() ;
 Q "1.1"
