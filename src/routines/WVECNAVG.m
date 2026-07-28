WVECNAVG ; WorldVistA Engineering Generic Navigator
 ;;3.0;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ;===============================================================
 ; Component     : Generic Navigation Engine
 ; MVC Role      : Framework
 ; Specification : ES-019
 ;
 ; Purpose:
 ;     Generic navigation services for all WVEC explorers.
 ;
 ; Provider Interface:
 ;     GETLIST(CONTEXT,LIST,COUNT)
 ;     SELECT(CONTEXT,ITEM)
 ;===============================================================
 ;
 Q
 ;
START(PROVIDER,CONTEXT) ;
 D INIT(PROVIDER,CONTEXT)
 D RUN
 D CLEANUP
 Q
 ;
INIT(PROVIDER,CONTEXT) ;
 N ROOT
 S ROOT=$$NAVROOT^WVECCON
 K ^TMP($J,ROOT)
 S ^TMP($J,ROOT,$$PROVIDER^WVECCON)=PROVIDER
 S ^TMP($J,ROOT,$$CONTEXT^WVECCON)=$G(CONTEXT)
 S ^TMP($J,ROOT,$$PAGE^WVECCON)=1
 S ^TMP($J,ROOT,$$DONE^WVECCON)=0
 D REFRESH
 Q
 ;
RUN ;
 F  D  Q:$$DONE()
 . D RENDER
 . D COMMAND
 Q
 ;
CLEANUP ;
 K ^TMP($J,$$NAVROOT^WVECCON)
 Q
 ;
REFRESH ;
 ; Implement next
 Q
 ;
RENDER ;
 ; Implement next
 Q
 ;
COMMAND ;
 ; Implement next
 Q
 ;
DONE() ;
 Q +$G(^TMP($J,$$NAVROOT^WVECCON,$$DONE^WVECCON))
 ;
QUIT ;
 S ^TMP($J,$$NAVROOT^WVECCON,$$DONE^WVECCON)=1
 Q
