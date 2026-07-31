WVECNAV ; WorldVistA Engineering Navigator
 ;;6.0;WORLDVISTA ENGINEERING CONSOLE;;

EXPLORE(CTX) ;

 N LIST
 N COUNT
 N TITLE
 N CMD

 S CTX("PAGE")=1
 S CTX("PAGESIZE")=$$PAGESIZE
 S CTX("DONE")=0

 D DOINIT(.CTX)

 F  Q:CTX("DONE")  D
 . K LIST
 . S COUNT=0
 . D DOLIST(.CTX,.LIST,.COUNT)
 . S TITLE=$$DOTITLE(.CTX)
 . D DISPLAY(TITLE,.LIST,COUNT,.CTX)
 . R !,"Selection: ",CMD:300
 . I '$T S CTX("DONE")=1 Q
 . S CMD=$$UP(CMD)
 . D COMMAND(.CTX,CMD,.LIST,COUNT)

 Q
DOINIT(CTX) ;

 I $D(CTX("PROVIDER"))#2,$L(CTX("PROVIDER")) D
 . X "D INIT^"_CTX("PROVIDER")_"(.CTX)"

 S:'$D(CTX("PAGE")) CTX("PAGE")=1
 S:'$D(CTX("PAGESIZE")) CTX("PAGESIZE")=$$PAGESIZE
 S:'$D(CTX("LEVEL")) CTX("LEVEL")=0

 Q


DOLIST(CTX,LIST,COUNT) ;

 S COUNT=0
 K LIST

 I '$D(CTX("PROVIDER")) Q

 X "D LIST^"_CTX("PROVIDER")_"(.CTX,.LIST,.COUNT)"

 Q


DOTITLE(CTX) ;

 N TITLE

 S TITLE="WVEC Navigator"

 I $D(CTX("PROVIDER")) D
 . X "S TITLE=$$TITLE^"_CTX("PROVIDER")_"(.CTX)"

 Q TITLE
NEXT(CTX,COUNT) ;

 N LASTPAGE

 S LASTPAGE=((COUNT-1)\CTX("PAGESIZE"))+1
 I LASTPAGE<1 S LASTPAGE=1

 I CTX("PAGE")<LASTPAGE S CTX("PAGE")=CTX("PAGE")+1

 Q


PREV(CTX) ;

 I CTX("PAGE")>1 S CTX("PAGE")=CTX("PAGE")-1

 Q


DOUP(CTX) ;

 I '$D(CTX("PROVIDER")) Q

 X "D UP^"_CTX("PROVIDER")_"(.CTX)"

 S CTX("PAGE")=1

 Q


DOTOP(CTX) ;

 I '$D(CTX("PROVIDER")) Q

 X "D TOP^"_CTX("PROVIDER")_"(.CTX)"

 S CTX("PAGE")=1

 Q


DOSELECT(CTX,ITEM) ;

 I '$D(CTX("PROVIDER")) Q

 X "D SELECT^"_CTX("PROVIDER")_"(.CTX,.ITEM)"

 Q

COMMAND(CTX,CMD,LIST,COUNT)

 I CMD="" S CTX("DONE")=1 Q

 I CMD="Q" S CTX("DONE")=1 Q

 I CMD="?" D HELP Q

 I CMD="N" D NEXT(.CTX,COUNT) Q

 I CMD="P" D PREV(.CTX) Q

 I CMD="U" D DOUP(.CTX) Q

 I CMD="T" D DOTOP(.CTX) Q

 I CMD?1.N D  Q
 . N INDEX
 . S INDEX=((CTX("PAGE")-1)*CTX("PAGESIZE"))+CMD
 . I INDEX<1!(INDEX>COUNT) Q
 . D DOSELECT(.CTX,LIST(INDEX))
 . S CTX("PAGE")=1

 W !,"Unknown command"
 H 1

 Q

DISPLAY(TITLE,LIST,COUNT,CTX) ;

 NEW FIRST
 NEW LAST
 NEW I
 NEW INDEX

 WRITE #

 WRITE "======================================================",!
 WRITE " ",TITLE,!
 WRITE "======================================================",!!

 IF COUNT=0 DO  QUIT
 . WRITE "<Empty>",!
 . WRITE !
 . WRITE "Commands: Q  ?",!

 SET FIRST=((CTX("PAGE")-1)*CTX("PAGESIZE"))+1
 SET LAST=FIRST+CTX("PAGESIZE")-1
 IF LAST>COUNT SET LAST=COUNT

 FOR INDEX=FIRST:1:LAST DO
 . WRITE $J((INDEX-FIRST)+1,2),". ",LIST(INDEX),!

 WRITE !
 WRITE "Showing ",FIRST,"-",LAST," of ",COUNT,!
 WRITE "Commands: Number  N  P  U  T  Q  ?",!

 QUIT


HELP ;

 WRITE !!
 WRITE "WVEC Navigator",!
 WRITE "--------------",!
 WRITE "number   Select item",!
 WRITE "N        Next page",!
 WRITE "P        Previous page",!
 WRITE "U        Up one level",!
 WRITE "T        Top",!
 WRITE "Q        Quit",!
 WRITE "?        Help",!

 READ !!,"Press RETURN: ",CMD:30

 QUIT


PAGESIZE() ;

 QUIT 25


UP(X)

 QUIT $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
