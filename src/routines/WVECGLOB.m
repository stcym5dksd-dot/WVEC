WVECGLOB ; WorldVistA Global Explorer
 ;;6.3;WORLDVISTA ENGINEERING CONSOLE;;

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
 . ;
 . ; Temporary implementation.
 . ; Selection still returns the complete reference.
 . ;
 . D PARSE(ROOT,LIST(+SEL),.LEVEL,.SUB)

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
 N REF

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
 . K REF
 . S REF(1)=CHILD
 . S LIST(COUNT)=$$REF^WVECUTIL(CURRENT,1,.REF)
 . W !,$J(COUNT,3),". ",CHILD
 . Q:COUNT=20

 I COUNT=0 W !,"<No children>"

 Q


CURRENT(ROOT,LEVEL,SUB)

 Q $$REF^WVECUTIL(ROOT,LEVEL,.SUB)


PARSE(ROOT,REF,LEVEL,SUB)

 ;
 ; Temporary compatibility routine.
 ; For now we continue storing the full reference
 ; until the next refactoring phase.
 ;

 N X

 S LEVEL=0
 K SUB

 I REF=ROOT Q

 S X=$P(REF,"(",2,99)
 S X=$E(X,1,$L(X)-1)

 F  Q:X=""  D
 . S LEVEL=LEVEL+1
 . I X["," D
 . . S SUB(LEVEL)=$P(X,",")
 . . S X=$P(X,",",2,99)
 . E  D
 . . S SUB(LEVEL)=X
 . . S X=""
 . I SUB(LEVEL)?1"""".E1"""" S SUB(LEVEL)=$E(SUB(LEVEL),2,$L(SUB(LEVEL))-1)

 Q
