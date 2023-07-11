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
    
    MOV AL,1
    CMP N,1
    JLE OUTPUT 
    
    ;MOV M,N
     MOV AL,N 
    
    RESULT:  
    
        
       
        CMP N,1
        JE OUTPUT
        
        DEC N
        MUL N
        
        JMP RESULT
        
        
        
    
    
    OUTPUT:
    
        MOV ANS,AL
        
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
        
        
        MOV AH,2 
        ADD ANS,48
        MOV DL,ANS
        
        INT 21H
   
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP         
    
     
       