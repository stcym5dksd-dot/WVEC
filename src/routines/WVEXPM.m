WVEXPM ; WorldVistA Engineering Console - Explorer Manager
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Component : WVEC Explorer
 ; MVC Role  : MODEL
 ;
 ; Purpose:
 ;     Support routine for the WVEC Explorer.
 ;
 ;===============================================================

INIT ; Initialize Explorer
 D BUILD
 D HDR
 S VALMSG="Select an explorer item."
 Q

BUILD ; Build Explorer List
 K ^TMP("WVEXP",$J)

 S VALMAR="^TMP(""WVEXP"",$J)"
 S VALMCNT=0

 D ADD("WVEXP","Explorer Entry Point")
 D ADD("WVEXPM","Explorer Manager")
 D ADD("WVECNAV","Navigation Engine")

 Q

ADD(NAME,DESC) ; Add one entry to the list
 N LINE

 S VALMCNT=VALMCNT+1

 S LINE=$J(VALMCNT,3)_"  "_NAME

 I $L(DESC) D
 . S LINE=LINE_$J("",18-$L(NAME))_DESC

 S ^TMP("WVEXP",$J,VALMCNT,0)=LINE

 Q

HDR ; Display Header
 S VALMHDR(1)="WorldVistA Engineering Console"
 S VALMHDR(2)="WVEC Explorer"
 Q

HELP ; Display Help
 N X

 W !!
 W "Select an explorer item by number."
 W !
 W "Additional actions will be added as WVEC grows."
 W !!
 W "Press <RETURN> to continue..."
 R X:DTIME

 S VALMSG="Select an explorer item."

 Q

EXIT ; Exit Explorer
 S VALMBCK="Q"
 Q

 ;
 ; End of WVEXPM
 ;
