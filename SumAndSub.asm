.stack 100h
.data
msg db "Enter 1st number: $" 
msg1 db "Enter 2nd number: $"
msg2 db "Sum of two number is: $"
msg3 db "Subtraction of two is : $"
.code
SUMSUB PROC
 MOV AX,@DATA
 MOV DS,AX
 
 MOV AH,9
 LEA DX, msg
 INT 21H
 
 MOV AH,1
 INT 21H
 MOV BL,AL
 
 MOV AH,2
 MOV DL,10
 INT 21H
 MOV DL,13
 INT 21H
 
 MOV AH,9
 LEA DX,msg1
 INT 21H
 
 MOV AH,1
 INT 21H
 MOV CL,AL
 
 MOV AH,2 
 MOV DL,10
 INT 21H
 MOV DL,13
 INT 21H 
 
 MOV AH,2
 MOV DL,10
 INT 21H
 MOV DX,13
 INT 21H
 
 CMP BL,CL
 JA sub2
 JB addi 
 
 sub2: 
 SUB BL,CL
 ADD BL,30H
 
 MOV AH,9
 LEA DX,msg3
 INT 21H
 
 MOV AH,2
 MOV DL,BL
 INT 21H 
 JMP exit 
 
 addi:
 ADD BL,CL
 SUB BL,30H
 
 MOV AH,9
 LEA DX,msg2
 INT 21H
 
 MOV AH,2
 MOV DL,BL
 INT 21H
 
 exit:
SUMSUB ENDP
END SUMSUB
