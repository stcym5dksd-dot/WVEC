WVECXIN ; WorldVistA Engineering Console - XINDEX Provider
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ; Minimal XINDEX Provider
 ;
 Q
 ;
ANALYZE(RTN) ; Analyze one routine
 ;
 N X,XCNP,DIF
 ;
 I $G(RTN)="" Q 0
 ;
 K ^UTILITY($J)
 ;
 ; Verify routine exists
 S X=RTN
 X ^%ZOSF("TEST")
 Q:'$T 0
 ;
 ; Load routine into ^UTILITY($J,1,...)
 S XCNP=0
 S DIF="^UTILITY("_$J_",1,RTN,0,"
 X ^%ZOSF("LOAD")
 S ^UTILITY($J,1,RTN,0,0)=XCNP-1
 ;
 ; Initialize XINDEX
 D SETUP^XINDX7
 ;
 ; Analyze the routine
 S INDLC=0
 D BEG^XINDEX
 ;
 Q 1
 ;
CLEAR ; Clear analysis data
 K ^UTILITY($J)
 Q
 ;
ROOT() ; Return analysis root
 Q $NA(^UTILITY($J,1))
 ;
VERSION() ; Provider version
 Q "1.0"
 ;
