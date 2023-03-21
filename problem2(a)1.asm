.MODEL SMALL
.STACK 100H

.DATA 

    INPUT DB 50 DUP('$')
    NEWLINE DB 10,13,'$'
    MSG DB 'NO CAPITAL','$'
    FIRST DB 'Z'
    LAST DB 'A'
    COUNTER DB 0

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    MOV SI,0
    
    INPUT_STRING:
        MOV AH,1
        INT 21H 
        
        MOV [SI],AL
        INC SI
        
        CMP AL,13
        JE END_OF_INPUT
        JMP INPUT_STRING
        
    END_OF_INPUT:
    
        MOV AH,9
        LEA DX,NEWLINE
        INT 21H
        MOV DI,0
    CHECK:
        MOV DL,INPUT[DI]
        INC DI
        CMP DL,'$'
        JE NOT_FOUND
        CMP DL,'A'
        JGE COMPARE_TO_Z
        JMP CHECK
        
        COMPARE_TO_Z:
            CMP DL,'Z'
            JLE CAPITAL
            JMP CHECK
            
        NOT_FOUND:
            CMP COUNTER,1
            JE FOUND
            LEA DX,MSG
            MOV AH,9
            INT 21H
            JMP EXIT
                
   CAPITAL:
        MOV BL,FIRST
        CMP DL,BL
        JL UPDATE_FIRST
        MOV BL,LAST
        CMP DL,BL
        JG UPDATE_LAST
        JMP CHECK
        
   UPDATE_FIRST:
        MOV FIRST,DL
        MOV COUNTER,1
        JMP CHECK
        
   UPDATE_LAST:
        MOV LAST,DL
        MOV COUNTER,1
        JMP CHECK
        
   FOUND:
        MOV AH,2
        MOV DL,FIRST
        INT 21H
        MOV DL,LAST
        INT 21H
        JMP EXIT
   MOV AH,4CH
   INT 21H
   
   EXIT:
END MAIN             
                            
