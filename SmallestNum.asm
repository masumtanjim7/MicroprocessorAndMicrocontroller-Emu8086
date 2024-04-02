.stack 100h
.data
msg db "Enter 1st number: $" 
msg1 db "Enter 2nd number: $"
msg2 db "Enter 3rd number: $"
msg3 db "Smallest value is : $"
.code
SMALLES PROC
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
 MOV BH,AL
 
 MOV AH,2 
 MOV DL,10
 INT 21H
 MOV DL,13
 INT 21H
 
 MOV AH,9
 LEA DX,msg2
 INT 21H
 
 MOV AH,1
 INT 21H
 MOV CL,AL
 
 MOV AH,2
 MOV DL,10
 INT 21H
 MOV DL,13
 INT 21H
 
 MOV AH,9
 LEA DX,msg3
 INT 21H
 
 CMP BH,BL
 JA smallb
 JB small
 
 small:
 CMP BH,CL
 JA smallc
 JB smalla
 
 smalla:
 MOV AH,2
 MOV DL,BH
 INT 21H
 JMP exit
 
 smallc:
 MOV AH,2
 MOV DL,CL
 INT 21H
 JMP exit 
 
 smallb:
 CMP BL,CL
 JA smallc
 JB smallb1 
 
 smallb1:
 MOV AH,2
 MOV DL,BL
 INT 21H
 JMP exit
 exit:
SMALLES  ENDP
