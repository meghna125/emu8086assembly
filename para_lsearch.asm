; THIS ASSEMBLY CODE SEARCHES AN ELEMENT IN THE ARRAY LINEARLY.


    
PROG_SEG SEGMENT 
    ARRAY     DB 09H,04H,06H,03H,08H    
    ELEMENT   DB 08H                    
    INDEX     DW ? 
    TABLE     DW 3 DUP(?)
              DW 09H,04H,06H,03H,08H
    TOS       LABEL WORD
    ASSUME DS:PROG_SEG , CS:PROG_SEG, SS:PROG_SEG
                                        
    
    START:                              
            MOV AX , CS               
            MOV DS , AX
            MOV SS,AX
            MOV SP,OFFSET TOS
            MOV TABLE,OFFSET ARRAY
            MOV TABLE+2,OFFSET ELEMENT
            MOV TABLE+4,OFFSET INDEX
            MOV BX,OFFSET TABLE
            CALL LSEARCH
            HLT
            
PROG_SEG ENDS                 
            
  
     LSEARCH PROC NEAR
  
            PUSH AX
            PUSH CX
            PUSH SI
            PUSH DI
            MOV SI,[BX]
            MOV DI,[BX+2]
            MOV AL,[DI]                             
            MOV DI,[BX+4]                        
            MOV CX,5H                   
          
    NEXT:
            CMP AL,BYTE PTR [SI]      
            JE FOUND                   
            INC SI                      
            LOOP NEXT                   
            JMP NOTFOUND
                            
            
    FOUND: 
            MOV [DI] , SI
            POP DI 
            POP SI
            POP CX
            POP AX            
            HLT
            
    NOTFOUND:
            MOV [DI], -1
            POP DI 
            POP SI
            POP CX
            POP AX
            RET
            
  LSEARCH ENDP            
 

 
                             
    END START                           