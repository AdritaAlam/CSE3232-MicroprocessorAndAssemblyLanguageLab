;Counting no. of vowels,consonants,digits,spaces


.MODEL SMALL
.STACK 100H

.DATA

    INPUTMSG DB 'ENTER THE STRING: $'
    NOV DB 'NUMBER OF VOWELS: $'
    NOC DB 'NUMBER OF CONSONANT: $'
    NOD DB 'NUMBER OF DIGITS: $'
    NOS DB 'NUMBER OF SPACES: $'
    
    VOWELS DB 'AEIOUaeiou$'
    
    
    
    VC DB 50
    CC DB 50
    DC DB 50
    SC DB 50
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,INPUTMSG
    MOV AH,9
    INT 21H
    
    
    INPUT:
        MOV AH,1
        INT 21H
        CMP AL,13
        JZ ENDINPUT
        
        
        CMP AL,'z'
        JG INVALID
        CMP AL,'A'
        JL INVALID
        CMP AL,'Z'
        JG TOP
        TOPP:
            CMP AL,'a'
            JL INVALID
        ENDTOPP:
        
       
        
        
        
        MOV SI,0
        MOV CX,12
        TOP:
            CMP AL,VOWELS[SI]
            JZ VOW
            INC SI
        LOOP TOP:
        DEC VC
        INC CC
        VOW:
            INC VC
        INVALID:
        
        CMP AL,' '
        JZ SPACE
        
        DEC SC
        SPACE:
            INC SC
            
        CMP AL,'0'
        JL NOTDIGIT:
        CMP AL,'9'
        JG NOTDIGIT:
        
        INC DC
        NOTDIGIT:
        
        JMP INPUT
    ENDINPUT:   
    
    
    ;PRINTING NUMBER OF VOWELS
    
    CALL NEWLINE
    LEA DX,NOV
    MOV AH,9
    INT 21H
    
    MOV DL,VC
    MOV AH,2
    INT 21H
    
    ;PRINTING NUMBER OF CONSONENT
    CALL NEWLINE
    LEA DX,NOC
    MOV AH,9
    INT 21H
    
    MOV DL,CC
    MOV AH,2
    INT 21H
    
    ;PRINTING NUMBER OF DIGITS
    CALL NEWLINE
    LEA DX,NOD
    MOV AH,9
    INT 21H
    
    MOV DL,SC
    MOV AH,2
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP

NEWLINE PROC
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
NEWLINE ENDP

END MAIN
    
                