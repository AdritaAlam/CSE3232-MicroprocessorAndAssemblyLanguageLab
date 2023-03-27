.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER THE INPUT DIGIT: $'
    MSG2 DB 'THE REQUIRED OUTPUT: $'
    
    ANS DB ? 
    M DB ? 
    INPUT DB ?
    
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H    
    
    SUB AL,48 
    
    
    MOV M,AL
    MOV BL,AL 
    MOV AL,1
    CMP BL,0
    JZ ENDLOOP1: 
    
    MOV AL,M
    
    
    LOOP1:  
        DEC M    
        MUL M
        DEC BL
        CMP BL,1
        JZ ENDLOOP1
        JMP LOOP1:
        
    ENDLOOP1: 
    
    MOV ANS,AL 
    
    MOV AH,2
    MOV AH,13
    INT 21H        
    MOV AH,2
    MOV AH,10
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H 
        
    MOV DL,ANS
    ADD DL,48
        
    MOV AH,2
    INT 21H
        
    MOV AH,4CH
    INT 21H 
    
        
 MAIN ENDP
        
        
        
        
        
        
    