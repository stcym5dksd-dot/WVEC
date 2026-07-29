WVECGLOB ; WorldVistA Global Explorer
 ;;6.2;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Published Entry Points
 ;===============================================================
 ;
 ; EXPLORE(ROOT)
 ; HELP()
 ;
 ;===============================================================

EXPLORE(ROOT) ;

 NEW CURRENT
 NEW LIST
 NEW SEL
 NEW DONE

 S CURRENT=ROOT
 S DONE=0

 F  Q:DONE  D
 . D LIST(CURRENT,.LIST)
 . W !
 . R "Selection (<Enter> quits): ",SEL:300
 . I '$T S DONE=1 Q
 . I SEL="" S DONE=1 Q
 . I '$D(LIST(+SEL)) D  Q
 . . W !,"Invalid selection."
 . . H 1
 . S CURRENT=LIST(+SEL)

 Q


HELP ;

 W !!
 W "WVEC Global Explorer",!
 W "Explore globals one subscript level at a time.",!

 Q


 ;===============================================================
 ; Internal Implementation
 ;===============================================================

LIST(ROOT,LIST) ;

 N BASE
 N SUB
 N COUNT
 N LEVEL
 N REF

 K LIST

 W !!
 W "Global Explorer",!
 W "Root: ",ROOT,!!
 W "Children",!
 W "--------",!

 ;
 ; Build base reference for $ORDER().
 ;
 I ROOT["(" D
 . S BASE=$E(ROOT,1,$L(ROOT)-1)_","
 E  D
 . S BASE=ROOT_"("

 S COUNT=0
 S SUB=""

 F  S SUB=$O(@(BASE_""""_SUB_""""_")")) Q:SUB=""  D
 . S COUNT=COUNT+1
 . K REF
 . S REF(1)=SUB
 . S LIST(COUNT)=$$REF^WVECUTIL(ROOT,1,.REF)
 . W !,$J(COUNT,3),". ",SUB
 . Q:COUNT=20

 I COUNT=0 W !,"<No children>"

 Q
