WVECNODE ; WorldVistA Engineering Console - Node Inspector
 ;;2.4;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Node Inspector
 ;===============================================================
SHOW ; Display Current Node
 ;
 N REF
 N TYPE
 N VALUE
 N LEN
 N COUNT
 N SUB
 N FIRST
 N LAST
 N X

 S REF=$$CURRENT^WVECTREE()

 I REF="" D  Q
 . W !!,"No current node selected."
 . R !,"Press RETURN: ",X

 S TYPE=$D(@REF)
 S VALUE=$G(@REF)
 S LEN=$L(VALUE)

 S COUNT=0
 S FIRST=""
 S LAST=""
 S SUB=""

 F  S SUB=$O(@REF@(SUB)) Q:SUB=""  D
 . S COUNT=COUNT+1
 . I FIRST="" S FIRST=SUB
 . S LAST=SUB

 W @IOF
 W "============================================================",!
 W ?20,"WVEC Node Inspector",!
 W "============================================================",!!

 W "Reference  : ",REF,!

 I TYPE=0 W "Node Type  : Undefined",!
 I TYPE=1 W "Node Type  : Leaf",!
 I TYPE=10 W "Node Type  : Branch",!
 I TYPE=11 W "Node Type  : Branch + Data",!

 W "$DATA      : ",TYPE,!
 W "Children   : ",COUNT,!
 W "Value Len  : ",LEN,!

 I COUNT>0 D
 . W "First Child: ",FIRST,!
 . W "Last Child : ",LAST,!

 W !
 W "------------------------------------------------------------",!
 W "Value",!
 W "------------------------------------------------------------",!

 I VALUE="" W "<none>",!
 E  W VALUE,!

 I COUNT>0 D
 . W !
 . W "------------------------------------------------------------",!
 . W "First Children",!
 . W "------------------------------------------------------------",!
 . S SUB=""
 . S X=0
 . F  S SUB=$O(@REF@(SUB)) Q:SUB=""!(X=10)  D
 . . S X=X+1
 . . W !,SUB

 W !!
 W "============================================================",!
 R "Press RETURN: ",X

 Q
 ;===============================================================
 ; End of WVECNODE
 ;===============================================================
