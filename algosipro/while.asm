; Fichier asm obtenu à partir d'un fichier latex 

	const ax,main
	jmp ax

:div_err_str
@string "Erreur : Division par 0 impossible\n"

:div_err
	const ax,div_err_str
	callprintfs ax
	end

:while
; Début de la boucle do while
:while_0
; Récupérez la variable n et placez-la en haut de la pile
	const ax,2
	const bx,1
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Nombre 4
	const ax,4
; Pousser une variable temporaire sur la pile
	push ax
; Debut comparaison de l'operateur inf_1 
	pop ax
	pop bx
	const cx,inf_1
	sless bx,ax
	jmpc cx
; Cas faux(ID: 1)
	const ax,0
	push ax
	const ax,fin_inf_1
	jmp ax
; Cas vrai (ID: 1)
:inf_1
	const ax,1
	push ax
; Fin de comparaison de l'operateur inf_1 
:fin_inf_1
	pop ax
	const bx,0
	const cx,fin_while_0
	cmp ax,bx
	jmpc cx
; Récupérez la variable n et placez-la en haut de la pile
	const ax,2
	const bx,1
	mul ax,bx
	cp bx,sp
	sub bx,ax
	loadw ax,bx
	push ax
; Nombre 1
	const ax,1
; Pousser une variable temporaire sur la pile
	push ax
; Additioner deux expressions
	pop ax
	pop bx
	add ax,bx
; Pousser une variable temporaire sur la pile
	push ax
	const ax,while_0
	jmp ax
:fin_while_0
; Récupérez la variable n et placez-la en haut de la pile
	const ax,2
	const bx,2
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
	const ax,4
	push ax
; Appel de la founction while
	const ax,while
	call ax
;recuperer le resultat et affiche le
	push ax
	cp ax,sp
	callprintfd ax
	end
:stack
@int 0
