.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'ENTER STRING: $'
    NEWLINE DB 13,10,'$'
    
    MSG2 DB 'OUTPUT: $'
    STR DB 100 DUP(?) 
    
    VOWELS DB 'AEIOUaeiou$'
    
    VC DB '0'
    CC DB '0'
    DC DB '0'
    SC DB '0'
    
    
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H  
    
    MOV SI,0 
    MOV CX,0
    
    INPUT:
        MOV AH,1
        INT 21H
        
        CMP AL,13
        JE ENDINPUT
        
        CMP AL,'A'
        JL INVALID
        
        CMP AL,'z'
        JG INVALID
        
        CMP AL,'Z'
        JG CHECK
        
        JMP ENDCHECK
        
    CHECK:
        CMP AL,'a'
        JL INVALID
    ENDCHECK:
        MOV SI,0
        MOV CX,10
            
        LOOP1:
            CMP AL,VOWELS[SI]  
            JE VOW 
            INC SI
                
            LOOP LOOP1
        INC CC
        JMP INPUT 
    VOW:
        INC VC
        JMP INPUT
    INVALID:
        CMP AL,' '
        JE SPACE
        
        CMP AL,'0'
        JL NOTDIGIT
        
        CMP AL,'9'
        JG NOTDIGIT
        
        INC DC
        JMP INPUT        
                 
    SPACE:
        INC SC
        JMP INPUT
    NOTDIGIT:
        JMP INPUT                    
        
        
        
    
    ENDINPUT:
        
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H    
        
        MOV DL,VC
        MOV AH,2
        INT 21H
        
        MOV DL,CC
        MOV AH,2
        INT 21H
        
        MOV DL,DC
        MOV AH,2
        INT 21H
        
        MOV DL,SC
        MOV AH,2
        INT 21H
            
             
        
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP            
        
        
        
      