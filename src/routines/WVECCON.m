WVECCON ; WorldVistA Engineering Constants
 ;;3.0;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ;===============================================================
 ; Component     : Constants Library
 ; MVC Role      : Framework Support
 ; Specification : ES-018
 ;
 ; Purpose:
 ;     Centralized framework constants used throughout WVEC.
 ;
 ; Notes:
 ;     - No globals
 ;     - No side effects
 ;     - Functions return literal values only
 ;===============================================================
 ;
 Q
 ;
 ;===============================================================
 ; Navigator Session Constants
 ;===============================================================
 ;
NAVROOT() ; Navigator session root
 Q "WVECNAV"
 ;
PROVIDER() ; Provider name
 Q "PROVIDER"
 ;
CONTEXT() ; Provider context
 Q "CONTEXT"
 ;
PAGE() ; Current page
 Q "PAGE"
 ;
COUNT() ; Item count
 Q "COUNT"
 ;
LIST() ; Item list
 Q "LIST"
 ;
DONE() ; Session complete flag
 Q "DONE"
 ;
PAGESIZE() ; Default page size
 Q 25
 ;
 ;===============================================================
 ; Framework Information
 ;===============================================================
 ;
VERSION() ; WVEC framework version
 Q "3.0"
 ;
SPEC() ; Engineering specification
 Q "ES-018"
 ;
 ;===============================================================
 ; End of Routine
 ;===============================================================
