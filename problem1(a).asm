.MODEL SMALL
.STACK 100H

.DATA
    STR DB 100 DUP ?
    MSG DB 'ENTER THE STRING: $'
    MSG2 DB 'AFTER CONVERSION : $'
    N DB ?
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV SI,0
    MOV DI,0
    
    INPUT:
        MOV AH,1
        INT 21H
        CMP AL,0DH
        JZ ENDINPUT
        
        CMP AL,'z'
        JG NOCHANGE
        CMP AL,'A'
        JL NOCHANGE
        CMP AL,'Z'
        JG TOP
        
        JMP ENDTOP
        TOP:
            CMP AL,'a'
            JL NOCHANGE
        ENDTOP:
        XOR AL,32
        
     NOCHANGE:      
        MOV STR[SI],AL
        INC SI
        JMP INPUT
     ENDINPUT:
        CALL NEWLINE 
        
        LEA DX,MSG2
        MOV AH,9
        INT 21H
        
     OUTPUT:
        MOV DL,STR[DI]
        CMP DI,SI
        JZ ENDOUTPUT
        
        MOV DL,STR[DI]
        MOV AH,2
        INT 21H
        INC DI
        
        JMP OUTPUT
     ENDOUTPUT:
        
     MOV AH,4CH
     INT 21H
     
 MAIN ENDP

NEWLINE PROC
    MOV AH,2
    MOV DL,10
    
    INT 21H
    MOV DL,13
    INT 21H
    RET
NEWLINE ENDP

END MAIN
    
    
        



