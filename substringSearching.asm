.MODEL SMALL
.STACK 100H

.DATA
    MAINSTRINGMSG DB 'ENTER THE MAIN STRING: $'
    SUBSTRINGMSG DB 'ENTER THE SUB-STRING: $' 
    FOUNDMSG DB 'YES,FOUND IT.$'  
    NOTFOUNDMSG DB 'NOTFOUND.$'
    
    
    NEWLINE DB 13,10,'$'    
    
    STR DB 50 DUP ('$')
    SUBSTR DB 50 DUP('$')
    
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MAINSTRINGMSG
    MOV AH,9
    INT 21H 
    
    MOV SI,0
    
    MAIN_INPUT:
        MOV AH,1
        INT 21H
        
        CMP AL,13
        JE END_MAIN_INPUT
        
        MOV STR[SI],AL  
        INC SI
        
        JMP MAIN_INPUT
        
    END_MAIN_INPUT:
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    
    LEA DX,SUBSTRINGMSG
    MOV AH,9
    INT 21H 
    
    MOV SI,0 
    
    SUB_INPUT:
        MOV AH,1
        INT 21H
        
        CMP AL,13
        JE END_SUB_INPUT
        
        MOV SUBSTR[SI],AL
        INC SI  
        JMP SUB_INPUT
        
        
    END_SUB_INPUT:
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    
    MOV SI,0
    
    CHECK:
        MOV DI,0
        PUSH SI
        
        LOOP1:
            MOV AH,STR[SI]
            MOV AL,SUBSTR[DI] 
            
            INC SI
            INC DI 
            
            CMP AL,'$'
            JE FOUND
            
            CMP AH,AL
            JE LOOP1
            JMP UPDATE_I
            
        UPDATE_I:
            POP SI
            INC SI
            MOV AH,STR[SI]
            CMP AH,'$'
            JE NOT_FOUND
            JMP CHECK
            
        FOUND:
            LEA DX,FOUNDMSG
            MOV AH,9
            INT 21H
            JMP EXIT
            
        NOT_FOUND:
            LEA DX,NOTFOUNDMSG
            MOV AH,9
            INT 21H
            JMP EXIT 
            
            
        EXIT:
            MOV AH,4CH
            INT 21H
MAIN ENDP        
   
   
    
    
    
        
        