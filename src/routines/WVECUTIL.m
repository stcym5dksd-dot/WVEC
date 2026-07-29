WVECUTIL ; WorldVistA Engineering Utility Library
 ;;1.3;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; General Utility Library
 ;
 ; Published Entry Points:
 ;   CLEAR
 ;   LINE
 ;   CENTER
 ;   PAUSE
 ;   VERSION()
 ;   REF(ROOT,LEVEL,SUB)
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

PAUSE ; Wait for RETURN
 N X
 W !!,"Press RETURN to continue..."
 R X
 Q

VERSION() ; Library version
 Q "1.3"

REF(ROOT,LEVEL,SUB) ; Build executable global reference
 ;
 ; ROOT  = "^DIC"
 ; LEVEL = Number of subscripts
 ; SUB() = Subscript array
 ;
 N REF,I,S

 S REF=ROOT
 I LEVEL=0 Q REF

 S REF=REF_"("

 F I=1:1:LEVEL D
 . I I>1 S REF=REF_","
 . S S=SUB(I)
 . I $$ISNUM(S) S REF=REF_S Q
 . S REF=REF_""""_S_""""

 S REF=REF_")"

 Q REF

ISNUM(X) ; Return 1 if X should be emitted as numeric
 ;
 ; Handles:
 ;   0
 ;   123
 ;   -5
 ;   .11
 ;   3.14159
 ;
 I X?1"-".N Q 1
 I X?1"-".N1".".N Q 1
 I X?1".".N Q 1
 I X?1.N Q 1
 I X?1.N1".".N Q 1
 Q 0
