.stack 20h
.data
msg db 'Input first ID:$'
msg1 db 'Input second ID:$'
msg3 db 'Input third ID:$'
msg4 db 'Input fourth ID:$'
msg2 db 'Summation of four ID:$'
number1 dw ?
number2 dw ?
number3 dw ?
number4 dw ?
.code
TANJIM PROC
 
 MOV AX,@data
 MOV DS,AX
 
 LEA DX,msg
 MOV AH,9
 INT 21H
 ;input first id
 
 MOV DH,0
 MOV DL,0
 MOV CL,10 
 MOV CH,00
 TOP:
 MOV AH,1
 INT 21H
 
 CMP AL,13 
 JNE CAL
 JMP LAST
 CAL:
 MOV BL,AL
 SUB BL,30H
 MOV AX,DX 
 MUL CX 
 MOV DX,AX 
 ADD DX,BX
 JMP TOP
 LAST: 
 MOV number1,DX 
 
 
 MOV AH,2
 MOV DL,10
 INT 21h
 MOV DL,13
 INT 33
 
 ;input second id
 
 LEA DX,msg1
 MOV AH,9
 INT 21H
 MOV DH,0
 MOV DL,0
 MOV CL,10 
 MOV CH,00
 TOP1:
 MOV AH,1 
 INT 21H
 
 CMP AL,13 
 JNE CAL1
 JMP LAST1
 CAL1:
 MOV BL,AL
 SUB BL,30H
 MOV AX,DX 
 MUL CX 
 MOV DX,AX 
 ADD DX,BX
 JMP TOP1
 LAST1: 
 MOV number2,DX 
 
 MOV AH,2
 MOV DL,10
 INT 21H
 MOV DL,13
 INT 33 
 
 ; input third id
 
 LEA DX,msg3
 MOV AH,9
 INT 21h
 
 MOV DH,0
 MOV DL,0
 MOV CL,10 
 MOV CH,00
 TOP2:
 MOV AH,1 
 INT 21H
 
 CMP AL,13 
 JNE CAL2
 JMP LAST2
 CAL2:
 MOV BL,AL
 SUB BL,30H
 MOV AX,DX 
 MUL CX
 MOV DX,AX 
 ADD DX,BX
 JMP TOP2
 LAST2: 
 MOV number3,DX 
 
 MOV AH,2
 MOV DL,10
 INT 21H
 MOV DL,13
 INT 33 
 
 ;input fourth id
 
 LEA DX,msg4
 MOV AH,9
 INT 21H
 MOV DH,0
 MOV DL,0
 MOV CL,10 
 MOV CH,00
 TOP3:
 MOV AH,1
 INT 21H
 
 CMP AL,13 
 JNE CAL3
 JMP LAST3
 CAL3:
 MOV BL,AL
 SUB BL,30H
 MOV AX,DX 
 MUL CX 
 MOV DX,AX 
 ADD DX,BX
 JMP TOP3
 LAST3: 
 MOV number4,DX 
 
 MOV AH,2
 MOV DL,10
 INT 21H
 MOV DL,13
 INT 33 
 
 ;addition of four number
 LEA DX,msg2
 MOV AH,9
 INT 21H
 AND DX,0
 MOV AX,number1
 ADD AX,number2 
 ADD AX,number3
 ADD AX,number4 
 
 MOV CL,10D
 MOV CH,0
 TOP5:
 DIV CL 
 AND DX,0
 MOV DL,AH
 PUSH DX
 INC CH
 AND AH,0
 CMP AL,0
 JNE TOP5 
 
 ;print result 
 
 MOV AH,2 
 TOP6:
 POP DX
 ADD DL,30H
 INT 21H 
 DEC CH
 CMP CH,0
 JNE TOP6 
 
 TANJIM ENDP
END TANJIM