WVEC ; WorldVistA Engineering Console
 ;;1.1;WORLDVISTA ENGINEERING CONSOLE;;

MENU ;
 N X

 F  D  Q:X=0
 . W @IOF
 . W !,"==============================================="
 . W !,"      WorldVistA Engineering Console"
 . W !,"==============================================="
 . W !
 . W !,"1  Engineering Doctor"
 . W !,"2  Status"
 . W !,"3  About"
 . W !,"0  Exit"
 . W !
 . R "Select Option: ",X:300
 . S:'$T X=0
 . I X=1 D DOCTOR^WVECDOC Q
 . I X=2 D STATUS^WVECSTAT Q
 . I X=3 D ABOUT Q
 . I X'=0 W !,"Invalid selection." H 2
 Q

ABOUT ;
 W !!
 W "WorldVistA Engineering Console (WVEC)",!
 W "Version: ",$$VERSION(),!
 W "Engineering Workbench for WorldVistA",!
 W !
 R "Press RETURN to continue...",X
 Q

VERSION() ;
 Q "1.1"
