.stack 10h
.data 
message1 db 'Input First Number:$' 
message2 db 'Input Second Number:$'
message3 db 'Subtriplcation of two number is:$'
.code
SUBSTRAC PROC 
MOV AX, @DATA
MOV DS, AX
MOV AH,9
LEA DX,message1 
INT 21h 
MOV AH,1
INT 21h
MOV BL, AL 
MOV AH,2
MOV DL, 10
int 33
MOV DL, 13
int 33
MOV AH,9 
LEA DX,message2 
int 33
MOV AH,1
INT 21h 
MOV BH, AL 
SUB BL,BH 
ADD BL, 30h 
MOV AH,2
MOV DL, 10
int 33
MOV DL, 13
int 33
MOV AH,9 
LEA DX,message3 
int 21h
MOV AH,2 
MOV DL,BL
INT 21h 
SUBSTRAC ENDP
END SUBSTRAC