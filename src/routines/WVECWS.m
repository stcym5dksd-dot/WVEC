WVECWS ; WorldVistA Engineering Workspace Manager
 ;;2.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Component     : Workspace Manager
 ; MVC Role      : MODEL SUPPORT
 ; Specification : ES-007
 ;
 ; Purpose:
 ;     Own and manage the shared WVEC workspace.
 ;
 ; Owns:
 ;     ^TMP($J,"WVEC")
 ;
 ; Reads:
 ;     Nothing
 ;
 ; Called By:
 ;     WVECNAV
 ;     WVECDSP
 ;     WVECCMD
 ;     Providers
 ;===============================================================

ROOT() ;
 Q $NA(^TMP($J,"WVEC"))

INIT ;
 D CLEAR
 Q

CLEAR ;
 K ^TMP($J,"WVEC")
 Q

;===============================================================
; View API
;===============================================================

CLEARVIEW ;
 K ^TMP($J,"WVEC","VIEW")
 Q

SETTITLE(TITLE) ;
 S ^TMP($J,"WVEC","VIEW","TITLE")=$G(TITLE)
 Q

SETSUB(SUBTITLE) ;
 S ^TMP($J,"WVEC","VIEW","SUBTITLE")=$G(SUBTITLE)
 Q

SETSTATUS(TEXT) ;
 S ^TMP($J,"WVEC","VIEW","STATUS")=$G(TEXT)
 Q

SETCOMMANDS(TEXT) ;
 S ^TMP($J,"WVEC","VIEW","COMMANDS")=$G(TEXT)
 Q

SETHELP(TEXT) ;
 S ^TMP($J,"WVEC","VIEW","HELP")=$G(TEXT)
 Q

;===============================================================
; List API
;===============================================================

CLEARLIST ;
 K ^TMP($J,"WVEC","LIST")
 S ^TMP($J,"WVEC","COUNT")=0
 Q

ADDITEM(NUM,NAME,DESC,TYPE,DATA) ;
 S ^TMP($J,"WVEC","LIST",NUM,"NAME")=$G(NAME)
 S ^TMP($J,"WVEC","LIST",NUM,"DESC")=$G(DESC)
 S ^TMP($J,"WVEC","LIST",NUM,"TYPE")=$G(TYPE)
 S ^TMP($J,"WVEC","LIST",NUM,"DATA")=$G(DATA)

 I NUM>$G(^TMP($J,"WVEC","COUNT")) D
 . S ^TMP($J,"WVEC","COUNT")=NUM

 Q

COUNT() ;
 Q +$G(^TMP($J,"WVEC","COUNT"))

;===============================================================
; State API
;===============================================================

SETSTATE(NAME,VALUE) ;
 S ^TMP($J,"WVEC","STATE",NAME)=VALUE
 Q

GETSTATE(NAME) ;
 Q $G(^TMP($J,"WVEC","STATE",NAME))

;===============================================================
; Command API
;===============================================================

SETCMD(TYPE,TEXT,NUMBER) ;
 S ^TMP($J,"WVEC","CMD","TYPE")=$G(TYPE)
 S ^TMP($J,"WVEC","CMD","TEXT")=$G(TEXT)
 S ^TMP($J,"WVEC","CMD","NUMBER")=$G(NUMBER)
 Q

;===============================================================
; Compatibility API
;===============================================================

SETCNT(N) ;
 S ^TMP($J,"WVEC","COUNT")=+N
 Q

SETSTAT(TEXT) ;
 D SETSTATUS(TEXT)
 Q

TEST ;

 D INIT

 D SETTITLE("Workspace Test")
 D SETSUB("ES-007")
 D SETSTATUS("Workspace initialized")
 D SETCOMMANDS("Q Quit")

 D ADDITEM(1,"Item One","First Test Item","TEST")
 D ADDITEM(2,"Item Two","Second Test Item","TEST")
 D ADDITEM(3,"Item Three","Third Test Item","TEST")

 Q

 ;===============================================================
 ; End of WVECWS
 ;===============================================================
