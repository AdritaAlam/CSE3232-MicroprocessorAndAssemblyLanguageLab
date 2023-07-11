.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'ENTER STRING : $'
    MSG2 DB 'OUTPUT: $' 
    
    NFMSG DB 'NOT FOUND. $'
    
    NEWLINE DB 13,10,'$'
    FIRST DB 'Z'
    LAST DB 'A'
    
    STR DB 100 DUP ('$')
    CNT DB 0
    
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
        
        MOV STR[SI],AL
        INC SI
        
        JMP INPUT
    
    ENDINPUT:
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H 
        
        MOV DI,SI
        MOV SI,0
        
    LOOP1:
        MOV DL,STR[SI]  
        INC SI
        ;CMP AL,'Z'
        ;JLE CHECK1  
        
        CMP DL,'$'
        JE NOTFOUND
        
        CMP DL,'A'
        JGE CHECK1 
        
       
        
        
        JMP LOOP1
    
    CHECK1:
        ;CMP AL,'A'
        ;JGE UPDATE
    
        CMP DL,'Z'
        JLE UPDATE
        
        ;INC SI
        JMP LOOP1
    UPDATE: 
        MOV BL,LAST
        CMP DL,BL
        JG UPDATE_L
        
        CMP DL,FIRST
        JL UPDATE_F
        
        JMP LOOP1
    UPDATE_F:
        MOV FIRST,DL
        MOV CNT,1
        
        ;INC SI
        JMP UPDATE
        
    UPDATE_L:
        MOV LAST,DL
        MOV CNT,1
        
        ;INC SI
        JMP UPDATE 
        
        
    NOTFOUND:
        CMP CNT,1
        JE FOUND
        
        LEA DX,NFMSG
        MOV AH,9
        INT 21H
        
        JMP EXIT
    FOUND:
        MOV AH,2
        MOV DL,FIRST
        INT 21H
        
        MOV AH,2
        MOV DL,LAST
        INT 21H
        
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP                    
        
                    
                      
        
        
                
    

