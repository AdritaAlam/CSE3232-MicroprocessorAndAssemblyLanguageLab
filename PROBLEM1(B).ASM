.MODEL SMALL
.STACK 100H

.DATA

    STR DB 100 DUP ?
    MSG DB 'ENTER STRING: $'
    MSG2 DB 'REVERSED STRING: $'   
    
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
        CMP AL,13
        JZ ENDINPUT
        
        MOV STR[SI],AL
        INC SI
        
        JMP INPUT
        
    ENDINPUT:
    
        CALL NEWLINE
        
        
        LEA DX,MSG2
        MOV AH,9
        INT 21H
        
        ;DEC SI
        
    OUTPUT:
       MOV DL,STR[SI]
       CMP SI,0
       JL ENDOUTPUT
       
       MOV DL,STR[SI]
       MOV AH,2
       INT 21H
       DEC SI
       
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