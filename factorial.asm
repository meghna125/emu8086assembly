DATA SEGMENT
    
    NUM DW 5H
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
     
     PUSH CX
     PUSH AX
     
     MOV CX,NUM
     MOV AX,1
     
     REPEAT: MUL CX
             LOOP REPEAT   
             
      MOV FACT,AX
             
      POP AX
      POP CX
      RET
      
  ENDP
  
CODE ENDS
   END START
   
   