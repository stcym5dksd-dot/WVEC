WVECUTIL ; WorldVistA Engineering Utility Library
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; General utility routines
 ;===============================================================

CLEAR ; Clear ANSI terminal screen
 W $C(27),"[2J"
 W $C(27),"[H"
 Q

LINE(CH,N) ; Draw N copies of character CH
 N I
 F I=1:1:N W CH
 Q

CENTER(TEXT,WIDTH) ; Center TEXT within WIDTH columns
 N PAD
 S WIDTH=$G(WIDTH,79)
 S PAD=(WIDTH-$L(TEXT))\2
 I PAD<0 S PAD=0
 W ?PAD,TEXT
 Q

PAUSE ;
 N X
 W !!,"Press RETURN to continue..."
 R X
 Q

VERSION() ;
 Q "1.0"
