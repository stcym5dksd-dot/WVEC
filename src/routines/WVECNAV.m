WVECNAV ; WorldVistA Engineering Navigator
 ;;3.1;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ; Generic Read-Only Navigation Engine
 ;
 ; Allan S. Finkelstein
 ; July 2026
 ;

 Q

EN(ROOT) ; Entry Point
 ;
 N PATH,SEL,REF
 ;
 S PATH=ROOT
 ;
 F  D  Q:PATH=""
 . D DISPLAY(PATH)
 . W !
 . R "Selection (Enter=Refresh,^=Exit,Subscript=Down): ",SEL
 . ;
 . I SEL="" Q
 . I SEL="^" S PATH="" Q
 . ;
 . ; Build the reference
 . S REF=PATH_"("_SEL_")"
 . ;
 . ; Temporary implementation for ^DIZ navigation.
 . ; This will be generalized in the next version.
 . I PATH="^DIZ",$D(^DIZ(SEL)) D  Q
 . . S PATH="^DIZ("_SEL_")"
 . ;
 . W !,"Subscript not found."
 . H 2
 ;
 Q

DISPLAY(PATH)
 ;
 N SUB,COUNT,ZERO,NAME
 ;
 D BANNER^WVECUTIL("Navigator")
 ;
 W !
 W "Current Path"
 W !
 W "------------"
 W !
 W PATH
 W !!
 W "Subscript",?15,"Description"
 W !
 W "---------",?15,"------------------------------"
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

VERSION() ;
 Q "3.1"
