;THIS ASSEMBLY CODE SEARCHES AN ELEMENT IN THE ARRAY LINEARLY.

DATA SEGMENT                            

    ARRAY     DB 09H,04H,06H,03H,08H    
    ELEMENT   DB 07H                    
    INDEX     DW ?
    MSG1      DW 13,10,' ELEMENT IS FOUND $'
    MSG2      DW 13,10,' ELEMENT NOT FOUND $'                      
DATA ENDS                               

CODE SEGMENT                            

    ASSUME DS:DATA , CS:CODE
                                        
    
    START:                              
            MOV AX , DATA               
            MOV DS , AX
            CALL LSEARCH
            HLT                 
            
  
     LSEARCH PROC NEAR
  
            PUSH AX
            PUSH CX
            PUSH SI                             
            LEA BP , ARRAY 
            XOR AX,AX           
            MOV AL , ELEMENT            
            MOV CX,5H
                               
          
    NEXT:
            CMP AL,BYTE PTR BP[SI]      
            JE FOUND                   
            INC SI                      
            LOOP NEXT                   
            JMP NOTFOUND
                            
            
    FOUND:  MOV DX,MSG1
            MOV AH,09H
            INT 21H
             
            JMP L            
            
            
    NOTFOUND:
            MOV DX,0
            MOV AX,0
            MOV DX,MSG2
            MOV AH,09H
            INT 21H
             
            JMP L
            
           
     L:     POP SI
            POP CX
            POP AX 
            RET                  
 
  LSEARCH ENDP
 
CODE ENDS                              
    END START                           