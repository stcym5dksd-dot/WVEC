WVECKIDS ; WVEC KIDS Explorer ; Jul 2026
 ;
 ;---------------------------------------------------------
 ; WorldVistA Engineering Console
 ;
 ; Routine:
 ;   WVECKIDS
 ;
 ; Purpose:
 ;   Read-only browser for the KIDS BUILD file (#9.6)
 ;   Displays the first 10 build names and the total
 ;   number of builds in the BUILD file.
 ;
 ; This routine makes NO changes to the database.
 ;
 ;---------------------------------------------------------
 ;
 Q
 ;
EN ; Main Entry Point
 ;
 N IEN,COUNT,NAME
 S U="^"
 ;
 D BANNER^WVECUTIL("KIDS Explorer")
 ;
 S COUNT=0
 S IEN=0
 ;
 F  S IEN=$O(^XPD(9.6,IEN)) Q:'IEN  D
 . S NAME=$P($G(^XPD(9.6,IEN,0)),U)
 . Q:NAME=""
 . S COUNT=COUNT+1
 . I COUNT'>10 W !,$J(COUNT,3),". ",NAME
 ;
 W !!
 W "Total Builds Found: ",COUNT
 W !!
 ;
 D PAUSE^WVECUTIL
 Q
 ;
LIST(MAX) ; Display the first MAX build names
 ;
 N IEN,COUNT,NAME,LIMIT
 S U="^"
 ;
 S LIMIT=$S($G(MAX)>0:MAX,1:10)
 S COUNT=0
 S IEN=0
 ;
 F  S IEN=$O(^XPD(9.6,IEN)) Q:'IEN  D  Q:COUNT'<LIMIT
 . S NAME=$P($G(^XPD(9.6,IEN,0)),U)
 . Q:NAME=""
 . S COUNT=COUNT+1
 . W !,$J(COUNT,3),". ",NAME
 ;
 Q
 ;
COUNT() ; Return total number of builds
 ;
 N IEN,TOTAL
 ;
 S TOTAL=0
 S IEN=0
 ;
 F  S IEN=$O(^XPD(9.6,IEN)) Q:'IEN  S TOTAL=TOTAL+1
 ;
 Q TOTAL
 ;
VERSION() ; Return WVEC module version
 ;
 Q "1.0"
 ;
