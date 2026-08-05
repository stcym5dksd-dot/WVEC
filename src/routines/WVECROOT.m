WVECROOT ; WorldVistA Engineering Console - Root Selector
 ;;2.3;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Root Selection Services
 ;===============================================================
SELECT() ; Return selected root
 ;
 ; Returns:
 ;   Valid global root
 ;   "" if cancelled
 ;
 N ROOT

 S ROOT=$$DEFAULT()

 W !,"Enter Global (",ROOT,"): "
 R ROOT:300

 I ROOT="" S ROOT=$$DEFAULT()

 I '$$VALID(ROOT) D  Q ""
 . W !!,"Invalid global."
 . H 2

 Q ROOT
DEFAULT() ; Return default root
 ;
 Q "^DIC"

VALID(ROOT) ; Validate global root
 ;
 ; Returns:
 ;   1 = Valid
 ;   0 = Invalid
 ;
 I ROOT="" Q 0
 I $E(ROOT)'="^" Q 0

 ; Future validation will be added here.

 Q 1

PROMPT() ; Prompt for root
 ;
 ; Future interactive selector.
 ;
 Q

MENU() ; Display root selection menu
 ;
 ; Future menu of common globals.
 ;
 Q

 ;===============================================================
 ; End of WVECROOT
 ;===============================================================
