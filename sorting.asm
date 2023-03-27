;SORTING - ASCENDING

.MODEL SMALL
.STACK 100H

.DATA
    STR DB 100 DUP ?
    INPUTSTRING DB 'ENTER THE STRING: $'
    OUTPUTSTRING DB 'AFTER SORTING: $'                                     
    NEWLINE DB 13,10,'$'                                    
    N DW ?
    
.CODE


MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     LEA DX,INPUTSTRING
     MOV AH,9
     INT 21H
     
     MOV SI,0
     MOV DI,0
     
     INPUT:   
        MOV AH,1
        INT 21H
        CMP AL,13
        JZ ENDINPUT
        
        MOV STR[SI],AL
        INC SI
        
        JMP INPUT
        
     ENDINPUT:  
        
        ;SORTING SEGMENT INCREASING ORDER (USING BUBBLE SORT)
        MOV N,SI;
        SUB N,1
                        
        MOV CX,N
        OUTER_LOOP:
            MOV SI,0
            MOV DI,1
            INNER_LOOP:
                MOV AL,STR[SI]
                CMP AL,STR[DI]
                JL SKIP ;   JG: TO DECREASING ORDER SORT
                
                XCHG AL,STR[DI]
                MOV STR[SI],AL
                
                SKIP:
                CMP DI,N
                JZ END_INNER_LOOP
                
                INC DI
                INC SI
                JMP INNER_LOOP:
            END_INNER_LOOP:
        LOOP OUTER_LOOP: 
        
        
     ; NEWLINE  
     LEA DX,NEWLINE
     MOV AH,9
     INT 21H 
     
     ;OUTPUT STRING
     LEA DX,OUTPUTSTRING
     MOV AH,9
     INT 21H
     
     INC N
     MOV DI,0
     
     OUTPUT:  
        MOV DL,STR[DI]
        CMP DI,N
        JZ EXIT
        
     
        MOV AH,2
        INT 21H 
        
        INC DI
        
        JMP OUTPUT
    EXIT:
        MOV AH,4CH
        INT 21H
  
MAIN ENDP
END MAIN