WVECNAVG ; WorldVistA Engineering Generic Navigator
 ;;3.0;WORLDVISTA ENGINEERING CONSOLE;;
 ;
 ;===============================================================
 ; Component     : Generic Navigation Engine
 ; MVC Role      : Framework Service
 ; Specification : ES-019
 ;
 ; Purpose:
 ;     Generic list navigation service.
 ;
 ; Entry:
 ;     D START^WVECNAVG(TITLE,.LIST,COUNT)
 ;
 ; Input:
 ;     TITLE     Screen title
 ;     LIST()    Display list
 ;     COUNT     Number of entries
 ;===============================================================
 ;
 Q
 ;
START(TITLE,LIST,COUNT) ;
 N PAGE,DONE
 S PAGE=1
 S DONE=0
 F  D  Q:DONE
 . D RENDER(TITLE,.LIST,COUNT,PAGE)
 . D COMMAND(.PAGE,.DONE,COUNT)
 Q
 ;
RENDER(TITLE,LIST,COUNT,PAGE) ;
 N FIRST,LAST,I
 N SIZE
 ;
 S SIZE=$$PAGESIZE^WVECCON
 ;
 W @IOF
 W !,TITLE
 W !,$TR($J("",60)," ","=")
 ;
 I COUNT=0 W !!,"No entries.",! Q
 ;
 S FIRST=((PAGE-1)*SIZE)+1
 S LAST=FIRST+SIZE-1
 I LAST>COUNT S LAST=COUNT
 ;
 F I=FIRST:1:LAST D
 . W !,$J(I,3),"  ",$G(LIST(I))
 ;
 W !!
 W "Page ",PAGE," of ",$$LASTPAGE(COUNT)
 W ?35,"N P T Q Number"
 Q
 ;
COMMAND(PAGE,DONE,COUNT) ;
 N X,LAST
 ;
 S LAST=$$LASTPAGE(COUNT)
 ;
 R !,"Selection: ",X:300
 S X=$TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
 ;
 I X="Q" S DONE=1 Q
 I X="T" S PAGE=1 Q
 I X="N",PAGE<LAST S PAGE=PAGE+1 Q
 I X="P",PAGE>1 S PAGE=PAGE-1 Q
 ;
 I X?1.N D
 . W !,"Selected: ",X
 . R !,"Press RETURN: ",X
 ;
 Q
 ;
LASTPAGE(COUNT) ;
 N SIZE
 S SIZE=$$PAGESIZE^WVECCON
 I COUNT<1 Q 1
 Q ((COUNT-1)\SIZE)+1
 ;
 ;===============================================================
 ; End of Routine
 ;===============================================================
