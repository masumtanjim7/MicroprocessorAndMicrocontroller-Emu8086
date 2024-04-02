.data
message db 'Input first number as dividend:$'
message1 db 'Input second number as divisor:$' 
message2 db 'Quotient is:$' 
message3 db 'Remainder is:$' 
.code
DIVISION PROC 
MOV AX, @DATA 
MOV DS,AX 
LEA DX,message 
MOV AH,9 
int 21h
MOV AH,1
int 21h 
MOV BL,AL 
SUB BL,30H
MOV AH,2
MOV DL,10 
int 33
MOV DL,13
int 21h 
LEA DX,message1 
MOV AH,9 
int 21h
MOV AH,1 
int 21h 
MOV BH,AL 
SUB BH,30H 
MOV AH,2
MOV DL,10 
int 33
MOV DL,13
int 21h 
LEA DX,message2 
MOV AH,9 
int 21h 
MOV AX,0
MOV AL, BL 
DIV BH 
MOV BL , AL
ADD BL,30H 
MOV BH,AH
ADD BH,30H 
MOV AH,2 
MOV DL,BL
INT 21h 
MOV AH,2
MOV DL,10 
int 33
MOV DL,13
int 21h 
LEA DX,message3
MOV AH,9 
int 21h 
MOV AH,2 
MOV DL,BH
INT 21h 
DIVISION ENDP 
END DIVISION