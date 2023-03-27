.MODEL SMALL
.STACK 100H


.DATA
    MSG1 DB 'ENTER SOME NUMBERS FROM 0 TO 9: $'
    MSG2 DB 'THE REQUIRED LARGEST NUMBER : $' 
    NEWLINE DB 13,10,'$'
     

.CODE   

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
     
    MOV BL,1
    
    INPUT:
        MOV AH,1
        INT 21H
        
        
        CMP AL,13
        JE OUTPUT    
        
        CMP AL,BL
        JG CHECK
        JMP INPUT
        
    CHECK:    
        MOV BL,AL
        JMP INPUT
        
    OUTPUT:
        ;PRINT NEWLINE
        MOV AH,9
        LEA DX,NEWLINE
        INT 21H
        MOV DI,0
        
        ;PRINT OUTPUT MSG
        MOV AH,9
        LEA DX,MSG2
        INT 21H
    
        ;PRINT RESULT
        MOV DL,BL 
        
        MOV AH,2
        INT 21H
        JMP EXIT
        
    EXIT:
        MOV AH,4CH
        INT 21H 
        
MAIN ENDP
        
      
   
        
        
   
    