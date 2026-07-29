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
 ;===============================================================
 ; Provider Interface
 ;===============================================================

INIT(ROOT) ;

 S ^TMP($J,"WVECGLOB","ROOT")=ROOT
 S ^TMP($J,"WVECGLOB","LEVEL")=0
 K ^TMP($J,"WVECGLOB","SUB")

 Q


TITLE()

 NEW ROOT
 NEW LEVEL
 NEW SUB
 NEW I

 S ROOT=$G(^TMP($J,"WVECGLOB","ROOT"))
 S LEVEL=+$G(^TMP($J,"WVECGLOB","LEVEL"))

 F I=1:1:LEVEL S SUB(I)=^TMP($J,"WVECGLOB","SUB",I)

 Q $$REF^WVECUTIL(ROOT,LEVEL,.SUB)


SELECT(VALUE)

 NEW LEVEL

 S LEVEL=+$G(^TMP($J,"WVECGLOB","LEVEL"))

 S LEVEL=LEVEL+1

 S ^TMP($J,"WVECGLOB","LEVEL")=LEVEL
 S ^TMP($J,"WVECGLOB","SUB",LEVEL)=VALUE

 Q


UP

 NEW LEVEL

 S LEVEL=+$G(^TMP($J,"WVECGLOB","LEVEL"))

 Q:LEVEL<1

 K ^TMP($J,"WVECGLOB","SUB",LEVEL)
 S ^TMP($J,"WVECGLOB","LEVEL")=LEVEL-1

 Q


TOP

 K ^TMP($J,"WVECGLOB","SUB")
 S ^TMP($J,"WVECGLOB","LEVEL")=0

 Q

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


 I CURRENT["(" D
 . S BASE=$E(CURRENT,1,$L(CURRENT)-1)_","
 E  D
 . S BASE=CURRENT_"("

 S COUNT=0
 S CHILD=""

 F  S CHILD=$O(@(BASE_""""_CHILD_""""_")")) Q:CHILD=""  D
 . S COUNT=COUNT+1
 . S LIST(COUNT)=CHILD
 . Q:COUNT=20
 Q


CURRENT(ROOT,LEVEL,SUB)

 Q $$REF^WVECUTIL(ROOT,LEVEL,.SUB)


PUSH(LEVEL,SUB,VALUE)

 S LEVEL=LEVEL+1
 S SUB(LEVEL)=VALUE

 Q
