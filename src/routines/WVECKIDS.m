WVECKIDS ; WorldVistA KIDS Explorer Provider
 ;;5.2;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ;---------------------------------------------------------
 ; WorldVistA Engineering Console
 ;
 ; KIDS Explorer Provider
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
EN ; Launch KIDS Explorer
 NEW ROOT
 S ROOT=""
 D START^WVECNAV("WVECKIDS",ROOT)
 Q
 ;
TITLE(CTX) ; Return screen title
 I $G(CTX("MODE"))="MENU" Q "KIDS Build Menu"
 Q "KIDS Explorer"
 ;
INIT(CTX) ; Initialize provider
 K CTX("STACK")
 S CTX("LEVEL")=0
 S CTX("MODE")="LIST"
 S CTX("PAGE")=1
 K CTX("BUILD")
 Q
 ;
LIST(CTX,LIST,COUNT) ; Build current list
 NEW IEN,NAME,U
 S U="^"

 K LIST
 S COUNT=0

 I $G(CTX("MODE"))="LIST" D  Q
 . S IEN=0
 . F  S IEN=$O(^XPD(9.6,IEN)) Q:'IEN  D
 . . S NAME=$P($G(^XPD(9.6,IEN,0)),U)
 . . Q:NAME=""
 . . S COUNT=COUNT+1
 . . S LIST(COUNT)=NAME

 I $G(CTX("MODE"))="MENU" D
 . S COUNT=4
 . S LIST(1)="Header"
 . S LIST(2)="Required Builds"
 . S LIST(3)="Package File"
 . S LIST(4)="Back"
 Q
 ;
SELECT(CTX,ITEM) ; Handle selection

 I $G(CTX("MODE"))="LIST" D  Q
 . S CTX("BUILD")=ITEM
 . S CTX("MODE")="MENU"
 . D PUSH^WVECNAV(.CTX,ITEM)

 I ITEM="Back" D  Q
 . D POP^WVECNAV(.CTX)
 . S CTX("MODE")="LIST"

 I ITEM="Header" D  Q
 . N IEN
 . S IEN=$O(^XPD(9.6,"B",CTX("BUILD"),0))
 . W !!
 . W "Build: ",CTX("BUILD"),!
 . I IEN>0 W $G(^XPD(9.6,IEN,0)),!
 . R !!,"Press ENTER to continue...",X

 I ITEM="Required Builds" D  Q
 . W !!
 . W "Required Build display not yet implemented."
 . R !!,"Press ENTER to continue...",X

 I ITEM="Package File" D  Q
 . W !!
 . W "Package information not yet implemented."
 . R !!,"Press ENTER to continue...",X

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
 K CTX("BUILD")
 S CTX("PAGE")=1
 Q
 ;
VERSION() ;
 Q "5.2"
 ;
