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

INIT(CTX) ;

 S CTX("LEVEL")=0
 K CTX("SUB")

 Q

TITLE(CTX)

 N ROOT
 N LEVEL
 N SUB
 N I

 S ROOT=$G(CTX("ROOT"))
 S LEVEL=+$G(CTX("LEVEL"))

 F I=1:1:LEVEL S SUB(I)=CTX("SUB",I)

 Q $$REF^WVECUTIL(ROOT,LEVEL,.SUB)

SELECT(CTX,VALUE)

 N LEVEL

 S LEVEL=+$G(CTX("LEVEL"))
 S LEVEL=LEVEL+1

 S CTX("LEVEL")=LEVEL
 S CTX("SUB",LEVEL)=VALUE

 Q

UP(CTX)

 N LEVEL

 S LEVEL=+$G(CTX("LEVEL"))

 Q:LEVEL<1

 K CTX("SUB",LEVEL)
 S CTX("LEVEL")=LEVEL-1

 Q

TOP(CTX)
 K CTX("SUB")
 S CTX("LEVEL")=0

 Q

EN ; Menu entry point

 DO EXPLORE("^DIC")

 Q

EXPLORE(ROOT) ;

 N CTX

 S CTX("PROVIDER")="WVECGLOB"
 S CTX("ROOT")=ROOT

 D EXPLORE^WVECNAV(.CTX)

 Q

HELP ;

 W !!
 W "WVEC Global Explorer",!
 W "Explore globals one subscript level at a time.",!

 Q


 ;===============================================================
 ; Internal Implementation
 ;===============================================================
LIST(CTX,LIST,COUNT) ;

 N ROOT
 N LEVEL
 N SUB
 N I
 N CURRENT
 N BASE
 N CHILD

 K LIST

 S ROOT=$G(CTX("ROOT"))
 S LEVEL=+$G(CTX("LEVEL"))

 F I=1:1:LEVEL S SUB(I)=CTX("SUB",I)

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
