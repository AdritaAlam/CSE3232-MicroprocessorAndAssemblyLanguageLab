.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'ENTER A NUMBER : $'  
    PMSG DB 'PRIME.$'
    NPMSG DB 'NOT PRIME .$'
    NEWLINE DB 13,10,'$'
    
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
    
    
    MOV AH,1
    INT 21H 
    
    SUB AL,48  
    
    CMP AL,1
    JLE NOT_PRIME
    
    MOV N,AL
    MOV M,AL 
    DEC M
    
    CHECK: 
        MOV AH,0
        MOV AL,N
        DIV M 
        
        
        CMP AH,0
        JE NOT_PRIME 
        
        CMP M,2
        JLE PRIME 
        
        DEC M
        
        JMP CHECK
        
    PRIME:
        LEA DX,PMSG
        MOV AH,9
        INT 21H     
        
        JMP EXIT  
        
    NOT_PRIME:
        LEA DX,NPMSG
        MOV AH,9
        INT 21H   
    
        
   
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP         
    
     
       