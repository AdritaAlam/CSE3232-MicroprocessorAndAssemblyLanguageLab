.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'ENTER A NUMBER : $' 
    NEWLINE DB 13,10,'$'
    
    N DB ?
    TWO DB 2 
    ANS DB ?
    
    
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    SUB AL,48
    
    MOV N,AL
    INC N
    
    MUL N
    DIV TWO 
    
    ADD AL,48
    MOV ANS,AL
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    
    MOV AH,2 
    MOV DL,ANS
    
    INT 21H
   
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP         
    
     
       