.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'ENTER A NUMBER : $'  
    EMSG DB 'EVEN.$'
    OMSG DB 'ODD . $'
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
    
    DIV TWO
    
    CMP AH,1
    JE ODD
    
    EVEN:
        LEA DX,EMSG
        MOV AH,9
        INT 21H
        
        JMP EXIT
    ODD:
        LEA DX,OMSG
        MOV AH,9
        INT 21H
        
   
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP         
    
     
       