WVECDEV ; WorldVistA Engineering Development Utilities
 ;;1.3;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; WVECDEV
 ;
 ; Development Utilities
 ;
 ; GO      Reload all WVEC routines and start Navigator
 ; RELOAD  Reload all WVEC routines
 ; LOAD    Reload one routine
 ; ABOUT   Display version information
 ; TEST    Self-test
 ;
 ;===============================================================

GO ;
 D RELOAD
 D TEST^WVECNAV
 Q

RELOAD ;
 W !,"Reloading WVEC routines...",!

 D LOAD("WVEC")
 D LOAD("WVECCMD")
 D LOAD("WVECDSP")
 D LOAD("WVECGLOB")
 D LOAD("WVECNAV")
 D LOAD("WVECREF")
 D LOAD("WVECTREE")
 D LOAD("WVECSTAT")
 D LOAD("WVECUTIL")
 D LOAD("WVECWS")

 W !,"Reload complete.",!
 Q

LOAD(RTN) ;
 W "  ",RTN," ..."
 ZLINK RTN
 W " OK",!
 Q

ABOUT ;
 W !!
 W "WorldVistA Engineering Console"
 W !
 W "Development Utilities"
 W !
 W "Version 1.3"
 W !
 W "Development Build"
 W !!
 Q

TEST ;
 D ABOUT
 D RELOAD
 W !,"Development utilities test completed.",!
 Q

 ;===============================================================
 ; End of WVECDEV
 ;===============================================================
