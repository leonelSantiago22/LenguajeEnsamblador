.MODEL SMALL
extrn desdec:near
extrn leedec:near
extrn reto:near
.STACK
.DATA
	contenedor dw ?
.CODE
main:	mov ax,@data
		mov ds,ax
		mov es,ax
		call leedec 
		push ax 		;[bp+8]
		call leedec 
		push ax 		;[bp+6]
		mov ax, offset contenedor 
		push ax			;[bp+4]
		call fun3 
		mov dx,contenedor
		call desdec
		.exit 0

fun3:	push bp 	;Movemos el base pointer la base de la pila 
		mov bp,sp 	;Creo el nuevo base pointer 
		mov bx,[bp+8]
		mov cx,[bp+6]
		cmp  bx,cx
		jle cas
		sub bx,cx
		mov ax,bx
		jmp sal

cas:	sub cx,bx
		mov ax,cx 
sal:	mov bx, [bp+4]
		mov [bx],ax
		mov sp,bp 		;movelos lo que tenemos en el base pointer al stack pointer apuntador de controlador de pila
		pop bp		;Salida del base pointer 

		ret


end