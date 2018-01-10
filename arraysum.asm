
;THIS ASSEMBLY CODE COMPUTES THE SUM OF DOUBLE WORD SIZED ELEMENTS OF ARRAY OF LENGTH TEN

DATA SEGMENT                         
 
    ARRAY   DD 3022546H , 1243H , 23456789H , 12345H , 342876H , 66798123H , D5432H , 62H , 421FH , 4682H  
                                            
    SUM     DD 0H                    ;TO STORE THE SUM OF ARRAY ELEMENT

DATA ENDS                            

CODE SEGMENT                        
    
    ASSUME DS:DATA,CS:CODE        
                                     ;INFORM THE ASSEMBLER THAT DATA SEGMENT IS ASSOCIATED WITH DS AND CODE SEGMENT IS ASSOCIATED WITH CS

    START:                           
    
            MOV AX , DATA
            MOV DS , AX                ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            
            XOR AX , AX
            MOV SI , 0H
            LEA BX , ARRAY             ;LOADS EFFECTIVE ADDRESS OF ARRAY TO BX REGISTER
            MOV CX , 0AH               ;CX IS INTIALIZED WITH 10 TO EXECUTE LOOP 10 TIMES
            
    NEXT:  
            MOV AX , WORD PTR SUM      ;MOVE LOWER 16 BITS OF SUM TO AX   
            ADC AX , WORD PTR BX[SI]   ;ADD LOWER 16 BITS OF ARRAY ELEMENTS WITH AX
            MOV WORD PTR SUM , AX      ;STORE CONTENT OF AX TO LOWER 16 BITS OF SUM 
            
            MOV AX , WORD PTR SUM+2    ;MOVE HIGHER 16 BITS OF SUM TO AX
            ADC AX , WORD PTR BX[SI+2] ;ADD HIGHER 16 BITS OF ARRAY ELEMENTS WITH AX
            MOV WORD PTR SUM+2 , AX    ;STORE CONTENT OF AX TO LOWER 16 BITS OF SUM 
            INC SI
            INC SI
            INC SI                   ;INCREMENT SI BY 4 TO MOVE TO THE NEXT ELEMENT OF THE ARRAY
            INC SI
            LOOP NEXT                ;REPEAT TILL CX = 0H
 
CODE ENDS                            ;END OF CODE SEGMENT
    END START                        ;END OF PRORAM




 
