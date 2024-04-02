.stack 20h
.data
msg2 db 'Addition Result of 4 students last 3-digit ID Number:$'
number1 dw 0384d 
number2 dw 0383d
number3 dw 391d
number4 dw 390d
.code
Tanjim PROC
    MOV AX,@data
    MOV DS,AX
 
    LEA DX,msg2
    MOV AH,9
    int 21h
 
    MOV AX,number1
    ADD AX,number2
    ADD AX,number3
    ADD AX,number4
 
    MOV CL,10D
    MOV CH,0
 
    TOP1:
    
    DIV CL 
    AND DX,0
    MOV DL,AH
    PUSH DX
    INC CH
    AND AH,0
    CMP AL,0
    JNE TOP1
 
    MOV AH,2 
    TOP2:
    
    POP DX
    ADD DL,30H
    INT 21H 
    DEC CH
    CMP CH,0
    JNE TOP2 
 
 
Tanjim ENDP
END Tanjim
