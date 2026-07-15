WVECNAV ; WorldVistA Engineering Navigator
 ;;3.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;
 ; Generic Read-Only Navigation Engine
 ;
 ; Allan S. Finkelstein
 ; July 2026
 ;

 Q

EN(ROOT) ; Entry Point
 ;
 N PATH,SUB,COUNT,PAGE,X,I
 ;
 S PATH=ROOT
 ;
 F  D  Q:PATH=""
 . D DISPLAY(PATH)
 . R !,"Selection (Enter=Refresh,^=Exit): ",X
 . I X="^" S PATH="" Q
 ;
 Q


DISPLAY(PATH) ;
 ;
 N SUB,COUNT,ZERO,NAME
 ;
 D BANNER^WVECUTIL("Navigator")
 ;
 W !,"Current Path"
 W !,"------------"
 W !,PATH
 W !!
 W "Subscript",?15,"Description"
 W !,"---------",?15,"------------------------------"
 W !
 ;
 S SUB=""
 S COUNT=0
 ;
 F  S SUB=$O(@PATH@(SUB)) Q:SUB=""  D
 . S COUNT=COUNT+1
 . S ZERO=$G(@PATH@(SUB,0))
 . S NAME=$P(ZERO,U)
 . W $J(COUNT,4),". "
 . W SUB
 . I NAME'="" W ?15,NAME
 . W !
 ;
 W !!
 W "Entries: ",COUNT
 ;
 Q
