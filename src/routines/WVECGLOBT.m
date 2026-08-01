WVECGLOBT ; WorldVistA Global Explorer Tests
 ;;7.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;
 ; Regression tests for WVECGLOB7
 ;

EN ;

 N PASS
 N FAIL

 S PASS=0
 S FAIL=0

 W !!
 W "==========================================",!
 W " WVEC Global Explorer Tests",!
 W "==========================================",!!

 D TESTUP(.PASS,.FAIL)
 D TESTDOWN(.PASS,.FAIL)
 D TESTNUM(.PASS,.FAIL)

 W !!
 W "==========================================",!
 W "Passed : ",PASS,!
 W "Failed : ",FAIL,!

 I FAIL=0 W !,"ALL TESTS PASSED",!
 E  W !,"TEST FAILURES DETECTED",!

 Q


TESTUP(PASS,FAIL) ;

 W !,"Testing UP()",!

 D CHECK("UP1",$$UP^WVECGLOB7("^DIC(.11)")="^DIC",.PASS,.FAIL)

 D CHECK("UP2",$$UP^WVECGLOB7("^DIC(0,""GL"")")="^DIC(0)",.PASS,.FAIL)

 D CHECK("UP3",$$UP^WVECGLOB7("^DIC")="^DIC",.PASS,.FAIL)

 Q


TESTDOWN(PASS,FAIL) ;

 W !!,"Testing DOWN()",!

 D CHECK("DOWN1",$$DOWN^WVECGLOB7("^DIC",".11")="^DIC(.11)",.PASS,.FAIL)

 D CHECK("DOWN2",$$DOWN^WVECGLOB7("^DIC","B")="^DIC(""B"")",.PASS,.FAIL)

 D CHECK("DOWN3",$$DOWN^WVECGLOB7("^TMP","ABC")="^TMP(""ABC"")",.PASS,.FAIL)

 Q


TESTNUM(PASS,FAIL) ;

 W !!,"Testing ISNUM()",!

 D CHECK("NUM1",$$ISNUM^WVECGLOB7(".11"),.PASS,.FAIL)

 D CHECK("NUM2",$$ISNUM^WVECGLOB7("1.52101"),.PASS,.FAIL)

 D CHECK("NUM3",$$ISNUM^WVECGLOB7("200"),.PASS,.FAIL)

 D CHECK("NUM4",'$$ISNUM^WVECGLOB7("ABC"),.PASS,.FAIL)

 D CHECK("NUM5",'$$ISNUM^WVECGLOB7("%D"),.PASS,.FAIL)

 Q


CHECK(NAME,OK,PASS,FAIL) ;

 I OK D  Q
 . S PASS=PASS+1
 . W "  PASS  ",NAME,!

 S FAIL=FAIL+1
 W "  FAIL  ",NAME,!

 Q
