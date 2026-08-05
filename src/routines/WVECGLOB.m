WVECGLOB ; WorldVistA Engineering Console Global Provider
 ;;3.1;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; Component     : Global Provider
 ; MVC Role      : Model / Provider
 ;
 ; Purpose:
 ;   Populate the WVEC workspace with the contents of the
 ;   current global node.
 ;
 ; Notes:
 ;   - Never writes to the terminal.
 ;   - Never reads keyboard input.
 ;   - All workspace updates go through WVECWS.
 ;===============================================================
INIT ;
 D OPEN^WVECTREE("^DIC")

 D SETSTATE^WVECWS("PAGE",1)
 D SETSTATE^WVECWS("PAGESIZE",25)
 D LIST

 Q

REFRESH ;
 D LIST
 Q
LIST ;
 N REF,SUB
 N COUNT
 N NODE
 N TYPE
 N VALUE

 D CLEARLIST^WVECWS

 S REF=$$CURRENT^WVECTREE()
 D SETTITLE^WVECWS("WVEC Global Browser")
 D SETSUB^WVECWS("Globals")
 D SETSTATUS^WVECWS("Current: "_REF)
 D SETCOMMANDS^WVECWS("N P U T Q")

 S SUB=""
 S COUNT=0

 F  S SUB=$O(@REF@(SUB)) Q:SUB=""  D
 . S COUNT=COUNT+1
 . S NODE=$$CHILD^WVECREF(REF,SUB)
 . S TYPE=$D(@NODE)
 . S VALUE=$G(@NODE)
 . D ADDITEM^WVECWS(COUNT,SUB,VALUE,TYPE,NODE)

 D SETSTATE^WVECWS("COUNT",COUNT)

 Q
UP ; Up One Level
 D POP^WVECTREE
 D LIST
 Q

TOP ; Return To Top
 D TOP^WVECTREE
 D LIST
 Q

NEXT ;
 N PAGE,SIZE,COUNT

 S PAGE=$$GETSTATE^WVECWS("PAGE")
 I PAGE<1 S PAGE=1

 S SIZE=$$GETSTATE^WVECWS("PAGESIZE")
 I SIZE<1 S SIZE=25

 S COUNT=$$GETSTATE^WVECWS("COUNT")

 I PAGE*SIZE<COUNT D
 . D SETSTATE^WVECWS("PAGE",PAGE+1)

 Q

PREV ;
 N PAGE

 S PAGE=$$GETSTATE^WVECWS("PAGE")

 I PAGE>1 D
 . D SETSTATE^WVECWS("PAGE",PAGE-1)
 Q
SELECT(NUM) ; Validate and open selected node

 ; Returns
 ;   1 = Node opened
 ;   0 = No action
 ;
 N SUB
 N TYPE

 S SUB=$G(^TMP($J,"WVEC","LIST",NUM,"NAME"))
 S TYPE=$G(^TMP($J,"WVEC","LIST",NUM,"TYPE"))
 S ^TMPXX($J,"NUM")=NUM
 S ^TMPXX($J,"SUB")=SUB
 S ^TMPXX($J,"TYPE")=TYPE
 S ^TMPXX($J,"DATA")=$G(^TMP($J,"WVEC","LIST",NUM,"DATA"))
 I SUB="" Q 0
 I TYPE=1 Q 0

 D OPENNODE^WVECTREE(SUB)

 Q 1

OPEN(NUM) ; Open Selected Item
 D ENTER(NUM)
 Q
ENTER(NUM) ; Enter Selected Item
 ;
 I '$$SELECT(NUM) Q
 D SETSTATE^WVECWS("PAGE",1)
 D LIST
 Q

TEST ;
 D INIT
 D SHOW^WVECDSP
 Q

 ;===============================================================
 ; End of WVECGLOB
 ;===============================================================
