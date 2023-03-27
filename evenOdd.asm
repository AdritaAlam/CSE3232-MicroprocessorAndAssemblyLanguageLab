.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER THE INPUT DIGIT: $'
    MSG2 DB 'THE REQUIRED OUTPUT: $'
    ODDMSG DB 'ODD. $'
    EVENMSG DB 'EVEN. $'
    
    TWO DB 2
    
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
    
    
    DIV TWO
    
    CMP AH,0
    JE EVEN
    
    
    
    ODD: 
        MOV AH,2
        MOV AH,13
        INT 21H
        
        MOV AH,2
        MOV AH,10
        INT 21H
        
        LEA DX,ODDMSG
        MOV AH,9
        INT 21H
        JMP  EXIT
        
    EVEN:  
        MOV AH,2
        MOV AH,13
        INT 21H
        
        MOV AH,2
        MOV AH,10
        INT 21H
        
        LEA DX,EVENMSG
        MOV AH,9
        INT 21H
        JMP  EXIT 
        
        
    EXIT:
        
        MOV AH,4CH
        INT 21H 
    
        
 MAIN ENDP
        
        
        
        
        
        
    