 ;THIS ASSEMBLY CODE MOVE A BLOCK OF DATA FROM ONE MEMORY LOCATION TO ANOTHER

DATA SEGMENT                       
    ARRAY1 DB 09H,04H,06H,03H,08H   ; INITIALIZING THE ELEMENTS OF ARRAY1
    ARRAY2 DB 5DUP(0)               ; INITIALIZING THE ELEMENTS OF ARRAY2 BY 0
DATA ENDS                           

CODE SEGMENT                        

    ASSUME DS:DATA , CS:CODE  
                                    ; INFORM TO ASSEMBLER THAT DATA SEGMENT IS ASSOCIATED WITH DS AND CODE SEGMENT IS ASSOCIATED WITH CS
    
    START:                          
            MOV AX , DATA
            MOV DS , AX             ; LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            
            LEA BX , ARRAY1         ; LOADS EFFECTIVE ADDRESS OF ARRAY1 TO BX REGISTER
            LEA BP , ARRAY2         ; LOADS EFFECTIVE ADDRESS OF ARRAY2 TO BP REGISTER
            MOV CX , 05H            ; CX IS INTIALIZED WITH 5 TO EXECUTE LOOP 5 TIMES
            MOV DI,0                ; INITIALIZE DI WITH 0
    NEXT: 
            MOV AL , BX[SI]         ; MOVE THE CONTENT AVAILABLE AT LOCATION [BX + SI ] TO AL REGISTER
            MOV BP[DI] , AL         ; MOVE THE CONTENT OF AL TO LOCATION [ BP + DI ] 
            INC SI                  ; SI IS INCREMENTED BY 1
            INC DI                  ; DI IS INCREMENTED BY 1
            LOOP NEXT               ; REPEAT TILL CX = 0H
          
CODE ENDS                           
END START                           ; END OF PRORAM