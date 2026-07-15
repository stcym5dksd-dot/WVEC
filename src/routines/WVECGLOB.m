WVECGLOB ; WVEC Global Explorer ; Jul 2026
 ;
 ;---------------------------------------------------------
 ; WorldVistA Engineering Console
 ;
 ; Read-only Global Explorer
 ;
 ;---------------------------------------------------------
 ;
 Q
 ;
EN ; Main Entry Point
 ;
 N ROOT,SUB,COUNT
 S U="^"
 ;
 D BANNER^WVECUTIL("Global Explorer")
 ;
 R !,"Global (^): ^",ROOT
 Q:ROOT=""
 ;
 S ROOT="^"_ROOT
 ;
 ; Does the global exist?
 I '$D(@ROOT) D  Q
 . W !!,"Global not found."
 . W !!
 . D PAUSE^WVECUTIL
 ;
 W !!
 W "Top Level Nodes"
 W !!
 ;
 S COUNT=0
 S SUB=""
 ;
 F  S SUB=$O(@ROOT@(SUB)) Q:SUB=""  D  Q:COUNT'<25
 . S COUNT=COUNT+1
 . W !,$J(COUNT,3),". ",SUB
 ;
 W !!
 W "Displayed ",COUNT," node(s)."
 W !!
 ;
 D PAUSE^WVECUTIL
 Q
 ;
VERSION() ;
 Q "1.0"
