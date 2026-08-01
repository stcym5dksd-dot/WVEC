WVHOST ; WorldVistA Host Manager
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;
 ; Main menu for WVHOST
 ;

EN ;
 N DONE,OPT

 S DONE=0

 F  Q:DONE  D
 . D CLEAR
 . D MENU
 . R !,"Selection: ",OPT:300
 . I '$T S DONE=1 Q
 . S OPT=$$UP(OPT)
 . D ACTION(.DONE,OPT)

 Q

MENU ;

 W !,"==========================================",!
 W " WorldVistA Host Manager",!
 W "==========================================",!!
 W "1  Create New Host",!
 W "2  List Hosts",!
 W "3  Edit Host",!
 W "4  Delete Host",!
 W "5  Exit",!!

 Q

ACTION(DONE,OPT) ;

 I OPT=1 D  Q
 . D EN^WVHOST1

 I OPT=2 D  Q
 . D EN^WVHOSTL

 I OPT=3 D  Q
 . W !,"Edit Host - Not Yet Implemented"
 . D PAUSE

 I OPT=4 D  Q
 . W !,"Delete Host - Not Yet Implemented"
 . D PAUSE

 I OPT=5 S DONE=1 Q

 W !,"Invalid Selection"
 D PAUSE

 Q

CLEAR ;

 W $C(27),"[2J"
 W $C(27),"[H"

 Q

PAUSE ;

 N X

 R !!,"Press RETURN: ",X:300

 Q

UP(X) ;

 Q $TR($G(X),"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
