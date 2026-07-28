WVECREF ; WorldVistA Engineering Reference Utilities
 ;;2.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; WVECREF
 ;
 ; Canonical utilities for building legal M global references.
 ; All WVEC components should use this routine rather than
 ; concatenating references by hand.
 ;===============================================================
QUOTE(X) ;

 ; Return numeric subscripts unchanged; quote string subscripts.
 I X'="",+X=X Q X
 N Y
 S Y=$TR(X,"""","""""")
 Q """"_Y_""""
FORMAT(ROOT,PATH,LEVEL) ;

 ; Build a canonical global reference from a root and a path array.
 ; Handles both unsubscripted roots (^DIC) and existing references
 ; (^DIC(.11)).
 ;
 ; Examples:
 ;   ROOT="^DIC"
 ;   PATH(1)=4
 ;   --> ^DIC(4)
 ;
 ;   ROOT="^DIC(.11)"
 ;   PATH(1)=0
 ;   --> ^DIC(.11,0)

 N REF,I,LEN

 S REF=ROOT

 I LEVEL'>0 Q REF

 ; If ROOT already ends in ")", append inside the existing
 ; subscript list. Otherwise start a new one.

 I $E(REF,$L(REF))=")" D
 . S LEN=$L(REF)
 . S REF=$E(REF,1,LEN-1)
 . F I=1:1:LEVEL D
 . . S REF=REF_$S(I=1:",",1:",")_$$QUOTE(PATH(I))
 . S REF=REF_")"
 E  D
 . S REF=REF_"("
 . F I=1:1:LEVEL D
 . . I I>1 S REF=REF_","
 . . S REF=REF_$$QUOTE(PATH(I))
 . S REF=REF_")"

 Q REF

CHILD(ROOT,SUB) ;
 ; Return the immediate child reference.
 ;
 ; Example:
 ;   $$CHILD("^DIC",4)
 ;   -> ^DIC(4)

 N PATH
 S PATH(1)=SUB
 Q $$FORMAT(ROOT,.PATH,1)

TEST ;
 N PATH

 W !,"QUOTE(""ABC"") = ",$$QUOTE("ABC")
 W !,"QUOTE(4)      = ",$$QUOTE(4)
 W !,"QUOTE(.11)    = ",$$QUOTE(.11)

 S PATH(1)=4
 S PATH(2)="B"
 S PATH(3)="ALBANY"
 W !,"FORMAT Test",!
 W $$FORMAT("^DIC",.PATH,3)
 W !

 W !
 W "CHILD(^DIC,4)"
 W !
 W $$CHILD("^DIC",4)
 W !

 W !
 W "CHILD(^DIC(.11),0)"
 W !
 W $$CHILD("^DIC(.11)",0)
 W !

 Q
