WVECGLOB ; WorldVistA Global Explorer Provider
 ;;5.0;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ; Provider for WVEC Navigation Kernel
 ;

EN ;
 NEW ROOT

 W !
 R "Global (^): ^",ROOT
 Q:ROOT=""

 S ROOT="^"_ROOT

 I '$D(@ROOT) D  Q
 . W !,"Global not found."
 . H 2

 D START^WVECNAV("WVECGLOB",ROOT)
 Q

TITLE(CTX) ;
 Q "WVEC Global Explorer"

INIT(CTX) ;
 S CTX("ROOT")=$G(CTX("ROOT"))
 S CTX("PATH")=$G(CTX("ROOT"))
 S CTX("LEVEL")=0
 Q

LIST(CTX,LIST,COUNT) ;
 NEW PATH,SUB

 K LIST
 S COUNT=0

 S PATH=$G(CTX("PATH"))
 Q:PATH=""

 S SUB=""

 F  S SUB=$O(@PATH@(SUB)) Q:SUB=""  D
 . S COUNT=COUNT+1
 . S LIST(COUNT)=SUB

 Q

SELECT(CTX,ITEM) ;
 NEW NEWPATH

 S NEWPATH=$G(CTX("PATH"))_"("_ITEM_")"

 I '$D(@NEWPATH) Q

 D PUSH^WVECNAV(.CTX,NEWPATH)

 Q

UP(CTX) ;
 D POP^WVECNAV(.CTX)
 Q

TOP(CTX) ;
 K CTX("STACK")
 S CTX("LEVEL")=0
 S CTX("STACK",0)=CTX("ROOT")
 S CTX("PATH")=CTX("ROOT")
 S CTX("PAGE")=1
 Q
