WVECTMP ; Temporary test
TEST ;
 N PATH,X

 S PATH(1)=4
 S PATH(2)="B"
 S PATH(3)="ALBANY"

 W !,"Before FORMAT",!

 S X=$$FORMAT^WVECREF("^DIC",.PATH,1)

 W !,"After FORMAT",!
 W !,"Result=",X,!

 Q
