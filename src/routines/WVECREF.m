WVECREF ; WorldVistA Engineering Reference Utilities
 ;;1.0;WORLDVISTA ENGINEERING CONSOLE;;

 ;===============================================================
 ; WVECREF
 ;
 ; Utilities for building legal M global references.
 ;
 ;===============================================================

QUOTE(X) ;
 ; Quote string subscripts, leave numeric subscripts alone.
 I X?1N.N Q X
 N Y
 S Y=$TR(X,"""","""""")
 Q """"_Y_""""

FORMAT(ROOT,PATH,LEVEL) ;
 ; Return a canonical global reference.
 ;
 ; Example:
 ;   ROOT="^DIC"
 ;   PATH(1)=4
 ;   PATH(2)="B"
 ; returns:
 ;   ^DIC(4,"B")

 N REF,I

 S REF=ROOT

 I LEVEL'>0 Q REF

 S REF=REF_"("

 F I=1:1:LEVEL D
 . I I>1 S REF=REF_","
 . S REF=REF_$$QUOTE(PATH(I))

 S REF=REF_")"

 Q REF

TEST ;
 N PATH

 S PATH(1)=4
 S PATH(2)="B"
 S PATH(3)="ALBANY"

 W !
 W $$FORMAT("^DIC",.PATH,3)
 W !

 Q

 ;===============================================================
 ; End WVECREF
 ;===============================================================
