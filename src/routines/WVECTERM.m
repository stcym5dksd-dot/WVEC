WVECTERM ;WVEC Terminal Test Utility
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

TEST ; Test screen handling
 ;
 W @IOF

 W "LINE 1",!
 W "LINE 2",!
 W "LINE 3",!
 W "LINE 4",!
 W "LINE 5",!

 W !
 R "Press RETURN: ",X

 Q

HEADER ; Test header display
 ;
 W @IOF

 W "WVEC Global Explorer",!
 W "Root    : ^DIC",!
 W "Current : ^DIC",!
 W "Level   : 0",!
 W "Path    : ^DIC",!

 W !
 W "------------------------------------------------------------"
 W !

 W !,"  1) .11"
 W !,"  2) .2"
 W !,"  3) .31"
 W !,"  4) .4"
 W !,"  5) .401"

 W !!
 R "Press RETURN: ",X

 Q
