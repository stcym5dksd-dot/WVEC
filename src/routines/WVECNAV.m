WVECNAV ; WorldVistA Engineering Console Navigator
 ;;6.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Generic Navigator
 ;===============================================================

START(TYPE) ;
 D INIT(TYPE)

 F  Q:$$QUIT()  D
 . I $$DIRTY() D BUILD
 . D RENDER
 . D READ
 . D EXEC

 Q


INIT(TYPE) ;

 K ^TMP($J,"WVECNAV")

 S ^TMP($J,"WVECNAV","TYPE")=TYPE
 S ^TMP($J,"WVECNAV","PAGE")=1
 S ^TMP($J,"WVECNAV","SIZE")=20
 S ^TMP($J,"WVECNAV","DIRTY")=1
 S ^TMP($J,"WVECNAV","QUIT")=0

 Q


BUILD ; Build Navigation Workspace
 ;
 ; Purpose
 ;   Ask the active provider to build the workspace.
 ;

 I $$TYPE()="GLOB" D GLOB
 I $$TYPE()="RTN" D RTN
 I $$TYPE()="KIDS" D KIDS
 I $$TYPE()="FM" D FM

 D SETDIRTY(0)

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

RENDER ; Render Current Workspace
 ;
 ; Purpose
 ;   Display one page from the workspace.
 ;

 N COUNT
 N CURPAGE
 N PGSIZE
 N FIRST
 N LAST
 S COUNT=$$COUNT^WVECWS()
 S CURPAGE=$$PAGE()
 S PGSIZE=$$SIZE()

 S FIRST=((CURPAGE-1)*PGSIZE)+1
 S LAST=FIRST+PGSIZE-1
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
 ;   Read one navigator command.
 ;

 R !!,"Select: ",^TMP($J,"WVECNAV","CMD"):300

 Q

EXEC ; Execute Command
 ;
 ; Purpose
 ;   Execute one navigator command.
 ;

 N CMD

 S CMD=$$UP^XLFSTR($G(^TMP($J,"WVECNAV","CMD")))

 I CMD="Q" D  Q
 . S ^TMP($J,"WVECNAV","QUIT")=1
 I CMD="R" D  Q
 . D SETDIRTY(1)
 I CMD="N" D NEXT Q
 I CMD="P" D PREV Q
 I CMD="T" D TOP Q
 Q

NEXT ; Next Page
 D SETPAGE($$PAGE()+1)
 D SETDIRTY(1)
 Q
PREV ; Previous Page
 I $$PAGE()>1 D
 . D SETPAGE($$PAGE()-1)
 . D SETDIRTY(1)
 Q
TOP ; First Page
 D SETPAGE(1)
 D SETDIRTY(1)
 Q
QUIT() ;
 Q +$G(^TMP($J,"WVECNAV","QUIT"))


DIRTY() ;
 Q +$G(^TMP($J,"WVECNAV","DIRTY"))


SETDIRTY(VALUE) ;
 S ^TMP($J,"WVECNAV","DIRTY")=+VALUE
 Q
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
