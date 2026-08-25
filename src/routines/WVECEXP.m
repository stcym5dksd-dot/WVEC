WVECEXP ; WVEC Explorer Root Provider
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

INIT ;
 D MENU
 Q
BUILD ;
 D MENU
 Q

LIST ;
 D MENU
 Q

MENU ;
 D CLEAR^WVECWS
  D ADDITEM^WVECWS(1,"Globals","","E","WVECGLOB")
  D ADDITEM^WVECWS(2,"Routines","","E","WVECRTN")
  D ADDITEM^WVECWS(3,"KIDS","","E","WVECKIDS")
  D ADDITEM^WVECWS(4,"FileMan","","E","WVECFM")

  D SETSTATE^WVECWS("TITLE","WVEC Explorer")
  D SETSTATE^WVECWS("COUNT",4)

 Q
OPEN(NUMBER) ;
 N ITEM
 S ITEM=$$DATA^WVECWS(NUMBER)

 I ITEM="WVECGLOB" D  Q
 . S ^TMP($J,"WVECNAV","TYPE")="WVECGLOB"
 . D INIT^WVECGLOB

 I ITEM="WVECRTN" D  Q
 . S ^TMP($J,"WVECNAV","TYPE")="WVECRTN"
 . D INIT^WVECRTN

 I ITEM="WVECKIDS" D  Q
 . S ^TMP($J,"WVECNAV","TYPE")="WVECKIDS"
 . D INIT^WVECKIDS

 I ITEM="WVECFM" D  Q
 . S ^TMP($J,"WVECNAV","TYPE")="WVECFM"
 . D INIT^WVECFM
 Q

UP Q
TOP D MENU Q
REFRESH D MENU Q
HEADER ;
 W @IOF
 W !,"============================================================"
 W !,"                    WVEC Explorer"
 W !,"============================================================"
 W !
 Q
INSPECT Q
FIND Q
