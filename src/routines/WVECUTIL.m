WVECUTIL ; WorldVistA Engineering Console Utility Library ; Jul 2026
 ;
 ;---------------------------------------------------------
 ; WVEC Utility Library
 ;---------------------------------------------------------
 ;
 Q
 ;
EN ;
 D INIT
 Q
 ;
INIT ; Initialize WVEC environment
 ;
 ; Standard VistA delimiter
 I '$D(U) S U="^"
 ;
 ; Screen clear
 D CLEAR
 ;
 Q
 ;
CLEAR ;
 ;
 ; Use IOF if defined, otherwise use form feed
 ;
 I $D(IOF),$G(IOF)'="" W @IOF
 E  W $C(12)
 Q
 ;
BANNER(TITLE) ;
 ;
 D CLEAR
 ;
 W !,"=========================================="
 W !,"     WorldVistA Engineering Console"
 W !,"=========================================="
 ;
 I $G(TITLE)'="" W !,TITLE
 ;
 W !!
 Q
 ;
LINE ;
 W !,"------------------------------------------",!
 Q
 ;
PAUSE ;
 N X
 R !,"Press RETURN to continue...",X
 Q
 ;
NOW() ;
 Q $H
 ;
VERSION() ;
 Q "1.1"
 ;
