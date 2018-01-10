DATA SEGMENT
    ARRAY DB 01H,02H,03H,04H,05H
    INDEX DW ?
    LOW   DW 0H
    HIGH  DW 4H
    ELE   DB 03H
    
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA,CS:CODE
    START:
          MOV AX,DATA
          MOV DS,AX
          
          XOR AX,AX
          LEA BX,ARRAY
          
     NEXT:MOV DX,HIGH
          CMP DX,LOW
          JL  NOTFOUND
          
          MOV DX , HIGH               
          ADD DX , LOW               
          MOV AX , DX	
          MOV DL,ELE
          
          MOV CX,2H
          DIV CL 
          MOV AH,0H
          
          MOV SI,AX
          CMP DL,BYTE PTR BX[SI]  
          JE FOUND
          JA LOWW
          JL HIGHH
          
    LOWW: INC SI
          MOV LOW,SI
          JMP NEXT
          
    HIGHH:DEC SI
          MOV HIGH,SI
          JMP NEXT
          
    FOUND:MOV INDEX,SI
          HLT
          
    NOTFOUND:MOV INDEX,-1
             HLT             