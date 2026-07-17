WVECNAV ; WorldVistA Engineering Navigator
 ;;3.3;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ; Generic Read-Only Navigation Engine
 ;
 ; Allan S. Finkelstein
 ; July 2026
 ;
 ;
 Q
 ;
EN(ROOT) ; Entry Point
 ;
 N PATH,SEL,MAP
 ;
 S PATH=ROOT
 ;
 F  D  Q:PATH=""
 . K MAP
 . D DISPLAY(PATH,.MAP)
 . W !
 . R "Selection (Number,Enter,^): ",SEL
 . ;
 . I SEL="" Q
 . I SEL="^" S PATH="" Q
 . ;
 . I SEL?1.N,$D(MAP(SEL)) D  Q
 . . S PATH=$$BUILD(PATH,MAP(SEL))
 . ;
 . W !,"Invalid selection."
 . H 2
 ;
 Q
 ;
DISPLAY(PATH,MAP)
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
 W "No.",?6,"Subscript",?25,"Description"
 W !
 W "---",?6,"---------",?25,"------------------------------"
 W !
 ;
 S SUB=""
 S COUNT=0
 ;
 F  S SUB=$O(@PATH@(SUB)) Q:SUB=""  D
 . S COUNT=COUNT+1
 . S MAP(COUNT)=SUB
 . S ZERO=$G(@PATH@(SUB,0))
 . S NAME=$P(ZERO,U)
 . W $J(COUNT,3),". ",SUB
 . I NAME'="" W ?25,NAME
 . W !
 ;
 W !!
 W "Entries: ",COUNT
 Q
 ;
BUILD(PATH,SUB)
 ;
 I SUB?1.N Q PATH_"("_SUB_")"
 Q PATH_"("""_SUB_""")"
 ;
VERSION()
 Q "3.3"
