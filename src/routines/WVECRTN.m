WVECRTN ; WorldVistA Routine Explorer Provider
 ;;5.2;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ;---------------------------------------------------------
 ; WorldVistA Engineering Console
 ;
 ; Routine Navigation Provider
 ;
 ; Provider Interface
 ;   EN
 ;   TITLE()
 ;   INIT()
 ;   LIST()
 ;   SELECT()
 ;   UP()
 ;   TOP()
 ;
 ; Allan S. Finkelstein
 ; July 2026
 ;---------------------------------------------------------
 ;
EN ; Launch Routine Explorer
 NEW ROOT
 S ROOT=""
 D START^WVECNAV("WVECRTN",ROOT)
 Q
 ;
TITLE(CTX) ; Return screen title
 I $G(CTX("MODE"))="MENU" Q "Routine Menu"
 Q "Routine Explorer"
 ;
INIT(CTX) ; Initialize provider
 K CTX("STACK")
 S CTX("LEVEL")=0
 S CTX("MODE")="LIST"
 S CTX("PAGE")=1
 K CTX("ROUTINE")
 Q
 ;
LIST(CTX,LIST,COUNT) ; Build current list
 NEW RTN

 K LIST
 S COUNT=0

 I $G(CTX("MODE"))="LIST" D  Q
 . S RTN=""
 . F  S RTN=$O(^DIC(9.8,"B",RTN)) Q:RTN=""  D
 . . S COUNT=COUNT+1
 . . S LIST(COUNT)=RTN

 I $G(CTX("MODE"))="MENU" D
 . S COUNT=4
 . S LIST(1)="First Line"
 . S LIST(2)="Entry Points"
 . S LIST(3)="Routine Size"
 . S LIST(4)="Back"
 Q
 ;
SELECT(CTX,ITEM) ; Handle selection
 I $G(CTX("MODE"))="LIST" D  Q
 . S CTX("ROUTINE")=ITEM
 . S CTX("MODE")="MENU"
 . D PUSH^WVECNAV(.CTX,ITEM)

 I ITEM="Back" D  Q
 . D POP^WVECNAV(.CTX)
 . S CTX("MODE")="LIST"

 I ITEM="First Line" D
 . W !!,$T(@CTX("ROUTINE"))
 . R !!,"Press ENTER to continue...",X
 . Q

 I ITEM="Entry Points" D
 . W !!,"Entry point display not yet implemented."
 . R !!,"Press ENTER to continue...",X
 . Q

 I ITEM="Routine Size" D
 . W !!,"Routine statistics not yet implemented."
 . R !!,"Press ENTER to continue...",X
 . Q
 Q
 ;
UP(CTX) ; Navigate up
 I $G(CTX("MODE"))="MENU" D
 . D POP^WVECNAV(.CTX)
 . S CTX("MODE")="LIST"
 Q
 ;
TOP(CTX) ; Return to top
 K CTX("STACK")
 S CTX("LEVEL")=0
 S CTX("MODE")="LIST"
 K CTX("ROUTINE")
 S CTX("PAGE")=1
 Q
 ;
