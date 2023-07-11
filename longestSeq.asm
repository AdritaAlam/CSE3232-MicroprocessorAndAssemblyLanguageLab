 .MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'ENTER STRING : $'
    MSG2 DB 'OUTPUT: $' 
    
    NFMSG DB 'NOT FOUND. $'
    
    NEWLINE DB 13,10,'$'
    LEFT DW 0
    MAXLENGTH DW 1
    START DW 0
    
    STR DB 100 DUP ('$')
    CNT DW 1
    
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
        
        
        MOV SI,0
        
    LOOP1:
        MOV DL,STR[SI]  
        INC SI
         
        MOV BL,STR[SI] 
        
        CMP DL,13
        JE ENDLOOP1
        
        CMP BL,DL
        JG CHECK
         
        
       
        
        
        ;JMP LOOP1
    
    CHECK:
         SUB BL,DL
         CMP BL,1 
         JE UPDATE_COUNT
         JNE CNT0
         
    UPDATE_COUNT:
        INC CNT
        MOV AX,CNT
        MOV BX,MAXLENGTH
        
        CMP AX,BX
        JG UPDATE_MAXLENGTH
        JMP LOOP1 
        
        
    CNT0:
        MOV CNT,1
        MOV LEFT,SI
        JMP LOOP1
        
    UPDATE_MAXLENGTH:
        MOV AX,CNT
        MOV MAXLENGTH,AX
        MOV BX,LEFT
        
        MOV START,BX
        JMP LOOP1        
        
    ENDLOOP1:
        MOV CX,MAXLENGTH
        MOV SI,START
        
        
        MOV AH,2 
        
        MOV DX,START
        ADD DL,48
        INT 21H
        
        MOV AH,2 
        
        MOV DX,MAXLENGTH
        ADD DL,48
        INT 21H         
            
        
    DISPLAY:
        MOV AH,2
        MOV DL,STR[SI]
        INT 21H
        
        INC SI
        LOOP DISPLAY    
        
        
        
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP                    
        
                    
                      
        
        
                
    

