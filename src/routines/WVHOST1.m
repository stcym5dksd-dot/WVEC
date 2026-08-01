WVHOST1 ; WorldVistA Host Manager - Create Host
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;
 ; Create a new host definition
 ;

WVHOST1 ; WorldVistA Host Manager - Create Host
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

EN ;

 N NAME,DESC,TYPE,DNS
 N PUBIP,PRIVIP
 N USER,PORT,KEY
 N OS,YDB
 N WVPATH,WVECPATH
 N STATUS
 N IEN
 N X
 S U="^"
 D CLEAR

 ;
 ; Default values
 ;

 S NAME="LIGHTSAIL"
 S DESC="AWS Lightsail Development Server"
 S TYPE="DEV"
 S DNS=""
 S PUBIP="99.79.191.9"
 S PRIVIP=""
 S USER="ubuntu"
 S PORT=22
 S KEY="id_ed25519"
 S OS="Ubuntu 24.04 LTS"
 S YDB="r2.06"
 S WVPATH="/home/ubuntu/wvbuild"
 S WVECPATH="/home/ubuntu/wvec"
 S STATUS="ACTIVE"

 W !,"==========================================",!
 W " Create New Host",!
 W "==========================================",!!

 W !,"Host Name............. ",NAME
 W !,"Description........... ",DESC
 W !,"Host Type............. ",TYPE
 W !,"DNS Name.............. ",DNS
 W !,"Public IP............. ",PUBIP
 W !,"Private IP............ ",PRIVIP
 W !,"SSH User.............. ",USER
 W !,"SSH Port.............. ",PORT
 W !,"SSH Key............... ",KEY
 W !,"Operating System...... ",OS
 W !,"YottaDB Version....... ",YDB
 W !,"WorldVistA Path....... ",WVPATH
 W !,"WVEC Path............. ",WVECPATH
 W !,"Status................ ",STATUS

 R !!,"Create this host (Y/N): ",X:300

 S X=$$UP^WVECNAV7(X)

 I X'="Y" Q

 S IEN=$O(^WVHOST(""),-1)+1

 S ^WVHOST(IEN,0)=NAME_U_DESC_U_TYPE_U_DNS_U_PUBIP_U_PRIVIP_U_USER_U_PORT_U_KEY_U_OS_U_YDB_U_WVPATH_U_WVECPATH_U_STATUS
 S ^WVHOST("B",NAME,IEN)=""

 W !!
 W "Host created."
 W !,"Internal Number: ",IEN

 R !!,"Press RETURN: ",X:300

 Q


CLEAR ;

 W $C(27),"[2J"
 W $C(27),"[H"

 Q

CLEAR ;

 W $C(27),"[2J"
 W $C(27),"[H"

 Q
