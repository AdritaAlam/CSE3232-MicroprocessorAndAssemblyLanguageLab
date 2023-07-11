.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'ENTER A NUMBER : $'  
    
    NEWLINE DB 13,10,'$'
    
    STR DB DUP ('$') 
    MAX DB ?
    
    N DB ? 
    M DB ?
    TWO DB 2 
    ANS DB ?
    
    
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
        
        
        SUB AL,48 
        
        MOV STR[SI],AL
        INC SI
        JMP INPUT
        
         
    ENDINPUT:
        
        MOV DI,SI
        MOV SI,0 
        MOV BL,STR[SI]  
        MOV MAX,BL
        INC SI
        
    CHECK:
        MOV AL,STR[SI]
        CMP AL,MAX
        JG SWAP 
            
        CMP SI,DI
        JE OUTPUT
            
        INC SI 
        JMP CHECK
            
    SWAP:
        MOV BL,STR[SI]
        MOV MAX,BL
        JMP CHECK
        
    OUTPUT:  
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
        ADD MAX,48
        MOV DL,MAX
        MOV AH,2
        INT 21H
            
       
    
        
   
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP         
    
     
       