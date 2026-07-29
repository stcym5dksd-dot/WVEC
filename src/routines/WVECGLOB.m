WVECGLOB ; WorldVistA Global Explorer
 ;;6.4;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Published Entry Points
 ;===============================================================
 ;
 ; EXPLORE(ROOT)
 ; HELP()
 ;
 ;===============================================================

EXPLORE(ROOT) ;

 NEW LEVEL
 NEW SUB
 NEW LIST
 NEW SEL
 NEW DONE

 S LEVEL=0
 K SUB

 S DONE=0

 F  Q:DONE  D
 . D LIST(ROOT,LEVEL,.SUB,.LIST)
 . W !
 . R "Selection (<Enter> quits): ",SEL:300
 . I '$T S DONE=1 Q
 . I SEL="" S DONE=1 Q
 . I '$D(LIST(+SEL)) D  Q
 . . W !,"Invalid selection."
 . . H 1
 . D PUSH(.LEVEL,.SUB,LIST(+SEL))

 Q


HELP ;

 W !!
 W "WVEC Global Explorer",!
 W "Explore globals one subscript level at a time.",!

 Q


 ;===============================================================
 ; Internal Implementation
 ;===============================================================

LIST(ROOT,LEVEL,SUB,LIST) ;

 N CURRENT
 N BASE
 N CHILD
 N COUNT

 K LIST

 S CURRENT=$$CURRENT(ROOT,LEVEL,.SUB)

 W !!
 W "Global Explorer",!
 W "Root: ",CURRENT,!!
 W "Children",!
 W "--------",!

 I CURRENT["(" D
 . S BASE=$E(CURRENT,1,$L(CURRENT)-1)_","
 E  D
 . S BASE=CURRENT_"("

 S COUNT=0
 S CHILD=""

 F  S CHILD=$O(@(BASE_""""_CHILD_""""_")")) Q:CHILD=""  D
 . S COUNT=COUNT+1
 . S LIST(COUNT)=CHILD
 . W !,$J(COUNT,3),". ",CHILD
 . Q:COUNT=20

 I COUNT=0 W !,"<No children>"

 Q


CURRENT(ROOT,LEVEL,SUB)

 Q $$REF^WVECUTIL(ROOT,LEVEL,.SUB)


PUSH(LEVEL,SUB,VALUE)

 S LEVEL=LEVEL+1
 S SUB(LEVEL)=VALUE

 Q
