WVECGLOB ; WorldVistA Global Explorer
 ;;4.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;---------------------------------------------------------------
 ; Global Explorer Provider for WVECNAV
 ;---------------------------------------------------------------

EN ;
 N ROOT

 W !
 R "Global (^): ^",ROOT
 Q:ROOT=""

 S ROOT="^"_ROOT

 I '$D(@ROOT) W !,"Global not found." H 2 Q

 D START^WVECNAV("WVECGLOB",ROOT)
 Q

 ;
 ; ===== Provider Interface =====
 ;

TITLE() ;
 Q "Global Explorer"

INIT(ROOT,PATH) ;
 K PATH
 S PATH=ROOT
 Q

LIST(PATH,LIST,COUNT) ;
 N SUB
 K LIST
 S COUNT=0

 S SUB=""
 F  S SUB=$O(@PATH@(SUB)) Q:SUB=""  D
 . S COUNT=COUNT+1
 . S LIST(COUNT)=SUB

 Q

SELECT(PATH,ITEM) ;
 S PATH=PATH_"("_$S(ITEM?1.N:ITEM,1:""""_ITEM_"""")_")"
 Q

UP(PATH,ROOT) ;
 I PATH=ROOT Q
 N X
 S X=PATH
 S X=$E(X,1,$L(X)-1)
 F  Q:X=""  Q:$E(X,$L(X))="("  S X=$E(X,1,$L(X)-1)
 I X'="" S PATH=$E(X,1,$L(X)-1)
 E  S PATH=ROOT
 Q

TOP(PATH,ROOT) ;
 S PATH=ROOT
 Q
