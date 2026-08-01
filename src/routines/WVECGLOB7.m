WVECGLOB7 ; WorldVistA Global Explorer
 ;;7.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;
 ; Simple Global Explorer
 ;
 ; EN
 ; EXPLORE(ROOT)
 ;

EN ;
 D EXPLORE("^DIC")
 Q

EXPLORE(ROOT) ;

 N CURRENT
 N RESULT
 N COUNT
 N LIST

 S CURRENT=ROOT
 F  D  Q:RESULT=0
 . D CLEAR^WVECUTIL
 . D BUILD(CURRENT,.LIST,.COUNT)
 . S RESULT=$$MENU^WVECNAV7(.LIST,COUNT,CURRENT)
 . D ACTION(.CURRENT,.LIST,COUNT,RESULT)
 Q
ACTION(CURRENT,LIST,COUNT,RESULT) ;

 I RESULT=0 Q

 I RESULT=-3 D  Q
 . S CURRENT=$$UP(CURRENT)

 I RESULT<1 Q

 S CURRENT=$$DOWN(CURRENT,LIST(RESULT))

 Q

BUILD(ROOT,LIST,COUNT) ;

 N BASE
 N SUB

 K LIST

 S COUNT=0

 I ROOT["(" D
 . S BASE=$E(ROOT,1,$L(ROOT)-1)_","
 E  D
 . S BASE=ROOT_"("

 S SUB=""

 F  S SUB=$O(@(BASE_""""_SUB_""""_")")) Q:SUB=""  D
 . S COUNT=COUNT+1
 . S LIST(COUNT)=SUB
 Q
DOWN(ROOT,SUB) ;

 N REF

 S REF=ROOT

 I REF["(" D
 . S REF=$E(REF,1,$L(REF)-1)_","
 E  D
 . S REF=REF_"("

 I $$ISNUM(SUB) D
 . S REF=REF_SUB_")"
 E  D
 . S REF=REF_""""_SUB_""""_")"

 Q REF
UP(ROOT) ;

 N I
 N LEVEL
 N CH

 ; Already at the top
 I ROOT'["(" Q ROOT

 ; Walk backwards to find the matching "("
 S LEVEL=1

 F I=$L(ROOT)-1:-1:1 D  Q:LEVEL=0
 . S CH=$E(ROOT,I)
 . I CH=")" S LEVEL=LEVEL+1 Q
 . I CH="(" S LEVEL=LEVEL-1

 ; No comma -> remove entire "(...)"
 I ROOT'["," Q $E(ROOT,1,I-1)

 ; Find last comma before the matching "("
 F  Q:$E(ROOT,I)=","  S I=I+1

 ; Trim after the comma
 Q $E(ROOT,1,I-1)_")"

ISNUM(X) ;

 I X?1"-".N Q 1
 I X?1"-".N1".".N Q 1
 I X?1".".N Q 1
 I X?1.N Q 1
 I X?1.N1".".N Q 1

 Q 0
