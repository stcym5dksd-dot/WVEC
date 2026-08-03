WVECNAV ; WorldVistA Engineering Console Navigator
 ;;5.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;=====================================================================
 ; WVECNAV - Generic Navigation Engine
 ;
 ; PURPOSE
 ;   Generic navigation framework for all WVEC explorers.
 ;
 ; DESIGN
 ;   Provider builds the navigation list.
 ;   Navigator renders the list and processes user commands.
 ;
 ; PROVIDER ENTRY POINTS
 ;   LIST
 ;   ENTER
 ;   UP
 ;
 ; NAVIGATOR DATA
 ;   ^TMP($J,"WVECNAV",0)=Count^Level
 ;   ^TMP($J,"WVECNAV",n,0)=Display Text
 ;   ^TMP($J,"WVECNAV",n,1)=Internal Data
 ;
 ; NAVIGATOR STATE
 ;   ^TMP($J,"WVECNAV","TYPE")
 ;   ^TMP($J,"WVECNAV","PAGE")
 ;   ^TMP($J,"WVECNAV","SIZE")
 ;   ^TMP($J,"WVECNAV","DIRTY")
 ;   ^TMP($J,"WVECNAV","QUIT")
 ;
 ;=====================================================================

START(TYPE) ; Start Navigator
 ;
 ; Purpose
 ;   Initialize navigator and enter command loop.
 ;
 ; External Inputs
 ;   TYPE - Provider type.
 ;
 ; External Outputs
 ;   None.
 ;

 D INIT(TYPE)

 F  Q:$$QUIT()  D
 . I $$DIRTY() D BUILD
 . D RENDER
 . D READ
 . D EXEC

 Q
 ;
 ; Purpose
 ;   Initialize navigator and enter command loop.
 ;
 ; External Inputs
 ;   TYPE - Provider type
 ;     GLOB
 ;     RTN
 ;     KIDS
 ;     FM
 ;
 ; External Outputs
 ;   None
 ;
 ; Calls
 ;   INIT
 ;   BUILD
 ;   RENDER
 ;   READ
 ;   EXEC
 ;
 D INIT(TYPE)

 F  Q:$$QUIT()  D
 . I $$DIRTY() D BUILD
 . D RENDER
 . D READ
 . D EXEC
 ;
 ; Initialize selected provider
 I TYPE="GLOB" D INIT^WVECGLOB Q
 I TYPE="RTN" D INIT^WVECRTN Q
 I TYPE="KIDS" D INIT^WVECKIDS Q
 I TYPE="FM" D INIT^WVECFM Q

 Q

INIT(TYPE) ; Initialize Navigator
 ;
 ; Purpose
 ;   Initialize navigator state.
 ;
 ; External Inputs
 ;   TYPE - Provider type.
 ;
 ; External Outputs
 ;   Initializes ^TMP($J,"WVECNAV")
 ;
 K ^TMP($J,"WVECNAV")

 S ^TMP($J,"WVECNAV","TYPE")=TYPE
 S ^TMP($J,"WVECNAV","PAGE")=1
 S ^TMP($J,"WVECNAV","SIZE")=20
 S ^TMP($J,"WVECNAV","DIRTY")=1
 S ^TMP($J,"WVECNAV","QUIT")=0

 Q
BUILD ; Build Navigation List
 ;
 ; Purpose
 ;   Build or rebuild the active provider.
 ;

 K ^TMP($J,"WVECNAV",0)

 I $$TYPE()="GLOB" D GLOB
 I $$TYPE()="RTN" D RTN
 I $$TYPE()="KIDS" D KIDS
 I $$TYPE()="FM" D FM

 D SETDIRTY(0)

 Q

RENDER ; Render Current Page
 ;
 ; Purpose
 ;   Display one page.
 ;
 N PAGE,SIZE
 N FIRST,LAST
 N COUNT
 N I

 S PAGE=$$PAGE()
 S SIZE=$$SIZE()

 S FIRST=((PAGE-1)*SIZE)+1
 S LAST=FIRST+SIZE-1
 S COUNT=$$COUNT^WVECWS()
 W @IOF
 W !
 W "WVEC Navigator"
 W !
 F I=FIRST:1:LAST Q:I>COUNT  D
 . W !,$J(I,3),") ",$$DISPLAY^WVECWS(I)
 W !!
 W "N Next   P Prev   T Top   U Up   R Refresh   Q Quit"

 Q

READ ; Read Command
 ;
 ; Purpose
 ;   Read navigator command.
 ;
 R !!,"Select: ",^TMP($J,"WVECNAV","CMD"):300

 Q

EXEC ; Execute Command
 ;
 ; Purpose
 ;   Execute user command.
 ;
 N CMD
S CMD=$$UP^XLFSTR($G(^TMP($J,"WVECNAV","CMD")))
W !,"EXEC CMD=<",CMD,">"

 I CMD="Q" S ^TMP($J,"WVECNAV","QUIT")=1 Q
 I CMD="N" D NEXT Q
 I CMD="P" D PREV Q
 I CMD="T" D TOP Q
 I CMD="U" D UP Q
 I CMD="R" D REFRESH Q

 I CMD?1.N D ENTER(+CMD)

 Q

NEXT ; Next Page
 D SETPAGE($$PAGE()+1)
 Q

PREV ; Previous Page
 I $$PAGE()>1 D SETPAGE($$PAGE()-1)
 Q

TOP ; First Page
 D SETPAGE(1)
 Q

REFRESH ; Refresh Current List
 D SETDIRTY(1)
 Q

UP ; Move Up One Level
 ;
 ; Purpose
 ;   Dispatch UP request to provider.
 ;
 N TYPE

 S TYPE=$$TYPE()

 I TYPE="GLOB" D UP^WVECGLOB Q
 I TYPE="RTN" D UP^WVECRTN Q
 I TYPE="KIDS" D UP^WVECKIDS Q
 I TYPE="FM" D UP^WVECFM Q

 D SETDIRTY(1)

 Q

ENTER(NUMBER) ; Enter Selected Item
 ;
 ; Purpose
 ;   Dispatch selected item to provider.
 ;
 ; External Inputs
 ;   NUMBER - Display line selected.
 ;
 N TYPE

 S TYPE=$$TYPE()

 I TYPE="GLOB" D ENTER^WVECGLOB(NUMBER) G ENTERX
 I TYPE="RTN" D ENTER^WVECRTN(NUMBER) G ENTERX
 I TYPE="KIDS" D ENTER^WVECKIDS(NUMBER) G ENTERX
 I TYPE="FM" D ENTER^WVECFM(NUMBER)

ENTERX ;
 D SETDIRTY(1)

 Q

QUIT() ; Return Quit Flag
 Q +$G(^TMP($J,"WVECNAV","QUIT"))

DIRTY() ; Return Dirty Flag
 Q +$G(^TMP($J,"WVECNAV","DIRTY"))

SETDIRTY(VALUE) ; Set Dirty Flag
 S ^TMP($J,"WVECNAV","DIRTY")=+VALUE
 Q

TYPE() ; Return Provider Type
 Q $G(^TMP($J,"WVECNAV","TYPE"))

PAGE() ; Return Current Page
 Q +$G(^TMP($J,"WVECNAV","PAGE"))

SETPAGE(PAGE) ; Set Current Page
 S ^TMP($J,"WVECNAV","PAGE")=+PAGE
 Q

SIZE() ; Return Page Size
 Q +$G(^TMP($J,"WVECNAV","SIZE"))

COUNT() ; Return Item Count
 Q $$COUNT^WVECWS()

GLOB ; Global Provider
 D INIT^WVECGLOB
 Q

RTN ; Routine Provider
 D LIST^WVECRTN
 Q

KIDS ; KIDS Provider
 D LIST^WVECKIDS
 Q

FM ; FileMan Provider
 D LIST^WVECFM
 Q
