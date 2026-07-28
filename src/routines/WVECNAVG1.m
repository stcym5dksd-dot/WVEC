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
 Q
 ;
REFRESH ;
 ;
 ;===============================================================
 ; Refresh provider list
 ;===============================================================
 ;
 N ROOT
 N PROVIDER
 N CONTEXT
 N COUNT
 N LIST
 N I
 ;
 S ROOT=$$NAVROOT^WVECCON
 ;
 S PROVIDER=$G(^TMP($J,ROOT,$$PROVIDER^WVECCON))
 S CONTEXT=$G(^TMP($J,ROOT,$$CONTEXT^WVECCON))
 ;
 K ^TMP($J,ROOT,$$LIST^WVECCON)
 ;
 K LIST
 S COUNT=0
 ;
 X "D GETLIST^"_PROVIDER_"(CONTEXT,.LIST,.COUNT)"
 ;
 F I=1:1:COUNT D
 . S ^TMP($J,ROOT,$$LIST^WVECCON,I)=LIST(I)
 ;
 S ^TMP($J,ROOT,$$COUNT^WVECCON)=COUNT
 ;
 Q
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
