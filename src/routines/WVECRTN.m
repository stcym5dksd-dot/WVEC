WVECRTN ; WorldVistA Routine Provider
 ;;5.1;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ;---------------------------------------------------------
 ; WorldVistA Engineering Console
 ;
 ; Routine Navigation Provider
 ;
 ; Provider Interface
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
 K LIST
 ;
 I $G(CTX("MODE"))="LIST" D  Q
 . S COUNT=5
 . S LIST(1)="DI"
 . S LIST(2)="DIC"
 . S LIST(3)="DIE"
 . S LIST(4)="XUP"
 . S LIST(5)="XINDEX"
 ;
 I $G(CTX("MODE"))="MENU" D  Q
 . S COUNT=3
 . S LIST(1)="Header"
 . S LIST(2)="Labels"
 . S LIST(3)="Source"
 ;
 S COUNT=0
 Q
 ;
SELECT(CTX,ITEM) ; Process selection
 I $G(CTX("MODE"))="LIST" D  Q
 . S CTX("ROUTINE")=ITEM
 . S CTX("MODE")="MENU"
 ;
 I $G(CTX("MODE"))="MENU" D  Q
 . S CTX("ACTION")=ITEM
 Q
 ;
UP(CTX) ; Navigate up
 I $G(CTX("MODE"))="MENU" D
 . S CTX("MODE")="LIST"
 . K CTX("ROUTINE")
 Q
 ;
TOP(CTX) ; Return to top
 D INIT(.CTX)
 Q
 ;
VERSION() ;
 Q "5.1"
