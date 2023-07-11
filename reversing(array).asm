.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'ENTER STRING: $'
    NEWLINE DB 13,10,'$'
    
    MSG2 DB 'OUTPUT: $'
    STR DB 100 DUP(?)
    
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H  
    
    MOV SI,0
    
    INPUT:
        MOV AH,1
        INT 21H
        
        CMP AL,13
        JE ENDINPUT
        
        MOV STR[SI],AL
        INC SI
        
        JMP INPUT
        
    
    ENDINPUT:
        MOV DI,SI
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H    
        
        
    OUTPUT: 

        MOV DL,STR[DI]
        MOV AH,2
        INT 21H
        
        CMP DI,0
        JE EXIT  
        DEC DI
        
        JMP OUTPUT         
        
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP            
        
        
        
      