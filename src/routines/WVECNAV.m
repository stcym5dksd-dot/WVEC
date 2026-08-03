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

RENDER ; Render Current Workspace
 ;
 ; Purpose
 ;   Display one page from the workspace.
 ;

 N COUNT
 N PAGE
 N SIZE
 N FIRST
 N LAST
 N I

 S COUNT=$$COUNT^WVECWS()

 S PAGE=1
 S SIZE=20

 S FIRST=((PAGE-1)*SIZE)+1
 S LAST=FIRST+SIZE-1

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

EXEC ;

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
