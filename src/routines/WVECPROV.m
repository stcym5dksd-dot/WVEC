WVECPROV ; WorldVistA Provider Dispatcher
 ;;3.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Generic Provider Dispatcher
 ;
 ; All browser engines call this routine instead of calling
 ; provider routines directly.
 ;===============================================================

INIT(PROVIDER) ;

 I PROVIDER="WVECGLOB" D INIT^WVECGLOB Q

 W !,"Unknown provider: ",PROVIDER
 Q


LIST(PROVIDER) ;

 I PROVIDER="WVECGLOB" D BUILD^WVECGLOB Q

 W !,"Unknown provider: ",PROVIDER
 Q


OPEN(PROVIDER,NUMBER) ;

 I PROVIDER="WVECGLOB" D SELECT^WVECGLOB(NUMBER) Q

 W !,"Unknown provider: ",PROVIDER
 Q


UP(PROVIDER) ;

 I PROVIDER="WVECGLOB" D UP^WVECGLOB Q

 W !,"Unknown provider: ",PROVIDER
 Q


TOP(PROVIDER) ;

 I PROVIDER="WVECGLOB" D TOP^WVECGLOB Q

 W !,"Unknown provider: ",PROVIDER
 Q


NAME() ;
 Q "WVEC Provider Dispatcher"

VERSION() ;
 Q "3.0"

TEST ;
 W !,"Dispatcher OK"
 D INIT("WVECGLOB")
 Q

 ;===============================================================
 ; End WVECPROV
 ;===============================================================
