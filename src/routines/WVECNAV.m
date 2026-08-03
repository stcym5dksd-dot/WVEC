WVECNAV ; WorldVistA Engineering Console Navigator
 ;;6.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Generic Navigator
 ;===============================================================

START(TYPE) ;
 D INIT(TYPE)

 F  Q:$$QUIT()  D
 . I $$DIRTY() D BUILD
 . D RENDER
 . D READ
 . D EXEC

 Q


INIT(TYPE) ;

 K ^TMP($J,"WVECNAV")

 S ^TMP($J,"WVECNAV","TYPE")=TYPE
 S ^TMP($J,"WVECNAV","PAGE")=1
 S ^TMP($J,"WVECNAV","SIZE")=20
 S ^TMP($J,"WVECNAV","DIRTY")=1
 S ^TMP($J,"WVECNAV","QUIT")=0

 Q


BUILD ;

 Q


RENDER ;

 Q


READ ;

 Q


EXEC ;

 Q


QUIT() ;
 Q +$G(^TMP($J,"WVECNAV","QUIT"))


DIRTY() ;
 Q +$G(^TMP($J,"WVECNAV","DIRTY"))


SETDIRTY(VALUE) ;
 S ^TMP($J,"WVECNAV","DIRTY")=+VALUE
 Q
