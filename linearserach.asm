; THIS ASSEMBLY CODE SEARCHES AN ELEMENT IN THE ARRAY LINEARLY.

DATA SEGMENT                            

    ARRAY     DB 09H,04H,06H,03H,08H    ; INITIALIZING THE ELEMENTS OF ARRAY
    ELEMENT   DB 07H                    ; THE ELEMENT WHICH WE WANT TO SEARCH
    INDEX     DW ?                      ; VARIABLE TO SAVE THE INDEX OF SEARCHING ELEMENT
DATA ENDS                               

CODE SEGMENT                            

    ASSUME DS:DATA , CS:CODE
                                        ; INFORM TO ASSEMBLER THAT DATA SEGMENT IS ASSOCIATED WITH DS AND CODE SEGMENT IS ASSOCIATED WITH CS
    
    START:                              
            MOV AX , DATA               
            MOV DS , AX                 ; LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            
            MOV SI , 0H                 ; SI IS INITIALIZED WITH 0.
            XOR AX , AX                 ; AX IS INITIALIZED WITH 0.
            LEA BP , ARRAY              ; LOADS EFFECTIVE ADDRESS OF ARRAY INTO BP REGISTER
            MOV AL , ELEMENT            ; MOVE THE SEARCHING ELEMENT TO AL REGISTER 
            MOV CX,5H                   ; CX IS INTIALIZED WITH 5 TO EXECUTE LOOP 5 TIMES
          
    NEXT:
            CMP AL,BYTE PTR BP[SI]      ; COMPARE THE CONTENT OF AL TO CONTENT OF ARRAY
            JE FOUND                    ; IF EQUAL , THEN JUMP TO FOUND LABEL
            INC SI                      ; SI IS INCREMENTED BY 1
            LOOP NEXT                   ; REPEAT TILL CX = 0H
            JMP NOTFOUND                ; JUMP TO NOTFOUND LABEL
            
    FOUND: 
            MOV INDEX , SI              ; MOVE THE VALUE OF SI REGISTER TO INDEX AFTER FINDING THE ELEMENT IN ARRAY
            HLT
            
    NOTFOUND:
            MOV INDEX , -1              ; MOVE -1 TO INDEX AFTER NOT FINDING THE ELEMENT IN ARRAY
 

 
CODE ENDS                              
    END START                           ; END OF PRORAM 