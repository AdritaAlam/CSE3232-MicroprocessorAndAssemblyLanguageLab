.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER THE INPUT DIGIT: $'
    MSG2 DB 'THE REQUIRED OUTPUT: $' 
    NEWLINE DB 10,13,'$'
    
    
    YESMSG DB 'YES,PRIME$'
    NOMSG DB 'NOT PRIME.$' 
    
    
    DVND DB ?
    
    
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
     
    
    
    MOV DVND,AL  
    
    
    CMP DVND,2
    JLE NOTPRIME
    
    
    MOV CL,AL 
    DEC CL 
    
    MOV AH,9
    LEA DX ,NEWLINE 
    INT 21H
        
        
    MOV AH,9
    LEA DX ,MSG2 
    INT 21H   
    
    CHECKPRIME:
       
        
        MOV AL,DVND
        MOV AH,0  
        DIV CL
        
        CMP AH,0
        JE NOTPRIME
     
        CMP CL,2
        JE PRIME  
        LOOP CHECKPRIME 
        
        
    PRIME:  
        
        LEA DX,YESMSG
        MOV AH,9
        INT 21H
        JMP EXIT
        
    NOTPRIME: 
        
        LEA DX,NOMSG
        MOV AH,9
        INT 21H
        JMP EXIT
        
        
  
    
    EXIT:    
        MOV AH,4CH
        INT 21H 
    
        
 MAIN ENDP
        
        
        
        
        
        
    