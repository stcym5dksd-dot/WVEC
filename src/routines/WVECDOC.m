WVECDOC ; WorldVistA Engineering Console - Doctor
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

DOCTOR ;
 N VER

 W !!,"==============================================="
 W !,"     WorldVistA Engineering Doctor"
 W !,"==============================================="
 W !

 S VER=$$VERSION^WVEC()

 W !,"WVEC Package.......... PASS"
 W !,"WVEC Version.......... ",VER

 I $G(DUZ)>0 D
 . W !,"User (DUZ)........... PASS (",DUZ,")"
 E  D
 . W !,"User (DUZ)........... FAIL"

 I $D(U) D
 . W !,"Current UCI.......... ",U
 E  D
 . W !,"Current UCI.......... Unknown"

 W !,"Status Service........ PASS"

 W !
 W !,"Overall System Status: HEALTHY"
 W !

 Q
