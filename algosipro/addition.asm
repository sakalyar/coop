; Fichier asm obtenu à partir d'un fichier latex 

	const ax,main
	jmp ax

:div_err_str
@string "Erreur : Division par 0 impossible\n"

:div_err
	const ax,div_err_str
	callprintfs ax
	end

:addition
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
; Add the p variable in the stack
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

:main
; initialistaion de la pile
	const bp,stack
	const sp,stack
	const ax,2
	sub sp,ax
; construction des parametres
	const ax,8
	push ax
	const ax,4
	push ax
; Appel de la founction addition
	const ax,addition
	call ax
;recuperer le resultat et affiche le
	push ax
	cp ax,sp
	callprintfd ax
	end
:stack
@int 0
