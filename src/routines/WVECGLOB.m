WVECGLOB ; WVEC Global Navigator ; Jul 2026
 ;;3.0;WORLDVISTA ENGINEERING CONSOLE;;

 Q

EN ; Main Entry Point
 ;
 N ROOT,SUB,COUNT,PAGE,X,I,ZERO,NAME
 S U="^"
 ;
 D BANNER^WVECUTIL("Global Navigator")
 ;
 R !,"Global (^): ^",ROOT
 Q:ROOT=""
 ;
 S ROOT="^"_ROOT
 ;
 ; Verify global exists
 I '$D(@ROOT) D  Q
 . W !!,"Global not found.",!!
 . D PAUSE^WVECUTIL
 ;
 S SUB=""
 S COUNT=0
 S PAGE=1
 ;
 F  D  Q:SUB=""
 . D BANNER^WVECUTIL("Global Navigator")
 . W !,"Global : ",ROOT
 . W !,"Page   : ",PAGE
 . W !!
 . W "Subscript",?15,"Description"
 . W !,"---------",?15,"------------------------------"
 . W !
 .
 . F I=1:1:25 D  Q:SUB=""
 . . S SUB=$O(@ROOT@(SUB))
 . . Q:SUB=""
 . .
 . . S COUNT=COUNT+1
 . . S ZERO=$G(@ROOT@(SUB,0))
 . . S NAME=$P(ZERO,U)
 . .
 . . W $J(COUNT,4),". "
 . . W SUB
 . . I NAME'="" W ?15,NAME
 . . W !
 .
 . Q:SUB=""
 .
 . W !!
 . R "Press ENTER for next page or '^' to quit: ",X
 . I X="^" S SUB="" Q
 . S PAGE=PAGE+1
 ;
 W !!
 W "Total Entries Displayed: ",COUNT
 W !!
 ;
 D PAUSE^WVECUTIL
 Q

VERSION() ;
 Q "3.0"
