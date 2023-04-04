; Fichier asm obtenu depuis .tex
	const ax,main
	jmp ax
:puissance
; Number 125
	const ax,125
; Pousser une variable temporaire sur la pile
	push ax
; Number 45
	const ax,45
; Pousser une variable temporaire sur la pile
	push ax
; Multiplier deux expressions
	pop ax
	pop bx
	mul ax,bx
; Pousser une variable temporaire sur la pile
	push ax
; Number 65
	const ax,65
; Pousser une variable temporaire sur la pile
	push ax
; Soustraire deux expressions
	pop ax
	pop bx
	sub bx,ax
; Pousser une variable temporaire sur la pile
	push bx
; Number 23
	const ax,23
; Pousser une variable temporaire sur la pile
	push ax
; Additioner deux expressions
	pop ax
	pop bx
	add ax,bx
; Pousser une variable temporaire sur la pile
	push ax
; Ajoute xyz dans la pile
	pop ax
	push ax
:main
	const bp,pile
	cp sp,bp
	const ax,2
	sub sp,ax
	const ax,puissance
	call ax
	end
:pile
@int 0