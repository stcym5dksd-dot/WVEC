```mumps
WVEC ; WorldVistA Engineering Console
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;------------------------------------------------------------------
 ; WorldVistA Engineering Console
 ;
 ; Developer:
 ;   Allan Steven Finkelstein
 ;
 ; Purpose:
 ;   Primary entry points for the WVEC package.
 ;
 ; This routine intentionally starts small. It provides package
 ; identification and service entry points that other routines will
 ; expand in future releases.
 ;------------------------------------------------------------------

 Q

VERSION() ; Return package version
 Q "1.0"

ABOUT ; Display package information
 W !!,"WorldVistA Engineering Console (WVEC)"
 W !,"Version: ",$$VERSION()
 W !,"Developer: Allan Steven Finkelstein"
 W !,"Platform : WorldVistA / YottaDB"
 Q

STATUS ; Initial engineering status
 W !!,"WVEC Engineering Status"
 W !,"-----------------------"
 W !,"Package : WorldVistA Engineering Console"
 W !,"Version : ",$$VERSION()
 W !,"Status  : Package framework initialized"
 Q
```
