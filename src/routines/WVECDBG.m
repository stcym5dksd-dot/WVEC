WVECDBG ;WVEC Debug Trace Utility
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

ON ; Enable tracing
 S ^TMPXX($J,"WVEC","DEBUG")=1
 Q

OFF ; Disable tracing
 K ^TMPXX($J,"WVEC","DEBUG")
 Q

CLEAR ; Clear trace log
 K ^TMPXX($J,"WVEC","TRACE")
 Q

TRACE(TAG,MSG) ; Record one trace message
 N N
 Q:'$G(^TMPXX($J,"WVEC","DEBUG"))

 S N=$O(^TMPXX($J,"WVEC","TRACE",""),-1)+1

 S ^TMPXX($J,"WVEC","TRACE",N,"TAG")=TAG
 S ^TMPXX($J,"WVEC","TRACE",N,"MSG")=MSG

 Q

SHOW ; Display trace log
 N N

 S N=0
 F  S N=$O(^TMPXX($J,"WVEC","TRACE",N)) Q:'N  D
 . W !
 . W $J(N,3),"  "
 . W $G(^TMPXX($J,"WVEC","TRACE",N,"TAG"))
 . W "  "
 . W $G(^TMPXX($J,"WVEC","TRACE",N,"MSG"))

 Q

TEST ;
 D CLEAR
 D ON
 D TRACE("TEST","HELLO")
 D TRACE("TREE","OPEN ^DIC")
 D TRACE("NAV","RENDER")
 D SHOW
 D OFF
 Q
