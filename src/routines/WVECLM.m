WVECLM ; WorldVistA Engineering Console - List Manager Prototype
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; WVEC Global Explorer (List Manager Prototype)
 ;
 ; Purpose:
 ;   Prototype implementation of the WVEC Global Explorer using
 ;   the native VistA List Manager framework.
 ;
 ;===============================================================

EN ; Entry point
 D EN^VALM("WVEC GLOBAL EXPLORER")
 Q


HDR ; Build header

 S VALMHDR(1)="WVEC Global Explorer"
 S VALMHDR(2)="Root: "_$G(WVROOT)

 Q


INIT ; Build display

 N SUB
 N LINE

 S WVROOT=$S($G(WVROOT)]"":WVROOT,1:"^DIC")

 K @VALMAR

 S LINE=0
 S SUB=""

 F  S SUB=$O(@(WVROOT_"("""_SUB_""")")) Q:SUB=""  D
 . S LINE=LINE+1
 . S @VALMAR@(LINE,0)=SUB

 S VALMCNT=LINE

 D HDR

 Q


HELP ;

 W !!
 W "WVEC Global Explorer Prototype",!
 W !
 W "This prototype demonstrates native List Manager paging.",!
 W !
 W "Selection and navigation will be added later.",!

 Q


EXIT ;

 Q


EXPND ;

 Q
