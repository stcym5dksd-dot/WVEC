WVECRTN ; WorldVistA Routine Explorer Provider
 ;;1.1;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ;===============================================================
 ; Component : Routine Explorer Provider
 ; Purpose   : Enumerate M routines for WVEC Navigator
 ;===============================================================
 ;

EN ;
 D START^WVECNAV("WVECRTN","")
 Q

TITLE(CTX) ;
 Q "Routine Explorer"

INIT(CTX) ;
 K CTX("ROUTINE")
 S CTX("PAGE")=1
 Q

LIST(CTX,LIST,COUNT) ;
 ;
 N RTNDIR,PATTERN,FILE,NAME

 K LIST
 S COUNT=0

 ; Obtain routine directory
 S RTNDIR=$$RTNDIR^%ZOSV()

 ; Enumerate every M routine
 S PATTERN=RTNDIR_"*.m"

 S FILE=$ZSEARCH(PATTERN)

 F  Q:FILE=""  D
 . S NAME=$$NAME(FILE)
 . I NAME'="" D
 . . S COUNT=COUNT+1
 . . S LIST(COUNT)=NAME
 . S FILE=$ZSEARCH(PATTERN)

 Q

SELECT(CTX,ITEM) ;
 S CTX("ROUTINE")=ITEM
 Q

UP(CTX) ;
 K CTX("ROUTINE")
 Q

TOP(CTX) ;
 K CTX("ROUTINE")
 S CTX("PAGE")=1
 Q

NAME(FILE) ;
 ;
 ; Return routine name from a pathname
 ;
 N X

 S X=FILE

 ; Remove directory
 F  Q:X'["/"  S X=$P(X,"/",2,999)

 ; Remove extension
 I X["." S X=$P(X,".",1)

 Q X

TEST ;
 N CTX,LIST,COUNT,I

 D LIST(.CTX,.LIST,.COUNT)

 W !!,"Routine Count: ",COUNT,!!

 F I=1:1:20 Q:'$D(LIST(I))  D
 . W $J(I,4),"  ",LIST(I),!

 Q

VERSION() ;
 Q "1.1"
