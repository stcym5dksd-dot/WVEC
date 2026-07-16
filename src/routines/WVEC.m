WVEC ; WorldVistA Engineering Console
 ;;3.1;WORLDVISTA ENGINEERING CONSOLE;;
EN ; Entry Point
 D MENU
 Q

MENU ; Main Menu
 N X

 F  D  Q:X=0
 . W #
 . W !,"==============================================="
 . W !,"      WorldVistA Engineering Console"
 . W !,"==============================================="
 . W !
 . W " Engineering"
 . W !," -----------"
 . W !," 1  Engineering Doctor"
 . W !," 2  System Status"
 . W !
 . W " Explorers"
 . W !," ---------"
 . W !," 3  Global Explorer"
 . W !," 4  Routine Explorer"
 . W !," 5  KIDS Explorer"
 . W !
 . W " Information"
 . W !," -----------"
 . W !," 6  About"
 . W !
 . W !," 0  Exit"
 . W !
 . R "Select Option: ",X:300
 . S:'$T X=0
 . I X=1 D DOCTOR^WVECDOC Q
 . I X=2 D STATUS^WVECSTAT Q
 . I X=3 D EN^WVECGLOB Q
 . I X=4 D EN^WVECRTN Q
 . I X=5 D EN^WVECKIDS Q
 . I X=6 D ABOUT Q
 . I X'=0 W !,"Invalid selection." H 2
 Q

ABOUT ; Display version information
 N X
 W !!
 W "WorldVistA Engineering Console (WVEC)",!
 W "Version: ",$$VERSION(),!
 W "Engineering Workbench for WorldVistA",!
 W !
 R "Press RETURN to continue...",X
 Q

VERSION() ; Return version string
 Q "2.3-alpha"
