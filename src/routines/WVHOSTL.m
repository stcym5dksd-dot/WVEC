WVHOSTL ; WorldVistA Host Manager - List Hosts
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;
 ; Display all defined hosts
 ;

EN ;
 N U
 S U="^"
 N IEN
 N X

 D CLEAR

 W !,"==========================================",!
 W " Registered Hosts",!
 W "==========================================",!!

 I '$D(^WVHOST(1)) D  G EXIT
 . W "No hosts defined.",!

 W " #  Name                     Type   Status",!
 W "-----------------------------------------------",!

 S IEN=0
 F  S IEN=$O(^WVHOST(IEN)) Q:'IEN  D
 . N REC
 . S REC=$G(^WVHOST(IEN,0))
 . W !
 . W $J(IEN,2)," "
 . W $E($P(REC,U,1),1,24)
 . W ?30,$E($P(REC,U,3),1,6)
 . W ?38,$E($P(REC,U,14),1,10)
EXIT ;

 R !!,"Press RETURN: ",X:300

 Q


CLEAR ;

 W $C(27),"[2J"
 W $C(27),"[H"

 Q
