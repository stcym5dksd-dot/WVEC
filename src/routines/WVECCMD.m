WVECCMD ; WorldVistA Engineering Command Manager
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Command Manager
 ;
 ; Purpose:
 ;     Read and classify user commands.
 ;
 ; Owns:
 ;     ^TMP($J,"WVEC","CMD")
 ;
 ;===============================================================

READ ;
 N ROOT
 N X

 S ROOT=$$ROOT^WVECWS()

 W !!
 R "Command: ",X

 D PARSE(X)

 Q

PARSE(X) ;
 N ROOT

 S ROOT=$$ROOT^WVECWS()

 K @ROOT@("CMD")

 S X=$$UP(X)

 S @ROOT@("CMD","TEXT")=X

 ;
 ; Empty command
 ;
 I X="" S @ROOT@("CMD","TYPE")="NONE" Q

 ;
 ; Numeric selection
 ;
 I X?1.N D  Q
 . S @ROOT@("CMD","TYPE")="SELECT"
 . S @ROOT@("CMD","NUMBER")=+X

 ;
 ; Single-letter commands
 ;
 I X="Q" S @ROOT@("CMD","TYPE")="QUIT" Q
 I X="N" S @ROOT@("CMD","TYPE")="NEXT" Q
 I X="P" S @ROOT@("CMD","TYPE")="PREV" Q
 I X="T" S @ROOT@("CMD","TYPE")="TOP" Q
 I X="U" S @ROOT@("CMD","TYPE")="UP" Q
 I X="R" S @ROOT@("CMD","TYPE")="REFRESH" Q

 ;
 ; Unknown command
 ;
 S @ROOT@("CMD","TYPE")="UNKNOWN"

 Q

UP(X) ;
 Q $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")

SHOW ;
 N ROOT

 S ROOT=$$ROOT^WVECWS()

 W !
 W "TYPE   = ",$G(@ROOT@("CMD","TYPE"))
 W !
 W "TEXT   = ",$G(@ROOT@("CMD","TEXT"))
 W !

 I $D(@ROOT@("CMD","NUMBER")) D
 . W "NUMBER = ",@ROOT@("CMD","NUMBER"),!

 Q

TEST ;
 D INIT^WVECWS

 F  D  Q:$G(^TMP($J,"WVEC","CMD","TYPE"))="QUIT"
 . D READ
 . D SHOW

 Q
