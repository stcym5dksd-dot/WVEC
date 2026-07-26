WVECGLOB ; WorldVistA Engineering Global Provider
 ;;2.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Global Explorer Provider
 ;===============================================================

BUILD ;
 D ROOT
 Q

ROOT ;
 D CLEARLIST

 D ADD("^DIC","File Dictionary")
 D ADD("^DD","Data Dictionary")
 D ADD("^DPT","Patient File")
 D ADD("^VA(200","New Person File")
 D ADD("^XMB","MailMan")
 D ADD("^XTMP","Temporary Globals")
 D ADD("^TMP","Scratch Workspace")

 S ^TMP($J,"WVEC","GLOB","ROOT")=""

 Q

SELECT(NUM) ;
 N GLOB

 S GLOB=$$GETITEM^WVECWS(NUM,"NAME")

 I GLOB="" Q

 S ^TMP($J,"WVEC","GLOB","ROOT")=GLOB

 D LIST(GLOB)

 Q

LIST(GLOB) ;
 N ROOT,SUB,CNT,REF

 D CLEARLIST

 S ROOT=$$ROOT^WVECWS()
 S CNT=0

 S REF=GLOB

 I $E(REF,$L(REF))'="(" S REF=REF_"("

 S SUB=""

 F  S SUB=$O(@(REF_SUB_")")) Q:SUB=""  D
 . S CNT=CNT+1
 . D SETITEM^WVECWS(CNT,SUB,"Subscript")

 D SETSTAT^WVECWS(GLOB)

 Q

CLEARLIST ;
 D SETCNT^WVECWS(0)
 K ^TMP($J,"WVEC","LIST")
 Q

ADD(NAME,DESC) ;
 N CNT

 S CNT=$$COUNT^WVECWS()+1

 D SETITEM^WVECWS(CNT,NAME,DESC)

 Q

TEST ;
 D INIT^WVECWS
 D BUILD
 D SHOW^WVECDSP
 Q
