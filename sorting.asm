.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'ENTER THE STRING : $'
    NEWLINE DB 13,10,'$'
    
    MSG2 DB 'SORTED STRING: $'
    
    STR DB 100 DUP (?) 
    N DW ?
    
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
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H 
        
        
        MOV N,SI 
        DEC N
        MOV CX,N
    
    LOOP1:
        MOV DI,1
        MOV SI,0  
        
        LOOP2:
            MOV AL,STR[SI]
            CMP AL,STR[DI]
            JL SKIP
            
            XCHG AL,STR[DI] 
            MOV STR[SI],AL
            
            SKIP:
                CMP DI,N 
                JZ ENDLOOP2
            INC SI
            INC DI
            JMP LOOP2
        ENDLOOP2:
            LOOP LOOP1
     INC N
     MOV SI,0
     
     
     DISPLAY:
        MOV DL,STR[SI]
        CMP SI,N
        JE EXIT
        
        MOV AH,2
        INT 21H
        
        INC SI
        JMP DISPLAY
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP                           
                
            
            
        
        
                    
    