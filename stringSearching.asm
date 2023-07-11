 .MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'ENTER THE STRINF: $'
    MSG2 DB 'THE SUBSTRING: $' 
    NEWLINE DB 13,10,'$'
    FMSG DB 'YES$'
    NMSG DB 'NO$'
    
    STR DB 100 DUP('$') 
    SUBSTR DB 100 DUP ('$')
    
    N DW ?
    
.CODE
MAIN PROC   
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    
    MOV SI,0
    
    MAININPUT:
        MOV AH,1
        INT 21H
        
        CMP AL,13
        JZ ENDMINPUT
        
        MOV STR[SI],AL  
        INC SI
        
        JMP MAININPUT
    
    ENDMINPUT:
    
        
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
        LEA DX,MSG2
        MOV AH,9
        INT 21H
        
    
        MOV SI,0
      
     SUBINPUT:
        MOV AH,1
        INT 21H
        
        CMP AL,13
        JZ ENDSINPUT
        
        MOV SUBSTR[SI],AL  
        INC SI
        
        JMP SUBINPUT 
      
      
    ENDSINPUT:
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H 
        
        MOV SI,0
        
         
        
        
    CHECK:
        PUSH SI
        MOV DI,0 
        
        LOOP1:
            MOV AL,STR[SI]
            MOV BL,SUBSTR[DI]  
            
            INC SI
            INC DI
            
            CMP BL,'$'
            JE FOUND
            
            CMP AL,BL
            JE LOOP1 
            
            JMP UPDATE_SI
        UPDATE_SI:
            POP SI
            INC SI
            MOV AL,STR[SI]
            CMP AL,'$'
            JE NOTFOUND
            JMP CHECK
            
        FOUND:
            LEA DX,FMSG
            MOV AH,9
            INT 21H 
            
            JMP EXIT          
      
        NOTFOUND:
            LEA DX,NMSG
            MOV AH,9
            INT 21H
    
    EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP              
        
        
                  
                     
        
    