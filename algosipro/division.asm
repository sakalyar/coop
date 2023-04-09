; Fichier asm obtenu à partir d'un fichier latex 

	const ax,main
	jmp ax

:div_err_str
@string "Erreur : Division par 0 impossible\n"

:div_err
	const ax,div_err_str
	callprintfs ax
	end

:division
; Récupérez la variable a et placez-la en haut de la pile
	const ax,2
	const bx,2
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Récupérez la variable b et placez-la en haut de la pile
	const ax,2
	const bx,2
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Diviser deux expressions
	const cx,div_err
	pop ax
	pop bx
	div bx,ax
	jmpe cx
; Pousser une variable temporaire sur la pile
	push bx
	pop ax
	ret

:main
; initialistaion de la pile
	const bp,stack
	const sp,stack
	const ax,2
	sub sp,ax
; construction des parametres
	const ax,15
	push ax
	const ax,3
	push ax
; Appel de la founction division
	const ax,division
	call ax
;recuperer le resultat et affiche le
	push ax
	cp ax,sp
	callprintfd ax
	end
:stack
@int 0
