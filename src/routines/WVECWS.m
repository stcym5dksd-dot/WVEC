WVECWS ; WorldVistA Engineering Workspace
 ;;1.1;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; WVEC Workspace Manager
 ;
 ; All temporary engineering information resides under:
 ;
 ;    ^TMP($J,"WVEC")
 ;
 ; This routine owns the workspace definition.
 ;===============================================================

ROOT() ; Return workspace root
 Q $NA(^TMP($J,"WVEC"))

INIT ; Initialize workspace
 D CLEAR

 N ROOT
 S ROOT=$$ROOT()

 S @ROOT@("VERSION")=$$VERSION()
 S @ROOT@("STATUS")="READY"

 ; Navigation
 S @ROOT@("NAV","PAGE")=1
 S @ROOT@("NAV","PATH")=""
 S @ROOT@("NAV","SELECT")=0

 ; Empty list
 S @ROOT@("COUNT")=0

 Q

CLEAR ; Delete entire workspace
 K ^TMP($J,"WVEC")
 Q

RESET ; Reset navigation only
 N ROOT
 S ROOT=$$ROOT()

 K @ROOT@("NAV")
 K @ROOT@("LIST")
 K @ROOT@("COUNT")

 S @ROOT@("NAV","PAGE")=1
 S @ROOT@("NAV","PATH")=""
 S @ROOT@("NAV","SELECT")=0
 S @ROOT@("COUNT")=0

 Q

VERSION() ; Return workspace version
 Q "1.1"

STATUS() ; Return workspace status
 Q $G(^TMP($J,"WVEC","STATUS"),"UNKNOWN")

SETSTAT(STATUS) ; Set workspace status
 S ^TMP($J,"WVEC","STATUS")=$G(STATUS)
 Q

COUNT() ; Return item count
 Q +$G(^TMP($J,"WVEC","COUNT"))

SETCNT(COUNT) ; Set item count
 S ^TMP($J,"WVEC","COUNT")=+$G(COUNT)
 Q

SETITEM(NUM,NAME,DESC) ; Store one list item
 N ROOT
 S ROOT=$$ROOT()

 S @ROOT@("LIST",NUM,"NAME")=$G(NAME)
 S @ROOT@("LIST",NUM,"DESC")=$G(DESC)

 I NUM>+$G(@ROOT@("COUNT")) S @ROOT@("COUNT")=NUM

 Q

GETITEM(NUM,FIELD) ; Return one field
 Q $G(^TMP($J,"WVEC","LIST",NUM,FIELD))

SHOW ; Display workspace summary
 N ROOT

 S ROOT=$$ROOT()

 W !!
 W "WVEC Workspace"
 W !
 W "=============="
 W !
 W "Version : ",$G(@ROOT@("VERSION"))
 W !
 W "Status  : ",$G(@ROOT@("STATUS"))
 W !
 W "Page    : ",$G(@ROOT@("NAV","PAGE"))
 W !
 W "Path    : ",$G(@ROOT@("NAV","PATH"))
 W !
 W "Select  : ",$G(@ROOT@("NAV","SELECT"))
 W !
 W "Items   : ",$G(@ROOT@("COUNT"))
 W !

 Q

TEST ; Simple self test
 D INIT

 D SETSTAT("TESTING")

 D SETITEM(1,"FIRST","Item One")
 D SETITEM(2,"SECOND","Item Two")
 D SETITEM(3,"THIRD","Item Three")

 D SHOW

 W !
 W "Item 1 = ",$$GETITEM(1,"NAME")

 Q

 ;===============================================================
 ; End of WVECWS
 ;===============================================================
