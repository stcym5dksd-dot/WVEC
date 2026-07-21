WVECUTIL ; WorldVistA Engineering Console Utility Library
 ;;3.2;WORLDVISTA ENGINEERING CONSOLE;;
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
 Q "3.2"
 ;
 ;=========================================================
 ; Navigation Utilities
 ;=========================================================
 ;
BUILDPATH(ROOT,STACK,LEVEL) ;
 ;
 ; Build a legal M global reference from a root and stack
 ;
 N PATH,I,SUB
 ;
 S PATH=ROOT
 ;
 I LEVEL<1 Q PATH
 ;
 S PATH=PATH_"("
 ;
 F I=1:1:LEVEL D
 . S SUB=$G(STACK(I))
 . I I>1 S PATH=PATH_","
 . I SUB?1N.N D
 . . S PATH=PATH_SUB
 . E  D
 . . S PATH=PATH_""""_$$ESCAPE(SUB)_""""
 ;
 S PATH=PATH_")"
 ;
 Q PATH
 ;
 ;=========================================================
 ; Append one subscript to an existing global reference
 ;=========================================================
 ;
APPENDSUB(PATH,SUB) ;
 ;
 ; Input:
 ;   PATH = existing valid global reference
 ;   SUB  = next subscript
 ;
 ; Returns:
 ;   Updated global reference
 ;
 N NEW,LAST

 S NEW=$G(PATH)

 ; Root only: ^DIC  -> ^DIC(1)
 I NEW'["(" D  Q NEW
 . I SUB?1N.N S NEW=NEW_"("_SUB_")"
 . E  S NEW=NEW_"("""_$$ESCAPE(SUB)_""")"

 ; Existing subscripts:
 ; ^DIC(1) -> ^DIC(1,0)
 ; ^DIC(1,0) -> ^DIC(1,0,"%D")
 ;
 S LAST=$L(NEW)

 ; Replace the final ")" with ",sub)"
 S NEW=$E(NEW,1,LAST-1)_","

 I SUB?1N.N D
 . S NEW=NEW_SUB_")"
 E  D
 . S NEW=NEW_""""_$$ESCAPE(SUB)_""")"

 Q NEW
 ;
ESCAPE(STR) ;
 ;
 ; Double embedded quotes for valid M syntax
 ;
 Q $TR($G(STR),"""","""""")
