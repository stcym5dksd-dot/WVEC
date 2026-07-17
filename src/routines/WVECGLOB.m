WVECGLOB ; WVEC Global Explorer
 ;;3.2;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ;---------------------------------------------------------
 ; WorldVistA Engineering Console
 ;
 ; Read-only Global Explorer
 ;
 ; Version 3.2
 ;
 ;---------------------------------------------------------
 ;

 Q

EN ; Main Entry Point
 ;
 N ROOT,SUB,COUNT,PAGE,X,I,FIRST,LAST,ZERO,NAME,START
 ;
 S U="^"

 ;D BANNER^WVECUTIL("Global Explorer")

 R !,"Global (^): ^",ROOT
 Q:ROOT=""

 S ROOT="^"_ROOT

 ; Verify global exists
 I '$D(@ROOT) D  Q
 . W !!,"Global not found."
 . W !!
 . D PAUSE^WVECUTIL

 ;
 ; Gather summary information
 ;
 S FIRST=$O(@ROOT@(""))

 S LAST=""
 S SUB=""
 F  S SUB=$O(@ROOT@(SUB)) Q:SUB=""  S LAST=SUB

 W !!
 W "WVEC Global Explorer Version 3.2"
 W !!
 W "Global Information"
 W !,"------------------"
 W !,"Global      : ",ROOT
 W !,"First Node  : ",FIRST
 W !,"Last Node   : ",LAST
 W !!

 ;
 ; Initialize paging
 ;
 S SUB=""
 S COUNT=0
 S PAGE=1
 S START(1)=""

 F  D  Q:SUB=""
 . D BANNER^WVECUTIL("Global Explorer")
 . W !
 . W "Global : ",ROOT
 . W !,"Page   : ",PAGE
 . W !!
 . W "Subscript",?15,"Description"
 . W !,"---------",?15,"------------------------------"
 . ;
 . S START(PAGE)=SUB
 . ;
 . F I=1:1:25 D  Q:SUB=""
 . . S SUB=$O(@ROOT@(SUB))
 . . Q:SUB=""
 . . S COUNT=COUNT+1
 . . S ZERO=$G(@ROOT@(SUB,0))
 . . S NAME=$P(ZERO,U)
 . . W !,$J(COUNT,4),". ",SUB
 . . I NAME'="" W ?15,NAME
 . ;
 . Q:SUB=""
 . ;
 . W !!
 . W "N=Next  P=Previous  R=Restart  Q=Quit"
 . R !,"Command: ",X
 . S X=$TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
 . ;
 . I X="Q" S SUB="" Q
 . ;
 . I X="N" D  Q
 . . S PAGE=PAGE+1
 . ;
 . I X="R" D  Q
 . . S PAGE=1
 . . S SUB=""
 . . S COUNT=0
 . ;
 . I X="P",PAGE>1 D  Q
 . . S PAGE=PAGE-1
 . . S SUB=START(PAGE)
 . . S COUNT=(PAGE-1)*25
 . ;
 . W !,"Invalid command."

 W !!
 W "Total Nodes Displayed: ",COUNT
 W !!

 D PAUSE^WVECUTIL

 Q

VERSION() ;
 Q "3.2"
