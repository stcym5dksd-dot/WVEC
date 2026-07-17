WVECTEST ; WorldVistA Engineering Console Test Suite
 ;;5.1;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ; Basic regression tests for WVEC
 ;

EN ;
 W !!
 W "===========================================",!
 W " WVEC Navigation Test Suite",!
 W "===========================================",!!
 D NAV
 W !!
 W "Test suite complete.",!!
 Q

NAV ;
 NEW CTX

 W !,"Navigation Kernel"

 ; Initialize a test context
 S CTX("ROOT")="^DIC"
 S CTX("PATH")="^DIC"
 S CTX("LEVEL")=0
 S CTX("STACK",0)="^DIC"

 ; PUSH test
 D PUSH^WVECNAV(.CTX,"^DIC(0)")
 I CTX("PATH")="^DIC(0)",CTX("LEVEL")=1 W !,"  PASS  PUSH"
 E  W !,"  FAIL  PUSH"

 ; POP test
 D POP^WVECNAV(.CTX)
 I CTX("PATH")="^DIC",CTX("LEVEL")=0 W !,"  PASS  POP"
 E  W !,"  FAIL  POP"

 Q
