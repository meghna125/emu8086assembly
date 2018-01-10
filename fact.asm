DATA SEGMENT
    NUM DW 07H
    FACT DW ?
    
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA
    START:
         MOV AX,DATA
         MOV DS,AX
         
         CALL FACTORIAL
         HLT
         
 FACTORIAL PROC NEAR
    
      MOV AX,1
      MOV CX,NUM
NEXT: CMP CX,0
      JE R
      MUL CX
      LOOP NEXT
    
 R:   MOV FACT,AX
      RET
      
 FACTORIAL ENDP
 
 CODE ENDS
   END START