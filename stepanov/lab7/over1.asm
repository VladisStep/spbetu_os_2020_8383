
CODE SEGMENT
	ASSUME CS:CODE, DS:NOTHING, SS:NOTHING
	
MAIN PROC FAR
	push ax
	push dx
	push ds
		
	mov ax, cs
	mov ds, ax
	
	mov di, offset STRING
	add di, 12
	call WRD_TO_HEX	
	mov dx, offset STRING
	call PRINT
		
	pop ds
	pop dx
	pop ax
	retf	
MAIN ENDP
;-------------------------------------------
STRING db 13, 10, "OVER1:             $"
;-------------------------------------------
WRD_TO_HEX PROC near
	push BX
	mov BH,AH
	call BYTE_TO_HEX 
	mov [DI],AH 
	dec DI
	mov [DI],AL 
	dec DI
	mov AL,BH
	call BYTE_TO_HEX 
	mov [DI],AH 
	dec DI
	mov [DI],AL 
	pop BX
	ret
WRD_TO_HEX ENDP
;-------------------------------------------
BYTE_TO_HEX PROC near
push CX
mov AH,AL
call TETR_TO_HEX
xchg AL,AH
mov CL,4
shr AL,CL
call TETR_TO_HEX 
pop CX
ret
BYTE_TO_HEX ENDP
;-------------------------------------------
TETR_TO_HEX PROC near
and      AL,0Fh
cmp      AL,09
jbe      NEXT
add      AL,07
NEXT:
 add      AL,30h
ret
TETR_TO_HEX ENDP
;-------------------------------------------
PRINT PROC near

	push ax
	sub ax, ax
	mov ah, 9h
	int 21h
	pop ax

	ret
PRINT ENDP
;-------------------------------------------
	
	
CODE ENDS
END MAIN