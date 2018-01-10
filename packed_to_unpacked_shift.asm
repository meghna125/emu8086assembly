;THIS ASSEMBLY CODE CONVERTS PACKED ARRAY INTO UNPACKED ARRAY USING SHIFT OPERATION 

DATA SEGMENT                
    PACKED      DB  78h,56h,34h,12h,13h,54h,28h,94h        
    UNPACKED    DB  16 DUP(?)
    
DATA ENDS

CODE SEGMENT
    ASSUME  DS:DATA , CS:CODE                         ;INFORM THE ASSEMBLER THAT DATA SEGMENT IS ASSOCIATED WITH DS AND CODE SEGMENT IS ASSOCIATED WITH CS
    
    START :
            MOV AX, DATA                              ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            MOV DS, AX
                                                      ;INITIALIZE CX WITH THE LENGTH OF PACKED ARRAY
            MOV CX,8                                  ;INITIALIZE SI WITH 0
            MOV SI,0                                  ;INITIALIZE DI WITH 0
            MOV DI,0 
            
    NEXT:                                             ;CLEAR AX
            XOR AX,AX                                 ;MOVE THE CONTENT OF PACKED ARRAY INTO AL
	        MOV AL,PACKED[SI]                         ;INCREMENT SI
   	        INC SI                                    ;SHIFT LEFT AX BY 4
	        SHL AX,4                                  ;SHIFT RIGHT AX BY 4
   	        SHR AL,4                                  ;MOVE CONTENTS OF AH INTO HIGHER ORDER BITS OF UNPACKED ARRAY LOCATION
	        MOV WORD PTR UNPACKED[DI],AX
	        INC DI
	                                                   ;MOVE CONTENTS OF AL INTO LOWER ORDER BITS UNPACKED ARRAY LOCATION
	        INC DI
            LOOP NEXT
CODE ENDS                                             ;END OF PROGRAM
    END START