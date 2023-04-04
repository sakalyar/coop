; Fichier asm obtenu à partir d'un fichier latex
	const ax,main
	jmp ax
; Récupérez la variable b et placez-la en haut de la pile
	const ax,2
	const bx,1
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Récupérez la variable a et placez-la en haut de la pile
	const ax,2
	const bx,3
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Additioner deux expressions
	pop ax
	pop bx
	add ax,bx
; Pousser une variable temporaire sur la pile
	push ax
; Ajouter la variable p dans la pile
	pop ax
	push ax
; Récupérez la variable p et placez-la en haut de la pile
	const ax,2
	const bx,0
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
	pop ax
	pop dx
	ret
